@echo off

@call cleanit.bat

::Note: asm5900.exe does NOT return an error code when it fails, the comparisons here will not work
:: unless this is resolved by the author of that software.  Therefore you must watch the output to
:: be sure your project is building correctly.

asm5900 -o:TMP\PS1LOGO.BIN SRC\PS1LOGO.S
IF NOT %errorlevel%==0 GOTO error

asm5900 -o:TMP\PS1LOGO2.BIN SRC\PS1LOGO2.S
IF NOT %errorlevel%==0 GOTO error

:: DEV0 BUILDS FOR CC2.0
:: Build and pack the OSDSYS payload
asm5900 -o:TMP\OSDPAY.BIN SRC\OSDPAY.S
IF NOT %errorlevel%==0 GOTO error

n2epack TMP\OSDPAY.BIN TMP\OSDPAY.N2E
IF NOT %errorlevel%==0 GOTO error

:: Build and pack the OSDSYS payload DEV0
asm5900 -o:TMP\OSDPAYDEV0.BIN SRC\OSDPAY.S
IF NOT %errorlevel%==0 GOTO error

n2epack TMP\OSDPAYDEV0.BIN TMP\OSDPAY.N2E
IF NOT %errorlevel%==0 GOTO error

:: Build CC1.0 OSDSYS payload loader DEV0.
asm5900 -s:FWFS_TEMP_ADDR=0x00110000 -s:CC_USE_EEP=1 -s:CC_FORMAT_10=1 -s:PAYLOAD_TYPE=0 -o:TMP\OSLOAD10DEV0.BIN SRC\OSDLOAD.S
IF NOT %errorlevel%==0 GOTO error

:: Build CC1.1 OSDSYS payload loader DEV0.
asm5900 -s:FWFS_TEMP_ADDR=0x00110000 -s:CC_USE_EEP=1 -s:PAYLOAD_TYPE=0 -o:TMP\OSLOAD11DEV0.BIN SRC\OSDLOAD.S
IF NOT %errorlevel%==0 GOTO error

:: Build CC1.2 OSDSYS payload loader DEV0.
asm5900 -s:FWFS_TEMP_ADDR=0x00110000 -s:PAYLOAD_TYPE=0 -o:TMP\OSLOAD12DEV0.BIN SRC\OSDLOAD.S
IF NOT %errorlevel%==0 GOTO error

:: DEV1 BUILDS
:: Build and pack the OSDSYS payload DEV1
asm5900 -s:BOOT_DEV=1 -o:TMP\OSDPAYDEV1.BIN SRC\OSDPAY.S
IF NOT %errorlevel%==0 GOTO error

n2epack TMP\OSDPAYDEV1.BIN TMP\OSDPAY.N2E
IF NOT %errorlevel%==0 GOTO error

:: Build CC1.0 OSDSYS payload loader DEV1.
asm5900 -s:FWFS_TEMP_ADDR=0x00110000 -s:BOOT_DEV=1 -s:CC_USE_EEP=1 -s:CC_FORMAT_10=1 -s:PAYLOAD_TYPE=0 -o:TMP\OSLOAD10DEV1.BIN SRC\OSDLOAD.S
IF NOT %errorlevel%==0 GOTO error

:: Build CC1.1 OSDSYS payload loader DEV1.
asm5900 -s:FWFS_TEMP_ADDR=0x00110000 -s:BOOT_DEV=1 -s:CC_USE_EEP=1 -s:PAYLOAD_TYPE=0 -o:TMP\OSLOAD11DEV1.BIN SRC\OSDLOAD.S
IF NOT %errorlevel%==0 GOTO error

:: Build CC1.2 OSDSYS payload loader DEV1.
asm5900 -s:FWFS_TEMP_ADDR=0x00110000 -s:BOOT_DEV=1 -s:PAYLOAD_TYPE=0 -o:TMP\OSLOAD12DEV1.BIN SRC\OSDLOAD.S
IF NOT %errorlevel%==0 GOTO error

:: DEV2 BUILDS
:: Build and pack the OSDSYS payload DEV1
asm5900 -s:BOOT_DEV=2 -o:TMP\OSDPAYDEV2.BIN SRC\OSDPAY.S
IF NOT %errorlevel%==0 GOTO error

n2epack TMP\OSDPAYDEV2.BIN TMP\OSDPAY.N2E
IF NOT %errorlevel%==0 GOTO error

:: Build CC1.0 OSDSYS payload loader DEV2.
asm5900 -s:FWFS_TEMP_ADDR=0x00110000 -s:BOOT_DEV=2 -s:CC_USE_EEP=1 -s:CC_FORMAT_10=1 -s:PAYLOAD_TYPE=0 -o:TMP\OSLOAD10DEV2.BIN SRC\OSDLOAD.S
IF NOT %errorlevel%==0 GOTO error

:: Build CC1.1 OSDSYS payload loader DEV2.
asm5900 -s:FWFS_TEMP_ADDR=0x00110000 -s:BOOT_DEV=2 -s:CC_USE_EEP=1 -s:PAYLOAD_TYPE=0 -o:TMP\OSLOAD11DEV2.BIN SRC\OSDLOAD.S
IF NOT %errorlevel%==0 GOTO error

:: Build CC1.2 OSDSYS payload loader DEV2.
asm5900 -s:FWFS_TEMP_ADDR=0x00110000 -s:BOOT_DEV=2 -s:PAYLOAD_TYPE=0 -o:TMP\OSLOAD12DEV2.BIN SRC\OSDLOAD.S
IF NOT %errorlevel%==0 GOTO error

:: DEV3 BUILDS
:: Build and pack the OSDSYS payload DEV3
asm5900 -s:BOOT_DEV=3 -o:TMP\OSDPAYDEV3.BIN SRC\OSDPAY.S
IF NOT %errorlevel%==0 GOTO error

n2epack TMP\OSDPAYDEV3.BIN TMP\OSDPAY.N2E
IF NOT %errorlevel%==0 GOTO error

:: Build CC1.0 OSDSYS payload loader DEV3.
asm5900 -s:FWFS_TEMP_ADDR=0x00110000 -s:BOOT_DEV=3 -s:CC_USE_EEP=1 -s:CC_FORMAT_10=1 -s:PAYLOAD_TYPE=0 -o:TMP\OSLOAD10DEV3.BIN SRC\OSDLOAD.S
IF NOT %errorlevel%==0 GOTO error

:: Build CC1.1 OSDSYS payload loader DEV3.
asm5900 -s:FWFS_TEMP_ADDR=0x00110000 -s:BOOT_DEV=3 -s:CC_USE_EEP=1 -s:PAYLOAD_TYPE=0 -o:TMP\OSLOAD11DEV3.BIN SRC\OSDLOAD.S
IF NOT %errorlevel%==0 GOTO error

:: Build CC1.2 OSDSYS payload loader DEV3.
asm5900 -s:FWFS_TEMP_ADDR=0x00110000 -s:BOOT_DEV=3 -s:PAYLOAD_TYPE=0 -o:TMP\OSLOAD12DEV3.BIN SRC\OSDLOAD.S
IF NOT %errorlevel%==0 GOTO error

:: Build CC2.0 BM loader OSDSYS patches
asm5900 -s:PAYLOAD_ADDR=0x00180000 -s:FWFS_TEMP_ADDR=0x00170000 -o:TMP\IOPPAY.BIN SRC\IOPPAY.S
IF NOT %errorlevel%==0 GOTO error

asm5900 -s:PAYLOAD_ADDR=0x00180000 -o:TMP\IOPLOAD.BIN SRC\IOPLOAD.S
IF NOT %errorlevel%==0 GOTO error

asm5900 -s:BOOT_DEV=3 -o:TMP\OSDPAY.BIN SRC\OSDPAY.S
IF NOT %errorlevel%==0 GOTO error

n2epack TMP\OSDPAY.BIN TMP\OSDPAY.N2E
IF NOT %errorlevel%==0 GOTO error

asm5900 -s:FWFS_TEMP_ADDR=0x00110000 -s:BOOT_DEV=3 -o:TMP\OSLOAD20.BIN SRC\OSDLOAD.S
IF NOT %errorlevel%==0 GOTO error

:: Compile Firmwares
:: Compile CC1.0 FWARE with DEV0-2 Usage
ccitool -v1 TMP\OSLOAD10DEV0.BIN TMP\FWARE10DEV0.CCI
IF NOT %errorlevel%==0 GOTO error
ccitool -v1 TMP\OSLOAD10DEV1.BIN TMP\FWARE10DEV1.CCI
IF NOT %errorlevel%==0 GOTO error
ccitool -v1 TMP\OSLOAD10DEV2.BIN TMP\FWARE10DEV2.CCI
IF NOT %errorlevel%==0 GOTO error

:: Compile CC1.1 FWARE with DEV0-2 USAGE
ccitool TMP\OSLOAD11DEV0.BIN TMP\FWARE11DEV0.CCI
IF NOT %errorlevel%==0 GOTO error
ccitool TMP\OSLOAD11DEV1.BIN TMP\FWARE11DEV1.CCI
IF NOT %errorlevel%==0 GOTO error
ccitool TMP\OSLOAD11DEV2.BIN TMP\FWARE11DEV2.CCI
IF NOT %errorlevel%==0 GOTO error

:: Compile CC1.2 FWARE with DEV0-2 USAGE
ccitool TMP\OSLOAD12DEV0.BIN TMP\FWARE12DEV0.CCI
IF NOT %errorlevel%==0 GOTO error
ccitool TMP\OSLOAD12DEV1.BIN TMP\FWARE12DEV1.CCI
IF NOT %errorlevel%==0 GOTO error
ccitool TMP\OSLOAD12DEV2.BIN TMP\FWARE12DEV2.CCI
IF NOT %errorlevel%==0 GOTO error

:: Compile CC2.0 FWARE with DEV3 USAGE
ccitool TMP\OSLOAD20.BIN TMP\FWARE20.CCI
IF NOT %errorlevel%==0 GOTO error

copy TMP\PS1LOGO.BIN FILES\BM\FWS\PS1LOGO.BIN
copy TMP\PS1LOGO2.BIN FILES\BM\FWS\PS1LOGO2.BIN
copy TMP\*.CCI FILES\BM\FWS\LATEST

echo Crystal Chip firmware created successfully.
GOTO end

:error
echo !!! Firmware building stopped due to error. !!!

:end
pause
