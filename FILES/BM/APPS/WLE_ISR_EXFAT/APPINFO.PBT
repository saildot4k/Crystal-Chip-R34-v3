#
# Application Manager Script for BootManager 2
# Made with the "Application Manager Script Application"
# http://downlord.net/tools/pbtmaker.php
#

# Change this information to describe the application.
SET "TITLE" "wLE 4.43x_ISR EXFAT"
SET "VERSION" "4.43x_ISR"
SET "AUTHOR" "El Isra"
SET "DESC" "Application Launcher and File Manager w Exfat Support"
SET "MEDIAS" ""
#

# Do not change these 2 lines!
GOTO "$ARG1$"
RETURN "-1"

:LABEL_NAME
    ADDWIDGET "LABEL" "$ARG2$$TITLE$ v$VERSION$"
    EXIT "0"

:QUERY
    ADDWIDGET "CALL" "$TITLE$" "$BM.TXT_VERSION$: $VERSION$ $BM.TXT_AUTHOR$: $AUTHOR$ $BM.TXT_DESC$: $DESC$" $ARG2$ "$ARG0$" "$ARG3$" "$ARG4$" "$ARG5$"
    EXIT "0"

:INSTALL
    IF FAIL COPY "$PWD$" "$ARG2$:/BM/APPS/WLE_ISR_EXFAT"
        MESSAGE "Failed installing $TITLE$!"
        RRM "$ARG2$:/BM/APPS/WLE_ISR_EXFAT"
        RETURN -1
    ENDIF
    EXIT 0

:REMOVE
    IF FAIL RRM "$PWD$"
        MESSAGE "Failed removing $TITLE$!"
        RETURN -1
    ENDIF
    EXIT 0

:RUN
    ADDWIDGET "CALL" "$TITLE$ with SHUTDOWN" "Launch $TITLE$ with the SHUTDOWN Option" "$ARG0$" "RUN_WITH_OPTION" "1"
    ADDWIDGET "CALL" "$TITLE$ with autoload of drivers OFF" "Launch $TITLE$ with the AUTOLOAD_FSD_EN option" "$ARG0$" "RUN_WITH_OPTION" "2"
    ADDWIDGET "CALL" "$TITLE$ without any option" "Launch $TITLE$ without any option" "$ARG0$" "RUN_WITH_OPTION" "0"
    RETURN 0

:RUN_WITH_OPTION
    ECHO "$ARG2$"
    SWITCH "$ARG2$"
        CASE 1
        #SHUTDOWN
            ECHO "SHUTDOWN"
            SHUTDOWN "MM"
            BREAK
        CASE 2
        #DRIVERS ON
            ECHO "CC DRIVERS ON"
            SET "BM.AUTOLOAD_FSD_EN" "0"
            BREAK
        CASE 0
        #NONE
            DEFAULT
            ECHO "NONE"
            BREAK
    ENDS

    REDIRFILE "$PWD$/IPCONFIG.DAT" "$BM.BM_PATH$/CONFIG/IPCONFIG.DAT"
    LOADEXEC "PBAT" "$BM.SCRIPTS$/LOADEXEC.PBT" "$PWD$/WLE.ELF"
    EXIT "0"
