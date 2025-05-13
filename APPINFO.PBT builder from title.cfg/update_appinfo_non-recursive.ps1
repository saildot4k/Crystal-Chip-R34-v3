<#
.SYNOPSIS
  Creates or updates APPINFO.PBT in the current folder based on
  CRYSTALCHIPSAS.template and title.cfg (taking only the first occurrence of each key).
#>

#region Setup
# Ensure we run in this script’s folder
Set-Location (Split-Path -Parent $MyInvocation.MyCommand.Definition)

# Define paths
$template    = Join-Path (Get-Location) 'CRYSTALCHIPSAS.template'
$cfgFile     = Join-Path (Get-Location) 'title.cfg'
$appinfoFile = Join-Path (Get-Location) 'APPINFO.PBT'

# Validate inputs
if (-not (Test-Path $template)) {
    Write-Error "Template not found: $template"
    exit 1
}
if (-not (Test-Path $cfgFile)) {
    Write-Error "Config not found: $cfgFile"
    exit 1
}

# Copy template over (overwrite if exists)
Copy-Item -Path $template -Destination $appinfoFile -Force
#endregion

#region Parse title.cfg (first-occurrence only)
$cfg = @{}
Get-Content $cfgFile | ForEach-Object {
    if ($_ -match '^\s*([^#].*?)=(.+)$') {
        $k = $matches[1].Trim().ToLower()
        if (-not $cfg.ContainsKey($k)) {
            $cfg[$k] = $matches[2].Trim()
        }
    }
}
#endregion

#region Determine folder names
$currentFolder = Split-Path -Leaf (Get-Location)
$parentFolder  = Split-Path -Leaf (Split-Path -Parent (Get-Location))
#endregion

#region Load APPINFO.PBT and locate block
$lines = Get-Content $appinfoFile

# Find the "# Source:" line
$startMatch = $lines | Select-String -Pattern '^\s*#\s*Source:' -List | Select-Object -First 1
if (-not $startMatch) {
    Write-Error "Could not find '# Source:' in APPINFO.PBT"
    exit 1
}
$startIdx = $startMatch.LineNumber - 1

# Find all SAS_NON_MC lines and pick the last
$sasMatches = $lines | Select-String -Pattern '^\s*#?\s*SET\s+"SAS_NON_MC"'
if ($sasMatches.Count -eq 0) {
    Write-Error "Could not find any SAS_NON_MC lines in APPINFO.PBT"
    exit 1
}
$endIdx = ($sasMatches | Select-Object -Last 1).LineNumber - 1

# Split into before/block/after
$before = if ($startIdx -gt 0) { $lines[0..($startIdx-1)] } else { @() }
$after  = if ($endIdx + 1 -lt $lines.Count) { $lines[($endIdx+1)..($lines.Count-1)] } else { @() }
#endregion

#region Build replacement block
$newBlock = [System.Collections.Generic.List[string]]::new()

# 1) Dynamic Source
$srcVal = ($cfg['source'] -replace '"','\"')
$newBlock.Add("# Source: $srcVal")

# 2) SET lines from cfg
$map = @{
    title       = 'TITLE'
    version     = 'VERSION'
    developer   = 'AUTHOR'
    description = 'DESC'
    medias      = 'MEDIAS'
    boot        = 'ELF'
}
foreach ($key in 'title','version','developer','description','medias','boot') {
    if ($cfg.ContainsKey($key)) {
        $pbtKey = $map[$key]
        $val    = ($cfg[$key] -replace '"','\"')
        $newBlock.Add("SET `"$pbtKey`" `"$val`"")
    }
}

# 3) Dynamic SAS = current folder
$newBlock.Add("SET `"SAS`" `"$currentFolder`"")

# 4) Instructional comment
$newBlock.Add('# Comment out 1 of the 2 lines below. If app is in non-mc:/$SAS$ comment out the first, if in non-mc:/APPS/$SAS$ comment out the second')

# 5) Two SAS_NON_MC lines
if ($parentFolder -ieq 'APPS') {
    $newBlock.Add('# SET "SAS_NON_MC" "$SAS$"')
    $newBlock.Add('SET "SAS_NON_MC" "APPS/$SAS$"')
} else {
    $newBlock.Add('SET "SAS_NON_MC" "$SAS$"')
    $newBlock.Add('# SET "SAS_NON_MC" "APPS/$SAS$"')
}
#endregion

#region Write back APPINFO.PBT
$before + $newBlock + $after |
    Set-Content -LiteralPath $appinfoFile -Encoding UTF8

Write-Host "✅ APPINFO.PBT created/updated in '$(Get-Location)'"
Write-Host "   Source:        $srcVal"
Write-Host "   SAS:           $currentFolder"
Write-Host "   Parent folder: $parentFolder"
#endregion
