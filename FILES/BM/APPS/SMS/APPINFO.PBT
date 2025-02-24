#
# Application Manager Script for BootManager 2
#

# Change this information to describe the application.
SET "TITLE" "Simple Media Systme"
SET "VERSION" "2.9 rev4"
SET "AUTHOR" "EEUG"
SET "DESC" "SMS allows you to play your favorite Divx Movies on your PS2."
SET "MEDIAS" "SMS"
#

GOTO "$ARG1$"
RETURN "-1"

:LABEL_NAME
    ADDWIDGET "LABEL" "$ARG2$$TITLE$ v$VERSION$"
    EXIT 0

:QUERY
    ADDWIDGET "CALL" "$TITLE$" "$BM.TXT_VERSION$: $VERSION$ $BM.TXT_AUTHOR$: $AUTHOR$ $BM.TXT_DESC$: $DESC$" $ARG2$ "$ARG0$" "$ARG3$" "$ARG4$" "$ARG5$" 
    EXIT "0"

:INSTALL
    IF FAIL COPY "$PWD$" "$ARG2$:/BM/APPS/SMS"
        MESSAGE "Failed installing $TITLE$!"
        RRM "$ARG2$:/BM/APPS/SMS"
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
    SHUTDOWN "MM"
    LOADEXEC "PBAT" "$BM.SCRIPTS$/LOADEXEC.PBT" "$PWD$/SMS.ELF"
    EXIT "0"
