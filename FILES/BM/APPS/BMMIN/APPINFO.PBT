# BootManager 2 Application Manager Script for PS2 Browser

# Change this information to describe the application.
SET "TITLE" "BootManager minimal"
SET "VERSION" "2.1.6"
SET "AUTHOR" "CrystalChips"
SET "DESC" "This option installs BootManager without any additional drivers for USB, MMCE, HDD, or network!"
SET "MEDIAS" ""
#

GOTO "$ARG1$"

:LABEL_NAME
    ADDWIDGET "LABEL" "$ARG2$$TITLE$ v$VERSION$"
    EXIT 0

:QUERY
    ADDWIDGET "CALL" "$TITLE$" "$BM.TXT_VERSION$: $VERSION$ $BM.TXT_AUTHOR$: $AUTHOR$ $BM.TXT_DESC$: $DESC$" $ARG2$ "$ARG0$" "$ARG3$" "$ARG4$" "$ARG5$"
    EXIT "0"

:INSTALL

    PARSEPATH "$PWD$" "SRC_DEV" "SRC_PATH" "SRC_FILE"

    RM "$ARG2$:/BM"

    IF FAIL MKDIR "$ARG2$:/BM"
        MESSAGE "Failed to create $ARG2$:/BM!"
        RETURN -1
    ELSEIF FAIL COPY "$SRC_DEV$:/BM/BM2.ELF" "$ARG2$:/BM/BM2.ELF"
        MESSAGE "Failed to copy BM2.ELF!"
        RETURN -1
    ELSEIF FAIL COPY "$SRC_DEV$:/BM/SCRIPTS" "$ARG2$:/BM/SCRIPTS"
        MESSAGE "Failed to copy SCRIPTS!"
        RETURN -1
    ELSEIF FAIL COPY "$SRC_DEV$:/BM/BMAN.ICN" "$ARG2$:/BM/bman.icn"
        MESSAGE "Failed to copy bman.icn!"
        RETURN -1
    ELSEIF FAIL COPY "$SRC_DEV$:/BM/ICON.SYS" "$ARG2$:/BM/icon.sys"
        MESSAGE "Failed to copy icon.sys!"
        RETURN -1
    ELSEIF FAIL COPY "$SRC_DEV$:/BM/GFX" "$ARG2$:/BM/GFX"
        MESSAGE "Failed to copy GFX!"
        RETURN -1
    ELSEIF FAIL MKDIR "$ARG2$:/BM/THMS"
        MESSAGE "Failed to create $ARG2$:/BM/THMS"
        RETURN -1
    ELSEIF FAIL COPY "$SRC_DEV$:/BM/THMS/DEFAULT" "$ARG2$:/BM/THMS/DEFAULT"
        MESSAGE "Failed to copy default theme!"
        RETURN -1
    ELSEIF FAIL MKDIR "$ARG2$:/BM/LANG"
        MESSAGE "Failed to create LANG!"
        RETURN -1
    ELSEIF FAIL COPY "$SRC_DEV$:/BM/LANG/BMENGL.PBT" "$ARG2$:/BM/LANG/BMENGL.PBT"
        MESSAGE "Failed to copy BMENGL.PBT!"
        RETURN -1
    ELSEIF FAIL MKDIR "$ARG2$:/BM/SHARED"
        MESSAGE "Failed to create SHARED!"
        RETURN -1
    ELSEIF FAIL COPY "$SRC_DEV$:/BM/SHARED/IOMANX.IRX" "$ARG2$:/BM/SHARED/IOMANX.IRX"
        MESSAGE "Failed to copy IOMANX.IRX!"
        RETURN -1
    ELSEIF FAIL COPY "$SRC_DEV$:/BM/SHARED/POWEROFF.IRX" "$ARG2$:/BM/SHARED/POWEROFF.IRX"
        MESSAGE "Failed to copy POWEROFF.IRX!"
        RETURN -1
    ELSEIF FAIL COPY "$SRC_DEV$:/BM/SHARED/PS2DEV9.IRX" "$ARG2$:/BM/SHARED/PS2DEV9.IRX"
        MESSAGE "Failed to copy PS2DEV9.IRX!"
        RETURN -1
    ELSEIF FAIL COPY "$SRC_DEV$:/BM/STARTUP" "$ARG2$:/BM/STARTUP"
        MESSAGE "Failed to copy STARTUP!"
        RETURN -1
    ELSEIF FAIL COPY "$SRC_DEV$:/BM/FWS" "$ARG2$:/BM/FWS"
        MESSAGE "Failed to copy FWS!"
        RETURN -1
    ELSEIF FAIL MKDIR "$ARG2$:/BM/APPS"
        MESSAGE "Failed to create APPS!"
        RETURN -1
    ELSEIF FAIL MKDIR "$ARG2$:/BM/CONFIG"
        MESSAGE "Failed to create CONFIG!"
        RETURN -1
    ELSEIF FAIL COPY "$SRC_DEV$:/BM/APPS/OSDSYS" "$ARG2$:/BM/APPS/OSDSYS"
        MESSAGE "Failed to copy OSDSYS!"
        RETURN -1
    ELSEIF FAIL COPY "$SRC_DEV$:/BM/APPS/SCEDVD" "$ARG2$:/BM/APPS/SCEDVD"
        MESSAGE "Failed to copy SCEDVD!"
        RETURN -1
    ELSEIF FAIL MKDIR "$ARG2$:/BM/DEVS"
        MESSAGE "Failed to create DEVS!"
        RETURN -1
    ELSEIF FAIL COPY "$SRC_DEV$:/BM/DEVS/CDVD" "$ARG2$:/BM/DEVS/CDVD"
        MESSAGE "Failed to copy CDVD!"
        RETURN -1
    ELSEIF FAIL COPY "$SRC_DEV$:/BM/DEVS/DFFS" "$ARG2$:/BM/DEVS/DFFS"
        MESSAGE "Failed to copy DFFS!"
        RETURN -1
    ELSEIF FAIL COPY "$SRC_DEV$:/BM/DEVS/MEMCARD" "$ARG2$:/BM/DEVS/MEMCARD"
        MESSAGE "Failed to copy MEMCARD!"
        RETURN -1
    ENDIF

    EXIT "0"

:REMOVE
    EXIT "0"

:RUN
    EXIT "0"
