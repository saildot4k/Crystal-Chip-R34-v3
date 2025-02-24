#
# Application Manager Script for BootManager 2
#

# Change this information to describe the application.
# https://github.com/israpps/MechaconCrashTestAPP
SET "TITLE" "Mechacon Crash Tester"
SET "VERSION" "May 28,2024 b3bef1a"
SET "AUTHOR" "El Isra"
SET "DESC" "This program will check your console mechacon version and boot rom version to identify if your console is vulnerable to the mechacon crash."
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
    IF FAIL COPY "$PWD$" "$ARG2$:/BM/APPS/MECHACONCRASHTEST"
        MESSAGE "Failed installing $TITLE$!"
        RRM "$ARG2$:/BM/APPS/MECHACONCRASHTEST"
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
    LOADEXEC "PBAT" "$BM.SCRIPTS$/LOADEXEC.PBT" "$PWD$/mechacon_crash_tester.elf"
    EXIT "0"
