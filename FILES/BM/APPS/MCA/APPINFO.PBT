# Application Manager Script for BootManager 2
# Made with the "Application Manager Script Application"
# http://downlord.net/tools/pbtmaker.php
#

# Change this information to describe the application.
# https://www.psx-place.com/resources/memory-card-annihilator-coded-by-ffgriever-gfx-by-berion.673/
SET "TITLE" "Memory Card Annihilator"
SET "VERSION" "2.1.2 nightly"
SET "AUTHOR" "ffgriever, el Isra, gfx by Berion"
SET "DESC" "MCA formats and unformats a memory card, manages memory card images. WARNING: POTENTIAL DATA LOSS IF USED INCORRECTLY!"
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
    IF FAIL COPY "$PWD$" "$ARG2$:/BM/APPS/MCA"
        MESSAGE "Failed installing $TITLE$!"
        RRM "$ARG2$:/BM/APPS/MCA"
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
    LOADEXEC "PBAT" "$BM.SCRIPTS$/LOADEXEC.PBT" "$PWD$/mmca-packed.elf"
    EXIT "0"