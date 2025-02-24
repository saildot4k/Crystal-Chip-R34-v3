#
# Application Manager Script for BootManager 2
# Made with the "Application Manager Script Application"
# http://downlord.net/tools/pbtmaker.php
#

# Change this information to describe the application.
#  https://github.com/HiroTex/OSD-XMB
SET "TITLE" "OSD-XMB"
SET "VERSION" "1.3"
SET "AUTHOR" "Hiro-Tex"
SET "DESC" "User Interface for the PS2 resembling the PS3/PSP XMB Style, made on Athena Env' by DanielSant0s, and inspired by the XtremeEliteBoot+ dashboard by Howling Wolf & Chelsea."
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

    IF FAIL COPY "$PWD$" "$ARG2$:/BM/APPS/OSDXMB_INSTALLER"
        MESSAGE "Failed installing APPINFO.PBT!"
        RRM "$ARG2$:/BM/APPS/OSDXMB_INSTALLER"
        RETURN -1
    ELSEIF FAIL COPY "$SRC_DEV$:/BM/APPS/OSDXMB" "$ARG2$:/OSDXMB"
        MESSAGE "Failed installing to $SRC_DEV$:/OSDXMB"
        RRM "$ARG2$:/OSDXMB"
        RETURN -1
    ENDIF

    EXIT 0

:REMOVE
    PARSEPATH "$PWD$" "SRC_DEV" "SRC_PATH" "SRC_FILE"
    
    IF FAIL RRM "$PWD$"
        MESSAGE "Failed removing $TITLE$!"
        RETURN -1
    ELSEIF FAIL RRM "$SRC_DEV$:/OSDXMB"
        MESSAGE "Failed removing $SRC_DEV$:/OSDXMB !"
        RETURN -1
    ELSEIF FAIL RRM "$SRC_DEV$:/BM/APPS/OSDXMB"
        MESSAGE "Failed removing $SRC_DEV$:/BM/APPS/OSDXMB !"
        RETURN -1
    ENDIF

    EXIT 0

:RUN
    PARSEPATH "$PWD$" "SRC_DEV" "SRC_PATH" "SRC_FILE"

    IF NEQ "$SRC_DEV" "mass"
         MESSAGE "OSD-XMB only runs from USB!
         RETURN -1
    ELSE
        LOADEXEC "PBAT" "$BM.SCRIPTS$/LOADEXEC.PBT" "$SRC_DEV$/OSDXMB/OSDXMB.ELF"
    ENDIF

    EXIT 0