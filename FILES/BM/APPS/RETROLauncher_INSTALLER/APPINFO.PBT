#
# Application Manager Script for BootManager 2
# Made with the "Application Manager Script Application"
# http://downlord.net/tools/pbtmaker.php
#

# Change this information to describe the application.
#  https://github.com/Spaghetticode-Boon-Tobias/RETROLauncher
SET "TITLE" "RetroLauncher"
SET "VERSION" "1/27/25"
SET "AUTHOR" "Boon Tobias"
SET "DESC" "Retro game launcher"
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
    PARSEPATH "$PWD$" "SRC_DEV" "SRC_PATH" "SRC_FILE"

    IF FAIL COPY "$PWD$" "$ARG2$:/BM/APPS/RETROLauncher_INSTALLER"
        MESSAGE "Failed installing APPINFO.PBT!"
        RRM "$ARG2$:/BM/APPS/RETROLauncher_INSTALLER"
        RETURN -1
    ELSEIF FAIL COPY "$SRC_DEV$:/BM/APPS/RETROLauncher" "$ARG2$:/RETROLauncher"
        MESSAGE "Failed installing to $SRC_DEV$:/RETROLauncher"
        RRM "$ARG2$:/RETROLauncher"
        RETURN -1
    ENDIF

    EXIT 0

:REMOVE
    PARSEPATH "$PWD$" "SRC_DEV" "SRC_PATH" "SRC_FILE"
    
    IF FAIL RRM "$PWD$"
        MESSAGE "Failed removing $TITLE$!"
        RETURN -1
    ELSEIF FAIL RRM "$SRC_DEV$:/RETROLauncher"
        MESSAGE "Failed removing $SRC_DEV$:/RETROLauncher"
        RETURN -1
    ENDIF

    EXIT 0

:RUN
    PARSEPATH "$PWD$" "SRC_DEV" "SRC_PATH" "SRC_FILE"

    IF NEQ "$SRC_DEV$" "mass"
         MESSAGE "RETROLauncher only runs from USB!
         RETURN -1
    ELSE
        LOADEXEC "PBAT" "$BM.SCRIPTS$/LOADEXEC.PBT" "$SRC_DEV$/RETROLauncher/RETROLauncher.ELF"
    ENDIF

    EXIT 0