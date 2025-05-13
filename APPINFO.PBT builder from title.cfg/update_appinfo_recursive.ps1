<#
.SYNOPSIS
  Recursively generates or updates APPINFO.PBT next to every title.cfg,
  based on CRYSTALCHIPSAS.template and using only the first occurrence
  of each key in title.cfg (so the first title= wins over any Title=).
#>

[CmdletBinding()]
param(
  [string]$Root = (Get-Location)
)

# Locate the template
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$template  = Join-Path $scriptDir 'CRYSTALCHIPSAS.template'
if (-not (Test-Path $template)) {
    throw "Template file not found: $template"
}

function Update-AppInfoBlock {
    param(
      [string]$appinfoPath,
      [string]$cfgPath
    )

    # Parse title.cfg into a hashtable, but only first occurrence of each key
    $cfg = @{}
    Get-Content $cfgPath | ForEach-Object {
        if ($_ -match '^\s*([^#].*?)=(.+)$') {
            $k = $matches[1].Trim().ToLower()
            if (-not $cfg.ContainsKey($k)) {
                $cfg[$k] = $matches[2].Trim()
            }
        }
    }

    # Determine folder names
    $dir           = Split-Path -Parent $cfgPath
    $currentFolder = Split-Path -Leaf $dir
    $parentFolder  = Split-Path -Leaf (Split-Path -Parent $dir)

    # Load APPINFO.PBT
    $lines = Get-Content $appinfoPath

    # Find the start of the block ("# Source:")
    $startMatch = $lines |
      Select-String -Pattern '^\s*#\s*Source:' -List |
      Select-Object -First 1
    if (-not $startMatch) {
      Write-Warning "[$dir] – no '# Source:' marker found; skipping."
      return
    }
    $startIdx = $startMatch.LineNumber - 1

    # Find the last SAS_NON_MC line after start
    $sasMatches = $lines |
      Select-String -Pattern '^\s*#?\s*SET\s+"SAS_NON_MC"'
    if ($sasMatches.Count -eq 0) {
      Write-Warning "[$dir] – no SAS_NON_MC lines found; skipping."
      return
    }
    $endIdx = ($sasMatches | Select-Object -Last 1).LineNumber - 1

    # Split before/after
    $before = if ($startIdx -gt 0) { $lines[0..($startIdx-1)] } else { @() }
    $after  = if ($endIdx+1 -lt $lines.Count) { $lines[($endIdx+1)..($lines.Count-1)] } else { @() }

    # Build replacement block
    $newBlock = [System.Collections.Generic.List[string]]::new()

    # 1) Dynamic Source line
    $srcVal = ($cfg['source'] -replace '"','\"')
    $newBlock.Add("# Source: $srcVal")

    # 2) SET lines from cfg keys
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

    # 3) Dynamic SAS = current folder name
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

    # 6) Write it back
    ($before + $newBlock + $after) |
      Set-Content -LiteralPath $appinfoPath -Encoding UTF8

    Write-Host "[$dir] ✅ APPINFO.PBT created/updated"
}

# Recursively find every title.cfg and update its APPINFO.PBT
Get-ChildItem -Path $Root -Filter 'title.cfg' -Recurse | ForEach-Object {
    $dir     = $_.DirectoryName
    $cfgPath = $_.FullName
    $appinfo = Join-Path $dir 'APPINFO.PBT'

    # Copy the template to APPINFO.PBT (overwrite if exists)
    Copy-Item -Path $template -Destination $appinfo -Force

    # Update the block in the new APPINFO.PBT
    Update-AppInfoBlock -appinfoPath $appinfo -cfgPath $cfgPath
}

Write-Host "Done."
