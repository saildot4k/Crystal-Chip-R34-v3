#
# Application Manager Script for BootManager 2
# Made with the "Application Manager Script Application"
# http://downlord.net/tools/pbtmaker.php
#

# Change this information to describe the application.
SET "TITLE" "Neutrino"
SET "VERSION" "1.5.0"
SET "AUTHOR" "Maximus32"
SET "DESC" "Small, Fast and Modular PS2 Device Emulator"
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

    IF FAIL COPY "$PWD$" "$ARG2$:/BM/APPS/NEUTRINO_INSTALLER"
        MESSAGE "Failed installing APPINFO.PBT!"
        RRM "$ARG2$:/BM/APPS/NEUTRINO_INSTALLER"
        RETURN -1
    ELSEIF FAIL COPY "$SRC_DEV$:/BM/APPS/NEUTRINO" "$ARG2$:/NEUTRINO"
        MESSAGE "Failed installing to $SRC_DEV$:/NEUTRINO"
        RRM "$ARG2$:/NEUTRINO"
        RETURN -1
    ENDIF

    EXIT 0

:REMOVE
    PARSEPATH "$PWD$" "SRC_DEV" "SRC_PATH" "SRC_FILE"
    
    IF FAIL RRM "$PWD$"
        MESSAGE "Failed removing $TITLE$ !"
        RETURN -1
    ELSEIF FAIL RRM "$SRC_DEV$:/NEUTRINO"
        MESSAGE "Failed removing $SRC_DEV$:/NEUTRINO !"
        RETURN -1
    ELSEIF FAIL RRM "$SRC_DEV$:/BM/APPS/NEUTRINO"
        MESSAGE "Failed removing $SRC_DEV$:/BM/APPS/NEUTRINO !"
        RETURN -1
    ENDIF

    EXIT 0 

:RUN
    MESSAGE "Nuetrino is a backend. Please run frontend launcher instead!"

    EXIT 0 

