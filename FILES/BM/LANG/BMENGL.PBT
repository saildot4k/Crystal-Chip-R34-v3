#
# English translation of Crystal Chips BootManager menu for BMMENUS.PBT v1.4
# Only intended to use with the R34 modified v3 release by R3Z3N.
#

# Check the menu script version to be sure this script supports it.
IF NEQ "$BM.MENU_MAJOR_VER$" "1"
    ECHO "Unsupported menu version v$BM.MENU_MAJOR_VER$.$BM.MENU_MINOR_VER$!"
    EXIT 0
ELSEIF NEQ "$BM.MENU_MINOR_VER$" "4"
    ECHO "Unsupported menu version v$BM.MENU_MAJOR_VER$.$BM.MENU_MINOR_VER$!"
    EXIT 0
ENDIF

SET "TITLE" "English"
SET "DESC" "English language file."

# Do not change these 2 lines!
GOTO "$ARG1$"
RETURN "-1"

:LABEL_NAME
    ADDWIDGET "LABEL" "$ARG2$$TITLE$"
    EXIT "0"

:QUERY
    ADDWIDGET "CALL" "$TITLE$" "$DESC$" $ARG2$ "$ARG0$" "$ARG3$" "$ARG4$" "$ARG5$"
    EXIT "0"

:INSTALL
    COPY "$PWD$/BMENGL.PBT" "$BM.BM_PATH$/LANG/BMENGL.PBT"
    EXIT 0

:REMOVE
#    RRM "$ARG0$"
    EXIT 0

:LOAD
ECHO "Loading English text..."

# Miscellaneous
SET "BM.TXT_YES" "Yes"
SET "BM.TXT_NO" "No"
SET "BM.TXT_ON" "ON"
SET "BM.TXT_AUTO" "AUTO"
SET "BM.TXT_OFF" "OFF"
SET "BM.TXT_BOOT" "BOOT"
SET "BM.TXT_APP" "APP"
SET "BM.TXT_STANDARD" "STANDARD"
SET "BM.TXT_FAST" "FAST"
SET "BM.TXT_SMOOTH" "SMOOTH"
SET "BM.TXT_AUTHOR" "Author(s)"
SET "BM.TXT_VERSION" "Version"
SET "BM.TXT_DESC" "Description"
SET "BM.TXT_DELAY" "Delay(sec)"
SET "BM.TXT_CONFIRM" "Are you sure?"
SET "BM.TXT_BACK" "Back to Top"
SET "BM.TXT_HINT_BACK" "Return to the top of the menu."
SET "BM.TXT_CHOOSE_DEST" "Choose Destination"
SET "BM.TXT_MAIN" "Back to Main Menu"
SET "BM.TXT_CURRENT" "Current"
SET "BM.TXT_CONFIRM_CHOICE" "Confirm Choice"
SET "BM.TXT_HINT_CANCEL_CHOICE" "Cancel and return to previous menu."
SET "BM.TXT_HINT_CONFIRM_CHOICE" "Confirm choice."

#Media
SET "BM.TXT_PS1" "PS1"
SET "BM.TXT_PS2" "PS2"
SET "BM.TXT_DVDV" "DVD Video"
SET "BM.TXT_CDDA" "CD Audio"
SET "BM.TXT_OTHER" "Other"
SET "BM.TXT_NODISC" "No Disc"

SET "BM.TXT_LANGUAGE" "Language"
SET "BM.TXT_HINT_BM_LANG" "Set the language used by BootManager."
SET "BM.TXT_INSTALL_LANG" "Install Language"
SET "BM.TXT_HINT_INSTALL_LANG" "Install additional language files."
SET "BM.TXT_REMOVE_LANG" "Remove Language"
SET "BM.TXT_HINT_REMOVE_LANG" "Remove installed language files."
SET "BM.TXT_CHOOSE_LANG" "Choose Language"
SET "BM.TXT_SOURCE_DEV" "Choose Source Device"
SET "BM.TXT_LANG_INST_AVAIL" "Available Languages"
SET "BM.TXT_LANG_REMOVE_AVAIL" "Installed Languages"

# Main Menu
SET "BM.TXT_MAIN_MENU" "Main Menu"

# Install BootManager
SET "BM.TXT_INST_BM" "Install BootManager"
SET "BM.TXT_HINT_INST_BM" "Install BootManager."
SET "BM.TXT_CHOOSE_INST_BM" "Choose Install Option"
SET "BM.TXT_FULL" "Full"
SET "BM.TXT_HINT_FULL" "Install BootManager with all device drivers."
SET "BM.TXT_MINIMAL" "Minimal"
SET "BM.TXT_HINT_MINIMAL" "Install BootManager without additional device drivers for USB, HDD and network."
SET "BM.TXT_INSTALL_BM_TO" "Install BootManager to..."

# Firmware Manager
SET "BM.TXT_UPG_FIRMWARE" "Upgrade Firmware"
SET "BM.TXT_HINT_UPG_FIRMWARE" "Upgrade your CC firmware from this disc."

SET "BM.TXT_FORMAT_DFFS" "Format DFFS"
SET "BM.TXT_HINT_FORMAT_DFFS" "Format the Crystal Chip flash."
SET "BM.TXT_DFFS_REM_BM" "Remove dffs:/BM"
SET "BM.TXT_HINT_DFFS_REM_BM" "Remove BootManager directory from the Crystal Chip flash."
SET "BM.TXT_FW_MANAGER" "Firmware Manager"
SET "BM.TXT_HINT_FW_MANAGER" "Firmware Manager lets you upgrade and erase your Crystal Chip firmware."
SET "BM.TXT_UPG_FW" "Upgrade Firmware"
SET "BM.TXT_HINT_UPG_FW" "Upgrade your CrystalChip firmware from CCI file."
SET "BM.TXT_ERASE_FW" "Erase Firmware"
SET "BM.TXT_HINT_ERASE_FW" "Completely erase the contents of your CrystalChip flash/EEPROM."
SET "BM.TXT_ASK_ERASE_FW" "Are you sure you want to erase your firmware?"

SET "BM.TXT_FW_TITLE" "Firmware Variations:"
SET "BM.TXT_FW_QUESTION" "Run Boot Manager from which interface?"
SET "BM.TXT_FW_MC0" "1- BM runs from Memory Card 1"
SET "BM.TXT_FW_MC0_HINT" "Install CC FW and runs BM on MemCard1"
SET "BM.TXT_FW_MC1" "2- BM runs from Memory Card 2"
SET "BM.TXT_FW_MC1_HINT" "Install CC FW and runs BM on MemCard1"
SET "BM.TXT_FW_USB" "3- BM runs from USB"
SET "BM.TXT_FW_USB_HINT" "Install CC FW and runs BM on USB. IMPORTANT: USB Drivers MUST be installed to MemCard1 via Device Manager"
SET "BM.TXT_FW_HDD" "4- BM runs from HDD"
SET "BM.TXT_FW_HDD_HINT" "Install CC FW and runs BM on HDD. IMPORTANT: HDD Drivers MUST be installed to MemCard1 via Device Manager"

# Reload Menu
SET "BM.TXT_RELOAD_MENU" "Reload Menu"
SET "BM.TXT_HINT_RELOAD_MENU" "Reload the BMMENUS.PBT file."

# Boot Menu
SET "BM.TXT_BOOT_MEDIA" "Boot Media"
SET "BM.TXT_HINT_BOOT_MENU" "Boot games and applications from disc."

# Application Browser
SET "BM.TXT_APP_BROWSER" "Application Browser"
SET "BM.TXT_HINT_APP_BROWSER" "Run homebrew applications from Memory Card, CD/DVD, USB, HDD, etc."
SET "BM.TXT_APP" "Application(s)"
SET "BM.TXT_APPS" "Applications"
SET "BM.TXT_DEV" "Device(s)"
SET "BM.TXT_DEVS" "Devices"
SET "BM.TXT_THM" "Theme(s)"
SET "BM.TXT_THMS" "Themes"
SET "BM.TXT_MENU_INSTALL" "Install"
SET "BM.TXT_INSTALL_AVAIL" "Available on"
SET "BM.TXT_MENU_REMOVE" "Remove"
SET "BM.TXT_REMOVE_AVAIL" "Installed on"

# Run Application Browser
SET "BM.TXT_MENU_RUN" "Run"
SET "BM.TXT_HINT_RUN_APP" "Run an application from a device."
SET "BM.TXT_RUN_APP_FROM" "Run Application from"
SET "BM.TXT_RUN_AVAIL" "Executable on"

# Install Application Browser
SET "BM.TXT_HINT_INSTALL_APP" "Install an application from one device to another."
SET "BM.TXT_INSTALL_APP_FROM" "Install Application(s) from"
SET "BM.TXT_INSTALL_APP_TO" "Install Application to"

# Remove Application Browser
SET "BM.TXT_HINT_REMOVE_APP" "Remove an application from a device."
SET "BM.TXT_REMOVE_APP_FROM" "Remove Application(s) from"

# Dev Manager
SET "BM.TXT_DEV_MANAGER" "Device Manager"
SET "BM.TXT_HINT_DEV_MANAGER" "Install and remove device drivers."

# Install Device
SET "BM.TXT_HINT_INSTALL_DEV" "Install the drivers for devices."
SET "BM.TXT_INSTALL_DEV_FROM" "Install Device(s) from"
SET "BM.TXT_INSTALL_DEV_TO" "Install Device to"

# Remove Device
SET "BM.TXT_HINT_REMOVE_DEV" "Remove the drivers for devices."
SET "BM.TXT_REMOVE_DEV_FROM" "Remove Device Drivers from"

# Devices
SET "BM.TXT_MC_DESC" "Memory Card Slot"
SET "BM.TXT_MMCE_DESC" "Multipurpose Memory Card Emulator Slot"
SET "BM.TXT_MMCE_DESC_1" "MMCE driver"
SET "BM.TXT_CCFLASH_DESC" "Crystal Chip FlashDrive"
SET "BM.TXT_CDVD_DESC" "CD/DVD Disc Drive"
SET "BM.TXT_HOST_DESC" "PC Host via PS2Client"
SET "BM.TXT_HOST_DESC_1" "PC Host driver"
SET "BM.TXT_USB_DESC" "USB Drive"
SET "BM.TXT_USB_DESC_1" "USB drivers"
SET "BM.TXT_HDD_DESC" "PS2 Hard Drive"
SET "BM.TXT_HDD_DESC_1" "PS2 HDD drivers"
SET "BM.TXT_FTP_DESC" "FTP driver"
SET "BM.TXT_NET" "Network"
SET "BM.TXT_NET_DESC" "PS2 Network drivers"

# Memory Card Manager
SET "BM.TXT_MC_MANAGER" "Memory Card Manager"
SET "BM.TXT_HINT_MC_MANAGER" "Format Memory Cards, Remove BootManager, etc."

SET "BM.TXT_MC_REM_ALL_APPS" "Remove all Applications"
SET "BM.TXT_HINT_MC_REM_ALL_APPS" "Remove all applications from the Memory Card in slot 1."
SET "BM.TXT_MC_REM_BOOT" "Remove mc0:/BOOT"
SET "BM.TXT_HINT_MC_REM_BOOT" "Remove BootManager 1.x directory from the Memory Card in slot 1."
SET "BM.TXT_MC_REM_BM" "Remove mc0:/BM"
SET "BM.TXT_HINT_MC_REM_BM" "Remove BootManager 2.x directory from the Memory Card in slot 1."
SET "BM.TXT_MC0_COPY_HOST" "Copy mc0:/* to HOST"
SET "BM.TXT_HINT_MC0_COPY_HOST" "Copy the whole content from the Memory Card in slot 1 to host."
SET "BM.TXT_MC1_COPY_HOST" "Copy mc1:/* to HOST"
SET "BM.TXT_HINT_MC1_COPY_HOST" "Copy the whole content from the Memory Card in slot 2 to host."
SET "BM.TXT_MC0_ERASE" "Erase mc0:/*"
SET "BM.TXT_HINT_MC0_ERASE" "Delete the whole content on the Memory Card in slot 1."
SET "BM.TXT_MC1_ERASE" "Erase mc1:/*"
SET "BM.TXT_HINT_MC1_ERASE" "Delete the whole content on the Memory Card in slot 2."

# System Information
SET "BM.TXT_SYS_INFO" "System Information"
SET "BM.TXT_HINT_SYS_INFO" "View information about your system hardware."
SET "BM.TXT_CONSOLE_BIOS" "Console BOOTROM"
SET "BM.TXT_CONSOLE_VERSION" "Console Version"
SET "BM.TXT_CONSOLE_REGION" "Region Info"
SET "BM.TXT_CONSOLE_MODEL" "Console Model"

# Configuration Menu
SET "BM.TXT_CONFIGURATION" "Configuration"
SET "BM.TXT_HINT_CONFIGURATION" "Change BootManager and CrystalChip settings."
SET "BM.TXT_INTERF_CONFIG" "Interface"
SET "BM.TXT_SOFTWARE_CONFIG" "Software Configuration"

# BootManager Configuration
SET "BM.TXT_BM_CONFIG" "BootManager Configuration"
SET "BM.TXT_HINT_BM_CONFIG" "Change settings for BootManager."

SET "BM.TXT_BM_VIDEO_MODE" "BM Video Mode"
SET "BM.TXT_HINT_BM_VIDEO_MODE" "!! WARNING !! This will change the video mode bootmanager uses!"

SET "BM.TXT_BM_SCREEN_POS" "BM Screen Position"
SET "BM.TXT_HINT_BM_SCREEN_POS" "Adjust the BootManager screen position."

SET "BM.TXT_HINT_SCROLLBAR" "Hint Scrollbar"
SET "BM.TXT_HINT_HINT_SCROLLBAR" "Turn on and off the Hint Scrollbar at the bottom of the screen."

SET "BM.TXT_SCROLLBAR_SPEED" "Hint Scrollbar Speed"
SET "BM.TXT_HINT_SCROLLBAR_SPEED" "Set the speed of the Hint Scrollbar."

# Network Configuration Menu
SET "BM.TXT_NET_CONFIG" "Network"
SET "BM.TXT_HINT_NET_CONFIG" "Change your PS2 Network Settings."

SET "BM.TXT_START_NET" "Start Network"
SET "BM.TXT_HINT_START_NET" "Start the PS2 Network."
SET "BM.TXT_START_HOST" "Start PC Host Server"
SET "BM.TXT_HINT_START_HOST" "Start the PS2 PC Host server."
SET "BM.TXT_START_FTP" "Start FTP Server"
SET "BM.TXT_HINT_START_FTP" "Start the PS2 FTP server."

SET "BM.TXT_AUTOSTART_NET" "Auto Start Network"
SET "BM.TXT_HINT_AUTOSTART_NET" "Automatically start the network when BM starts."
SET "BM.TXT_AUTOSTART_HOST" "Auto Start PC Host Server"
SET "BM.TXT_HINT_AUTOSTART_HOST" "Automatically start the PC Host server when BM starts."
SET "BM.TXT_AUTOSTART_FTP" "Auto Start FTP Server"
SET "BM.TXT_HINT_AUTOSTART_FTP" "Automatically start the FTP server when BM starts."

SET "BM.TXT_PS2_IP" "PS2 IP"
SET "BM.TXT_HINT_PS2_IP" "This is the IP address of the PS2."
SET "BM.TXT_SUBNET_MASK" "Subnet Mask"
SET "BM.TXT_HINT_SUBNET_MASK" "This is the Subnet Mask of the network, typically 255.255.255.0."
SET "BM.TXT_DEF_GATEWAY" "Default Gateway"
SET "BM.TXT_HINT_DEF_GATEWAY" "This is the IP address of the network Default Gateway."

SET "BM.TXT_PRIMARY_DNS" "Primary DNS Server"
SET "BM.TXT_HINT_PRIMARY_DNS" "This is the IP address of the Primary DNS server."
SET "BM.TXT_SECONDARY_DNS" "Secondary DNS Server"
SET "BM.TXT_HINT_SECONDARY_DNS" "This is the IP address of the Secondary DNS server."

# HDD Configuration Menu
SET "BM.TXT_HDD_CONFIG" "HDD"
SET "BM.TXT_HINT_HDD_CONFIG" "Change your PS2 HDD Settings."

SET "BM.TXT_START_HDD" "Start HDD"
SET "BM.TXT_HINT_START_HDD" "Load HDD drivers and mount HDD."

SET "BM.TXT_AUTOSTART_HDD" "Auto-start HDD"
SET "BM.TXT_HINT_AUTOSTART_HDD" "Automaticaly load HDD drivers and mount HDD on BM startup."

# Autoload Configuration
SET "BM.TXT_AUTOLOAD_CONFIG" "Autoload"
SET "BM.TXT_HINT_AUTOLOAD_CONFIG" "Setup Autoloading of various types of software."

SET "BM.TXT_AUTOLOAD" "Autoload"
SET "BM.TXT_HINT_AUTOLOAD" "Turn on and off Autoloading."

SET "BM.TXT_ACTION" "Action"

SET "BM.TXT_AUTOLOAD_PS1" "Autoload PS1"
SET "BM.TXT_HINT_AL_ACT_PS1" "This is the action which will be taken when a PS1 disc is loaded."
SET "BM.TXT_AL_PS1_APP_FROM" "Choose PS1 Autoload App from"
SET "BM.TXT_AL_PS1_AVAIL" "Available for PS1 Autoload on"

SET "BM.TXT_AUTOLOAD_PS2" "Autoload PS2"
SET "BM.TXT_HINT_AL_ACT_PS2" "This is the action which will be taken when a PS2 disc is loaded."
SET "BM.TXT_AL_PS2_APP_FROM" "Choose PS2 Autoload App from"
SET "BM.TXT_AL_PS2_AVAIL" "Available for PS2 Autoload on"

SET "BM.TXT_AUTOLOAD_DVDV" "Autoload DVD Video"
SET "BM.TXT_HINT_AL_ACT_DVDV" "This is the action which will be taken when a DVD Video disc is loaded."
SET "BM.TXT_AL_DVDV_APP_FROM" "Choose DVD Video Autoload App from"
SET "BM.TXT_AL_DVDV_AVAIL" "Available for DVD Video Autoload on"

SET "BM.TXT_AUTOLOAD_CDDA" "Autoload CD Audio"
SET "BM.TXT_HINT_AL_ACT_CDDA" "This is the action which will be taken when a CD Audio disc is loaded."
SET "BM.TXT_AL_CDDA_APP_FROM" "Choose CD Audio Autoload App from"
SET "BM.TXT_AL_CDDA_AVAIL" "Available for CD Audio Autoload on"

SET "BM.TXT_AUTOLOAD_OTHER" "Autoload Other"
SET "BM.TXT_HINT_AL_ACT_OTHER" "This is the action which will be taken when an 'other' type of disc is loaded."
SET "BM.TXT_AL_OTHER_APP_FROM" "Choose Other Disc Autoload App from"
SET "BM.TXT_AL_OTHER_AVAIL" "Available for Other Disc Autoload on"

SET "BM.TXT_AUTOLOAD_NODISC" "Autoload No Disc"
SET "BM.TXT_HINT_AL_ACT_NODISC" "This is the action which will be taken when no disc is inserted."
SET "BM.TXT_AL_NODISC_APP_FROM" "Choose No Disc Autoload App from"
SET "BM.TXT_AL_NODISC_AVAIL" "Available for No Disc Autoload on"

SET "BM.TXT_SET_AL_APP" "Set Autoload Application"
SET "BM.TXT_HINT_SET_AL_APP" "Choose the application that will be executed on Autoload of this disc."

SET "BM.TXT_AL_DELAY" "Autoload Delay(sec)"
SET "BM.TXT_HINT_AL_DELAY" "Set the idle delay, in seconds, before BM will Autoload."

# PS1 Configuration Menu
SET "BM.TXT_PS1_CONFIG" "PS1"
SET "BM.TXT_HINT_PS1_CONFIG" "Change the settings for PS1 games and software."

SET "BM.TXT_DISC_SPEED" "Disc Speed"
SET "BM.TXT_HINT_DISC_SPEED" "This option allows you to speed up disc access for PS1 software. Please note that this option may not be compatible with all PS1 software."

SET "BM.TXT_TEX_MAPPING" "Texture Mapping"
SET "BM.TXT_HINT_TEX_MAPPING" "This option allows you to smooth out the textures in PS1 software. Please note that this option may not be compatible with all PS1 software."

# Common for PS1 and PS2
SET "BM.TXT_NTSC_SW_VID_FIXES" "NTSC Software Video Fixes"
SET "BM.TXT_HINT_NTSC_SW_VID_FIXES" "Turn NTSC software video fixes on or off."

SET "BM.TXT_PAL_SW_VID_FIXES" "PAL Software Video Fixes"
SET "BM.TXT_HINT_PAL_SW_VID_FIXES" "Turn PAL software video fixes on or off."

SET "BM.TXT_FORCE_VSYNC" "Force Vertical Sync"
SET "BM.TXT_HINT_FORCE_VSYNC" "Force the vertical sync for your software."

SET "BM.TXT_FORCE_COLOR" "Force Color"
SET "BM.TXT_HINT_FORCE_COLOR" "Force the color for your software."

SET "BM.TXT_SCREEN_MODS" "Screen Position Modifiers"
SET "BM.TXT_HINT_SCREEN_MODS" "This setting allows you to turn on or off screen position modification."

SET "BM.TXT_SCREEN_MOD" "Screen X/Y Modifier"
SET "BM.TXT_HINT_SCREEN_MOD" "This modifier is used to offset the X(horizontal) and Y(vertical) video position of software."

# PS2 Configuration Menu
SET "BM.TXT_PS2_CONFIG" "PS2"
SET "BM.TXT_HINT_PS2_CONFIG" "Change the settings for PS2 games and software."

SET "BM.TXT_MEGAMEM_PATCHER" "MegaMemory Patcher"
SET "BM.TXT_HINT_MEGAMEM_PATCHER" "Turn on/off patcher for enabling older MegaMemory/MAX Memory cards."

SET "BM.TXT_ATAD_PATCHER" "ATAD(HDD) Patcher"
SET "BM.TXT_HINT_ATAD_PATCHER" "Turn on/off patcher for ATAD to unlock non-Sony HDD with HDD-enabled PS2 games."

SET "BM.TXT_DVDDL_PATCHER" "DVD+R Dual Layer Patcher"
SET "BM.TXT_HINT_DVDDL_PATCHER" "Turn on/off patcher for DVD+R Dual Layer discs."

# DVD Configuration Menu
SET "BM.TXT_DVD_CONFIG" "DVD Video"
SET "BM.TXT_HINT_DVD_CONFIG" "Change the settings for DVD Videos."

SET "BM.TXT_DVD_VIDEO_FIXES" "DVD Video Fixes"
SET "BM.TXT_HINT_DVD_VIDEO_FIXES" "Turn DVD Video Fixes on and off."

SET "BM.TXT_REGION_FREE" "Region Free"
SET "BM.TXT_HINT_REGION_FREE" "This feature allows you to watch import DVD videos on your PS2."

SET "BM.TXT_DVD_PLAYER_REGION" "DVD Player Region"
SET "BM.TXT_HINT_DVD_PLAYER_REGION" "This feature allows you to set the DVD player region for RCE protected films.  You normally want to leave this set to 1."

SET "BM.TXT_RGB_FIX" "RGB Fix"
SET "BM.TXT_HINT_RGB_FIX" "This feature allows you to fix the 'Green Screen' problem when watching DVD videos."

SET "BM.TXT_VIDEO_STAB" "Video Stabilizer"
SET "BM.TXT_HINT_VIDEO_STAB" "This allows you to disable Macrovision output, improving video quality in some cases."

SET "BM.TXT_HINT_FORCE_COLOR_DVD" "This feature allows you to force the color of DVD videos."

# Disc Boot Menu
SET "BM.TXT_BOOT_MENU" "Disc Boot Menu"
SET "BM.TXT_BOOT_ENHANCED" "Boot in Enhanced Mode"
SET "BM.TXT_HINT_BOOT_ENHANCED" "Boot the disc with currently selected enhancement enabled."
SET "BM.TXT_BOOT_MINIMAL" "Boot in Minimal Mode"
SET "BM.TXT_HINT_BOOT_MINIMAL" "Boot the disc with mimimal enhancements enabled."
SET "BM.TXT_BOOT_SLEEP" "Boot in Sleep Mode"
SET "BM.TXT_HINT_BOOT_SLEEP" "Boot the disc with all enhancements and Crystal Chip disabled."

# Theme Manager
SET "BM.TXT_THEME_MANAGER" "Theme"
SET "BM.TXT_HINT_THEME_MANAGER" "Configure, change, install and remove your BootManager themes."
SET "BM.TXT_SELECTED_THEME" "Selected Theme"
SET "BM.TXT_MANAGE_THEME" "Manage Themes"

# Theme Configuration
SET "BM.TXT_THEMES" "Themes"
SET "BM.TXT_THEME_CONFIG" "Theme"
SET "BM.TXT_HINT_THEME_CONFIG" "Configure the BootManager menu theme."

SET "BM.TXT_XY" "X/Y Position"
SET "BM.TXT_WH" "Width/Height"

SET "BM.TXT_THEME_MENU_IMG" "Menu Image"
SET "BM.TXT_HINT_THEME_MENU_IMG_XY" "Adjust the X/Y screen position for the menu image."
SET "BM.TXT_HINT_THEME_MENU_IMG_WH" "Adjust the width/height of the menu image."

SET "BM.TXT_THEME_DISC_IMG" "Disc Image"
SET "BM.TXT_HINT_DISC_IMG_XY" "Adjust the X/Y screen position for the disc icon image."
SET "BM.TXT_HINT_DISC_IMG_WH" "Adjust the width/height of the disc icon image."

SET "BM.TXT_THEME_MENU_TEXT" "Menu"
SET "BM.TXT_HINT_THEME_MENU_XY" "Adjust the X/Y screen position for the menu."
SET "BM.TXT_HINT_THEME_MENU_WH" "Adjust the width/height of the menu."

SET "BM.TXT_THEME_MENU_TITLE" "Menu Title"
SET "BM.TXT_HINT_THEME_MENU_TITLE_XY" "Adjust the X/Y screen position for the menu title."
SET "BM.TXT_HINT_THEME_MENU_TITLE_WH" "Adjust the width/height of the menu title."

SET "BM.TXT_BM_VERSION" "BM Version Label"
SET "BM.TXT_HINT_BM_VERSION" "Adjust the X/Y screen position for the BM version text."

SET "BM.TXT_THEME_SCROLLER" "Hint Scrollbar"
SET "BM.TXT_HINT_THEME_SCROLLER_XY" "Adjust the X/Y screen position for the menu scrollbar."
SET "BM.TXT_HINT_THEME_SCROLLER_WH" "Adjust the width/height of the menu scrollbar."

SET "BM.TXT_THEME_COLOR" "Theme Colors"
SET "BM.TXT_THEME_BG_COLOR" "Background Color"
SET "BM.TXT_HINT_THEME_BG_COLOR" "Choose the background color."
SET "BM.TXT_THEME_FONT_COLOR" "Font Color"
SET "BM.TXT_HINT_THEME_FONT_COLOR" "Choose the menu font color."
SET "BM.TXT_THEME_FONT_COLOR_LABEL" "Font Title Color"
SET "BM.TXT_HINT_THEME_FONT_COLOR_LABEL" "Choose the font title and label color."
SET "BM.TXT_THEME_FONT_COLOR_SCROLLER" "Scroller Color"
SET "BM.TXT_HINT_THEME_FONT_COLOR_SCROLLER" "Choose the hint scroller color."

# Change Theme
SET "BM.TXT_MENU_CHANGE" "Change"
SET "BM.TXT_HINT_THEME_CHANGE" "Select a new theme and change the look of BootManager."
SET "BM.TXT_CHANGE_THM_FROM" "Select Theme from"
SET "BM.TXT_CHANGE_AVAIL" "Available Themes on"

# Install Themes
SET "BM.TXT_HINT_THEME_INSTALL" "Install a theme from one device to another."
SET "BM.TXT_INSTALL_THM_FROM" "Install Theme(s) from"
SET "BM.TXT_INSTALL_THM_TO" "Install Theme to"

# Remove Themes
SET "BM.TXT_HINT_THEME_REMOVE" "Remove a theme from a device."
SET "BM.TXT_REMOVE_THM_FROM" "Remove Theme(s) from"

# Disc Test
SET "BM.TXT_PS1_TEST_INFO" "Disc Test will now test your Crystal Chip PS1(aka SCEx) authentication."
SET "BM.TXT_START_PS1_TEST" "Start PS1 Disc Test"

SET "BM.TXT_DISC_TEST" "Disc Test"
SET "BM.TXT_HINT_DISC_TEST" "Disc Test allows you to verify your Crystal Chip installation by testing PS1(aka SCEx) authentication."

SET "BM.TXT_PS1_WORK" "PS1 disc authentication works!"
SET "BM.TXT_PS1_FAIL" "PS1 disc authentication failed!"

SET "BM.TXT_CHECK_SX" "Please check your CrystalChip SX wire."

# Misc Config
SET "BM.TXT_MISC_CONFIG" "Miscellaneous"
SET "BM.TXT_HINT_MISC_CONFIG" "Miscellaneous configuration options that don't fit in any other category."

SET "BM.TXT_GS_HOOK" "GS Hook"
SET "BM.TXT_HINT_GS_HOOK" "The CrystalChip GS Hook is used to perform advanced video fixes for PS2 software but may be incompatible with some games."

SET "BM.TXT_IGR" "In-Game Reset"
SET "BM.TXT_HINT_IGR" "In-Game Reset(IGR) allows you to reset your PS2 by pressing and holding L1+L2+R1+R2+Start+Select from within a PS2 game."

# Video Wizard
SET "BM.TXT_VID_WIZ" "Video Wizard"
SET "BM.TXT_VID_WIZ_1" "This wizard will help you determine what video modes your TV supports."
SET "BM.TXT_VID_WIZ_2" "When the wizard is completed, it will automatically select the best video configuration options for your TV."
SET "BM.TXT_VID_WIZ_3" "Each step will test a different video mode and require you to select an option based on what you see on screen."
SET "BM.TXT_VID_WIZ_4" "If you cannot see what is on the screen after 10 seconds, hit X once and wait 10 seconds for the next screen."
SET "BM.TXT_VID_WIZ_START" "Begin Testing"
SET "BM.TXT_HINT_VID_WIZ_START" "Start the Video Wizard video mode test."

#Video Test
SET "BM.TXT_TEST_50HZ" "Test 50Hz"
SET "BM.TXT_TEST_PAL" "Test PAL Color"
SET "BM.TXT_TEST_60HZ" "Test 60Hz"
SET "BM.TXT_TEST_NTSC" "Test NTSC Color"
SET "BM.TXT_CAN_YOU_READ" "Can you read this screen?"
SET "BM.TXT_YES_BUT" "Yes but the screen is 'rolling'."
SET "BM.TXT_SCREEN_COLOR" "Is this screen in color?"

SET "BM.TXT_TEST_RESULTS" "Video Test Results"
SET "BM.TXT_TEST_COMPLETE" "Testing is now complete!"
SET "BM.TXT_50HZ_YES" "Your TV can display 50Hz."
SET "BM.TXT_50HZ_NO" "Your TV cannot display 50Hz."
SET "BM.TXT_60HZ_YES" "Your TV can display 60Hz."
SET "BM.TXT_60HZ_NO" "Your TV cannot display 60Hz."
SET "BM.TXT_PAL_YES" "Your TV can display PAL color."
SET "BM.TXT_PAL_NO" "Your TV cannot display PAL color."
SET "BM.TXT_NTSC_YES" "Your TV can display NTSC color."
SET "BM.TXT_NTSC_NO" "Your TV cannot display NTSC color."
SET "BM.TXT_DONE" "Done"
SET "BM.TXT_RETURN_CONFIG" "Return to Configuration Menu."

#Lockout/Pin Mode
SET "BM.TXT_CNF_LOCKOUT" "Security"
SET "BM.TXT_CNF_LOCKOUT_HINT" "Lockout functions from BootManager with a PIN."
SET "BM.TXT_CNF_LOCKOUT_LABEL1" "Lockout all functions except for"
SET "BM.TXT_CNF_LOCKOUT_LABEL2" "booting discs and apps."
SET "BM.TXT_CNF_LOCKOUT_LABEL3" "Input your PIN to unlock all functions."
SET "BM.TXT_CNF_LOCKOUT_LABEL4" "To clear a forgotten PIN, reinstall BootManager."
SET "BM.TXT_PIN_SETUP" "Choose a PIN"
SET "BM.TXT_PIN_SETUP_HINT" "Input a PIN to be used to lockout advanced functions in BootManager."
SET "BM.TXT_PIN_CONF" "Confirm your chosen PIN"
SET "BM.TXT_PIN_CONF_HINT" "Confirm your PIN to be used to lockout advanced functions in BootManager"
SET "BM.TXT_PIN_UNLOCK" "Input your PIN to unlock all menus."
SET "BM.TXT_PIN_UNLOCK_HINT" "To unlock all functions please input your PIN. This will unlock until a PIN is setup again."
SET "BM.TXT_INCORRECT_PIN" "PIN is incorrect. Try again or reset by reinstalling BM via disc"
SET "BM.TXT_PIN_SET" "BootManager menus locked!"
SET "BM.TXT_UNLOCKED" "BootManger menus unlocked!"
SET "BM.TXT_LOCKOUT_WARNING" "Advanced functions locked."

#Messages
SET "BM.TXT_SAVE_CONF_FAIL" "Failed saving configuration settings!"
SET "BM.TXT_SAVE_THM_FAIL" "Failed saving theme configuration settings!"
SET "BM.TXT_DEL_FW_FAIL" "Failed erasing firmware!"
SET "BM.TXT_CREATE_FAIL" "Failed to create"
SET "BM.TXT_COPY_FAIL" "Failed to copy"
SET "BM.TXT_COPY_DEF_THM_FAIL" "Failed to copy default theme!"
SET "BM.TXT_INST_FAIL" "Failed installing"
SET "BM.TXT_REM_FAIL" "Failed removing"
SET "BM.TXT_NO_CC" "Unsupported CrystalChip"
SET "BM.TXT_PROGFW_FAIL" "Failed programming firmware file!"
SET "BM.TXT_PROGFW_DONE" "Firmware upgraded successfully!"

EXIT "0"
