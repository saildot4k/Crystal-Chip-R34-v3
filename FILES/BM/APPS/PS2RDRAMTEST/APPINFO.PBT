#
# Application Manager Script for BootManager 2
#

# Change this information to describe the application.
SET "TITLE" "PS2 RDRAM Test"
SET "VERSION" "1.0"
SET "AUTHOR" "krat0s"
SET "DESC" "Test your PS2 RDRAM"
SET "MEDIAS" ""
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
    IF FAIL COPY "$PWD$" "$ARG2$:/BM/APPS/PS2RDRAMTEST"
        MESSAGE "Failed installing $TITLE$!"
        RRM "$ARG2$:/BM/APPS/PS2RDRAMTEST"
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
    LOADEXEC "PBAT" "$BM.SCRIPTS$/LOADEXEC.PBT" "$PWD$/PS2RDRAMTEST.ELF"
    EXIT "0"
