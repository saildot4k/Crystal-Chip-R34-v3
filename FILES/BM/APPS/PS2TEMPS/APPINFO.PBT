#
# Application Manager Script for BootManager 2
# Made with the "Application Manager Script Application"
# http://downlord.net/tools/pbtmaker.php
#

# Change this information to describe the application.
SET "TITLE" "PS2 Temps"
SET "VERSION" "1.0"
SET "AUTHOR" "jolek and akuhak"
SET "DESC" "Monitor your PS2 CPU and Mechacon Temps (if applicable)"
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
    IF FAIL COPY "$PWD$" "$ARG2$:/BM/APPS/PS2TEMPS"
        MESSAGE "Failed installing $TITLE$!"
        RRM "$ARG2$:/BM/APPS/PS2TEMPS"
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
    LOADEXEC "PBAT" "$BM.SCRIPTS$/LOADEXEC.PBT" "$PWD$/PS2Temps.elf"
    EXIT "0"