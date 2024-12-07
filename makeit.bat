@echo off

@call makeit_nocd.bat

cd-tool -b -f iso-template.bin -o cc-upgrade.bin -e "main()" cc-upg-builder.lua
IF NOT %errorlevel%==0 GOTO error

echo Crystal Chip firmware upgrade disc image created successfully.
GOTO end

:error
echo !!! Firmware building stopped due to error. !!!

:end
pause
