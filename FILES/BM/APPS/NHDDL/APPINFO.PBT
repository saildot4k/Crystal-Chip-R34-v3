#
# Application Manager Script for BootManager 2
# Made with the "Application Manager Script Application"
# http://downlord.net/tools/pbtmaker.php
#

# Change this information to describe the application.
SET "TITLE" "NHDDL"
SET "VERSION" "1.1.2 MMCE + HDL Beta 3"
SET "AUTHOR" "PCM720"
SET "DESC" "PS2 Launcher for Neutrino"
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

    IF FAIL COPY "$PWD$" "$ARG2$:/BM/APPS/NHDDL"
        MESSAGE "Failed installing $TITLE$!"
        RRM "$ARG2$:/BM/APPS/NHDDL"
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
#    SET "BM.AUTOLOAD_FSD_EN" "0"
    SHUTDOWN "MM"
    LOADEXEC "PBAT" "$BM.SCRIPTS$/LOADEXEC.PBT" "$PWD$/nhddl.elf"
    EXIT "0"