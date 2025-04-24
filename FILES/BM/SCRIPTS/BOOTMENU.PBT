# Crystal Chips BootManager "Boot Menu" PBAT Script v1.4
# (c) 2005 Crystal Chips - http://www.crystal-chips.com/
# For use only with Crystal Chips hardware and software.
#
# Modification Info:
# This file is unmodified.  If you modify this script and distribute it,
# please edit this text.  Please do not change the copyright information.
#
# Description:
# This script is used by BootManager(BM) to load and execute PS1, PS2 and DVD Video discs.
# You can modify this script to add more options to the Boot Menu when you select "Boot"
# from the Main Menu of BM.

GOTO "$ARG1$"
RETURN -1


:BOOT
IF EQU "$ARG2$" "PS1"
    GOTO "boot_PS1"
ELSEIF EQU "$ARG2$" "PS2"
    GOTO "boot_PS2"
ELSEIF EQU "$ARG2$" "DVDV"
    GOTO "boot_DVDV"
ELSEIF EQU "$ARG2$" "CDDA"
    GOTO "boot_CDDA"
ELSE
    ECHO "Unknown BOOT type: $ARG2$!"
    EXIT -1
ENDIF


:MENU
IF EQU "$ARG2$" "PS1"
    GOTO "menu_PS1"
ELSEIF EQU "$ARG2$" "PS2"
    GOTO "menu_PS2"
ELSEIF EQU "$ARG2$" "DVDV"
    GOTO "menu_DVDV"
ELSEIF EQU "$ARG2$" "CDDA"
    GOTO "menu_CDDA"
ELSE
    ECHO "Unknown MENU type: $ARG2$!"
    EXIT -1
ENDIF


###############################################################################
#                           Audio CD bootstrap                                #
###############################################################################

:boot_CDDA
:menu_CDDA

LOADEXEC "PBAT" "$BM.BM_PATH$/APPS/OSDSYS/APPINFO.PBT" "RUN"
EXIT 0


###############################################################################
#                           DVD Video bootstrap                               #
###############################################################################

:boot_DVDV
:menu_DVDV

LOADEXEC "PBAT" "$BM.BM_PATH$/APPS/SCEDVD/APPINFO.PBT" "RUN"
EXIT 0


###############################################################################
#                           PS1 Disc bootstrap                                #
###############################################################################

:boot_PS1

SHUTDOWN "MMIOP"

SET "IS_HOMEBREW" "1"

IF EQU "$MODE$" "SLEEP"
    ECHO "Booting PS1 disc in Sleep Mode..."

    # Disable disc authentication
    SETAUTH "OFF"

    # Disable BIOS patches
    SETBIOS "OFF"

    # Shutdown CC hardware interface and ModuleManager software
    SHUTDOWN "ALL"

    # Cycle the tray to cause the disc to be rechecked for disc authentication.
    CYCLETRAY "WAIT"
ELSE

    # Enable PS1 BIOS patches
    SETBIOS "PS1"

    # Load the CC SRAM
    IF GTE "$BM.BIOS_MAJOR_VER$" "2"
        IF GTE "$BM.BIOS_MINOR_VER$" "20"
            SET "PS1LOGO_FNAME" "$BM.BM_PATH$/FWS/PS1LOGO2.BIN"
        ELSE
            SET "PS1LOGO_FNAME" "$BM.BM_PATH$/FWS/PS1LOGO.BIN"
        ENDIF
    ELSE
        SET "PS1LOGO_FNAME" "$BM.BM_PATH$/FWS/PS1LOGO.BIN"
    ENDIF

    ECHO "Loading SRAM with '$PS1LOGO_FNAME$'..."

    IF FAIL LOADSRAM "$PS1LOGO_FNAME$"
        RETURN "-1"
    ENDIF

    IF EQU "$MODE$" "MINIMAL"
        # Shutdown ModuleManager software
        SHUTDOWN "MM"
    ENDIF
ENDIF

IF EQU "$IS_HOMEBREW$" "1"
    # Enable PS1 disc authentication for homebrew discs.
    SETAUTH "PS1"
ELSE
    # Disable PS1 disc authentication for non-homebrew discs.
    SETAUTH "OFF"
ENDIF

# cycle the tray if disc isn't already authenticated as PS1
GETDISKTYPE "DISK_TYPE"
IF NEQ "$DISK_TYPE$" "PS1_CD"
    IF FAIL CYCLETRAY "WAIT"
        ECHO "Failed to cycle tray!"
        RETURN "-1"
    ENDIF
ENDIF

ECHO "Executing rom0:PS1DRV $BM.BOOT_NAME$"

LOADEXEC "EEELF" "rom0:PS1DRV" "$BM.BOOT_NAME$"


###############################################################################
#                           PS2 Disc Boot Menu                                #
###############################################################################

:menu_PS1

# CLEARWIDGETS clears all items from the menu item list
CLEARWIDGETS

# Set the menu title
SETTITLE "PS1 $BM.TXT_BOOT_MENU$"

ADDWIDGET "CALL" "$BM.TXT_BOOT_ENHANCED$" "$BM.TXT_HINT_BOOT_ENHANCED$" "$ARG0$" "boot_PS1"
ADDWIDGET "CALL" "$BM.TXT_BOOT_MINIMAL$" "$BM.TXT_HINT_BOOT_MINIMAL$" "$ARG0$" "boot_PS1" "MINIMAL"
ADDWIDGET "CALL" "$BM.TXT_BOOT_SLEEP$" "$BM.TXT_HINT_BOOT_SLEEP$" "$ARG0$" "boot_PS1" "SLEEP"

RETURN "0"


###############################################################################
#                           PS2 Disc bootstrap                                #
###############################################################################

:boot_PS2

SET "MODE" "$ARG2$"

SET "IS_HOMEBREW" "1"

IF EQU "$MODE$" "SLEEP"
    ECHO "Booting PS2 disc in Sleep Mode..."

    # Disable disc authentication
    SETAUTH "OFF"

    # Disable BIOS patches
    SETBIOS "OFF"

    # Shutdown CC hardware interface and ModuleManager software
    SHUTDOWN "ALL"

    # Cycle the tray to cause the disc to be rechecked for disc authentication.
    CYCLETRAY "WAIT"
ELSEIF EQU "$MODE$" "MINIMAL"
    ECHO "Booting PS2 disc in Minimal Mode..."

    # Shutdown ModuleManager software
    SHUTDOWN "MM"

    SETBIOS "PS2"

    IF EQU "$IS_HOMEBREW$" "0"
        # Disable PS2 disc authentication for non-homebrew discs.
        SETAUTH "OFF"

        IF FAIL CYCLETRAY "WAIT"
            RETURN -1
        ENDIF
    ENDIF

    # Reset PS2 auth, improves performance when used with cheat devices.
    SETAUTH "PS2"
ELSE
    ECHO "Booting PS2 disc with enhancements..."

    IF EQU "$IS_HOMEBREW$" "0"
        # Disable PS2 disc authentication for non-homebrew discs.
        SETAUTH "OFF"

        IF FAIL CYCLETRAY "WAIT"
            RETURN -1
        ENDIF
    ENDIF

    GETDISKTYPE "DISK_TYPE"
    # cycle the tray if disc isn't already authenticated as PS2
    IF NEQ "$DISK_TYPE$" "PS2_DVD"
        IF NEQ "$DISK_TYPE$" "PS2_CD"
            CYCLETRAY "WAIT"
        ENDIF
    ENDIF

    # Reset PS2 auth, improves performance when used with cheat devices.
    SETAUTH "PS2"
ENDIF

ECHO "Executing $BM.BOOT_NAME$..."

# Execute the main executable of the disc.
LOADEXEC "EEELF" "$BM.BOOT_NAME$;1"


###############################################################################
#                           PS2 Disc Boot Menu                                #
###############################################################################

:menu_PS2

# CLEARWIDGETS clears all items from the menu item list
CLEARWIDGETS

# Set the menu title
SETTITLE "PS2 $BM.TXT_BOOT_MENU$"

ADDWIDGET "CALL" "$BM.TXT_BOOT_ENHANCED$" "$BM.TXT_HINT_BOOT_ENHANCED$" "$ARG0$" "boot_PS2"
ADDWIDGET "CALL" "$BM.TXT_BOOT_MINIMAL$" "$BM.TXT_HINT_BOOT_MINIMAL$" "$ARG0$" "boot_PS2" "MINIMAL"
ADDWIDGET "CALL" "$BM.TXT_BOOT_SLEEP$" "$BM.TXT_HINT_BOOT_SLEEP$" "$ARG0$" "boot_PS2" "SLEEP"

RETURN "0"