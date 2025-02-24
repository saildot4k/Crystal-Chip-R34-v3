#
# Application Manager Script for BootManager 2
#

# Change this information to describe the application.
# https://github.com/ps2dev/ps2link
SET "TITLE" "PS2Link"
SET "VERSION" "1.91"
SET "AUTHOR" "PS2DEV.org"
SET "DESC" "Run applications and transfer files over network."
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
    IF FAIL COPY "$PWD$" "$ARG2$:/BM/APPS/PS2LINK"
        MESSAGE "Failed installing $TITLE$!"
        RRM "$ARG2$:/BM/APPS/PS2LINK"
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
    REDIRFILE "$PWD$/IPCONFIG.DAT" "$BM.BM_PATH$/CONFIG/IPCONFIG.DAT"
    LOADEXEC "PBAT" "$BM.SCRIPTS$/LOADEXEC.PBT" "$PWD$/PS2LINK.ELF"
    EXIT "0"
