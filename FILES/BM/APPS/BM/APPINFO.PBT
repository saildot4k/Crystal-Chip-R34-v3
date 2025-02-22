# BootManager 2 Application Manager Script for PS2 Browser

# Change this information to describe the application.
SET "TITLE" "BootManager"
SET "VERSION" "2.1.6"
SET "AUTHOR" "CrystalChips"
SET "DESC" "BootManager allows you to boot PS1, PS2 and DVD discs as well as homebrew applications and more!"
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
    ELSEIF FAIL COPY "$SRC_DEV$:/BM/SHARED" "$ARG2$:/BM/SHARED"
        MESSAGE "Failed to copy SHARED!"
        RETURN -1
    ELSEIF FAIL COPY "$SRC_DEV$:/BM/STARTUP" "$ARG2$:/BM/STARTUP"
        MESSAGE "Failed to copy STARTUP!"
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
    ELSEIF FAIL COPY "$SRC_DEV$:/BM/DEVS" "$ARG2$:/BM/DEVS"
        MESSAGE "Failed to copy DEVS!"
        RETURN -1
    ENDIF

# Do not install FW files on dffs
    IF EQU "$ARG2$" "dffs"
        IF FAIL MKDIR "$ARG2$:/BM/FWS"
            MESSAGE "Failed to create FWS!"
            RETURN -1
        ELSEIF FAIL COPY "$SRC_DEV$:/BM/FWS/PS1LOGO.BIN" "$ARG2$:/BM/FWS/PS1LOGO.BIN"
            MESSAGE "Failed to copy PS1LOGO.BIN"
            RETURN -1
        ELSEIF FAIL COPY "$SRC_DEV$:/BM/FWS/PS1LOGO2.BIN" "$ARG2$:/BM/FWS/PS1LOGO2.BIN"
            MESSAGE "Failed to copy PS1LOGO2.BIN"
            RETURN -1
        ENDIF
    ELSEIF NEQ "$ARG2$" "dffs"
        IF FAIL COPY "$SRC_DEV$:/BM/FWS" "$ARG2$:/BM/FWS"
            MESSAGE "Failed to copy FWS!"
            RETURN -1
        ENDIF
    ENDIF

    EXIT "0"

:REMOVE
    EXIT "0"

:RUN
    EXIT "0"
