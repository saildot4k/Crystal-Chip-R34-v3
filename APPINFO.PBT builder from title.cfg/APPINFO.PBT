# SAS (Save Application Support) compliant BM Script:
# Due to wildcard bug on memory card, APPINFO.PBT can not be in root folders where elf exists, so APPINFO.PBT will be in mc?:/BM/APPS/
# Memory Card structure mc?:/BM/APPS/$SAS$/APPINFO.PBT and elf in mc?:/$SAS$/APPINFO.PBT
# Non-Memory Card Structure: device:/$SAS$/APPINFO.PBT or device:/APPS/$SAS$/APPINFO.PBT NOTE: $PWD$ should work for both.

# Change this information to describe the application and where it should be ran from for memcard (SAS) or other devices (SAS_NON_MC)
# SAS is the App folder name. SAS_NON_MC defines if app is in root of non-memcard device (non_mc:/$SAS$) or APP folder (non_mc:/APPS/$SAS$)
# This is so that you do not have to edit any info below line 20.
#
# Some devices are case sensitive! Make sure your case matches!
#
# Source: website here
SET "TITLE" "Appname"
SET "VERSION" "version"
SET "AUTHOR" "authors here"
SET "DESC" "Short blurb"
SET "MEDIAS" ""
SET "ELF" "PS2Temps.elf"
SET "SAS" "DST_PS2TEMPS"
# Comment out 1 of the 2 lines below. If app is in non-mc:/$SAS$ comment out line 19. If app is in non-mc:/APPS/$SAS$ comment out line 18
# SET "SAS_NON_MC" "$SAS$"
SET "SAS_NON_MC" "APPS/$SAS$"
#


# Do not change these 2 lines!
GOTO "$ARG1$"
RETURN -1

# :LABEL_NAME
#     ADDWIDGET "LABEL" "$ARG2$$TITLE$ v$VERSION$"
#     EXIT 0

:QUERY
    ADDWIDGET "CALL" "$TITLE$" "$BM.TXT_VERSION$: $VERSION$ $BM.TXT_AUTHOR$: $AUTHOR$ $BM.TXT_DESC$: $DESC$" $ARG2$ "$ARG0$" "$ARG3$" "$ARG4$" "$ARG5$"
    EXIT 0

:INSTALL
    PARSEPATH "$PWD$" "SRC_DEV" "SRC_PATH" "SRC_FILE"


    IF MATCHES "mc?" "$SRC_DEV$"
        IF MATCHES "mc?" "$ARG2$"
            GOTO "INSTALL_MC_TO_MC"
        ELSEIF NOT MATCHES "mc?" "$ARG2$"
            GOTO "INSTALL_MC_TO_NONMC"
        ENDIF
    ELSEIF NOT MATCHES "mc?" "$SRC_DEV$"
        IF MATCHES "mc?" "$ARG2$"
            GOTO "INSTALL_NONMC_TO_MC"
        ELSEIF NOT MATCHES "mc?" "$ARG2$"
            GOTO "INSTALL_NONMC_TO_NONMC"
        ENDIF

:INSTALL_MC_TO_MC
    # Copies where APPINFO.PBT can be found in mc?:/BM/APPS/$SAS$
    IF FAIL COPY "$PWD$" "$ARG2$:/BM/APPS/$SAS$"
        MESSAGE "Failed installing APPINFO.PBT"
        RRM "$ARG2$:/BM/APPS/$SAS$"
        RETURN -1
    # Copies SAS app folder from root of mc? for SAS support
    ELSEIF FAIL COPY "$SRC_DEV$:/$SAS$" "$ARG2$:/$SAS$"
        MESSAGE "Failed installing $TITLE$"
        RRM "$ARG2$:/$SAS$"
        RETURN -1
    ELSEIF NOT EXISTS "$ARG2$:/BM/bman.icn"
        GOTO "INSTALL_MC_ICON"
    ELSEIF NOT EXISTS "$ARG2$:/BM/icon.sys"
        GOTO "INSTALL_MC_ICON"
    ENDIF
    EXIT 0

:INSTALL_MC_TO_NONMC
    IF FAIL COPY "$SRC_DEV$:/$SAS$" "$ARG2$:/$SAS_NON_MC$"
        MESSAGE "Failed installing $TITLE$"
        RRM "$ARG2$:/$SAS_NON_MC$"
        RETURN -1
    ENDIF
    EXIT 0

:INSTALL_NONMC_TO_NONMC
    IF FAIL COPY "$PWD$" "$ARG2$:/$SAS_NON_MC$"
        MESSAGE "Failed installing $TITLE$"
        RRM "$ARG2$:/$SAS_NON_MC$"
        RETURN -1
    ENDIF
    EXIT 0

:INSTALL_NONMC_TO_MC
    # Creates folder and copies where APPINFO.PBT can be found in mc?:/BM/APPS/$SAS$
    # NOTE: COPY function below fails HOWEVER does create the $SAS$ folder with nothing in it...
    # this is why I (R3Z3N) do not use IF FAIL COPY. Trust me, I tried the usual way as found in the BM installer APPINFO.PBT
    # Odd. Had to use a bug to create this folder...notice the slash at end of destination
    COPY "$PWD$" "$ARG2$:/BM/APPS/$SAS$/"
    # Copies where APPINFO.PBT can be found in mc?:/BM/APPS/$SAS$/APPINFO.PBT
    IF FAIL COPY "$ARG0$" "$ARG2$:/BM/APPS/$SAS$/APPINFO.PBT"
        MESSAGE "Failed installing APPINFO.PBT"
        RRM "$ARG2$:/BM/APPS/$SAS$"
        RETURN -1
    # Copies SAS app folder to root of mc? for SAS support
    ELSEIF FAIL COPY "$PWD$" "$ARG2$:/$SAS$"
        ECHO "Failed installing $TITLE$"
        MESSAGE "Failed installing $TITLE$"
        RRM "$ARG2$:/$SAS$"
        RETURN -1
    # Create icons if needed so OSDSYS does not show corrupt
    ELSEIF NOT EXISTS "$ARG2$:/BM/bman.icn"
        GOTO "INSTALL_MC_ICON"
    ELSEIF NOT EXISTS "$ARG2$:/BM/icon.sys"
        GOTO "INSTALL_MC_ICON"
    ENDIF
    EXIT 0

:INSTALL_MC_ICON
    IF FAIL COPY "$BM.BM_PATH$/bman.icn" "$ARG2$:/BM/bman.icn"
        MESSAGE "Failed to install $BM.BM_PATH$/bman.icn"
        RETURN -1
    ELSEIF FAIL COPY "$BM.BM_PATH$/icon.sys" "$ARG2$:/BM/icon.sys"
        MESSAGE "Failed to install $BM.BM_PATH$/bman.icn"
        RETURN -1
    ENDIF
    EXIT 0

:REMOVE
    PARSEPATH "$PWD$" "SRC_DEV" "SRC_PATH" "SRC_FILE"

    IF MATCHES "mc?" "$SRC_DEV$"
        GOTO "REMOVE_MC"
    ELSEIF NOT MATCHES "mc?" "$SRC_DEV$"
        GOTO "REMOVE_NON_MC"
    ENDIF

:REMOVE_MC
    IF FAIL RRM "$SRC_DEV$:/$SAS$"
        MESSAGE "Failed removing $SRC_DEV$:/$SAS$"
        RETURN -1
    ELSEIF FAIL RRM "$PWD$"
        MESSAGE "Failed removing $TITLE$"
        RETURN -1
    ENDIF
    EXIT 0

:REMOVE_NON_MC
    IF FAIL RRM "$PWD$"
        GOTO "REMOVE_NON_MC"
        MESSAGE "Failed removing $TITLE$"
        RETURN -1
    ENDIF
    EXIT 0

:RUN
    PARSEPATH "$PWD$" "SRC_DEV" "SRC_PATH" "SRC_FILE"

    IF MATCHES "mc?" "$SRC_DEV$"
        LOADEXEC "PBAT" "$BM.SCRIPTS$/LOADEXEC.PBT" "$SRC_DEV$:/$SAS$/$ELF$"
    ELSEIF NOT MATCHES "mc?" "$SRC_DEV$"
        LOADEXEC "PBAT" "$BM.SCRIPTS$/LOADEXEC.PBT" "$PWD$/$ELF$"
    ENDIF
    EXIT 0
