#
# Crystal Chips BootManager Initialization PBAT Script v2.2
#
# (c) 2005-2007 Crystal Chips - http://www.crystal-chips.com/
#
# For use only with Crystal Chips hardware and software.
#
# Modification Info:
#
# This file is modified by R3Z3N.  If you modify this script and distribute it,
# please edit this text.  Please do not change the copyright information.
# Line 34 changed to set driver path to where BM is executed from.
# However the FW still looks for USB drivers from mc0:/BM/SHARED when booted from mass:/ which can be edited.
#
# Description:
#
# This script is used by BootManager(BM) to load and execute modules which are
# required by BM, as well as to set up some environmental variables.
# You can modify this script to load additional modules, add new devices, etc.
# on BM startup.
#

ECHO "Initializing BootManager..."

SET "BM.SCRIPTS" "$BM.BM_PATH$/SCRIPTS"

IF MATCHES "dffs:*" "$PWD$"
    # Drivers are stored on DFFS if that's where BM is loaded from.
    SET "BM.DRIVER_PATH" "dffs:/BM/SHARED"
    SET "BM.DRIVER_DEV_DRIVERS" ""
ELSEIF MATCHES "host:*" "$PWD$"
    SET "BM.DRIVER_PATH" "host:/BM/SHARED"
    SET "BM.DRIVER_DEV_DRIVERS" ""
ELSE
    # Drivers are stored on MC0 (line 34) or device BM is loaded from (line 35) for all other devices.
    # SET "BM.DRIVER_PATH" "mc0:/BM/SHARED"
    SET "BM.DRIVER_PATH" "$BM.BM_PATH$/SHARED"
    SET "BM.DRIVER_DEV_DRIVERS" "^"-m rom0:SIO2MAN^" ^"-m rom0:MCMAN^""
ENDIF

IF MATCHES "host:*" "$PWD$"
# Do not reboot the IOP if loaded from host(naplink/ps2link)
# Change this to "0" if you wish to install applications from ps2link.
# IMPORTANT: Make sure you're using the latest PS2LINK and ps2client since up until July 12 2006
# ps2client and ps2link had bugs which prevented them from working properly.
#    SET "BM.INSTALLER_MODE" "1"
    LOADEXEC "IRX" "rom0:XSIO2MAN"
    LOADEXEC "IRX" "rom0:XMCMAN"
    LOADEXEC "IRX" "rom0:XPADMAN"
ELSE
    ECHO "Rebooting IOP... $PWD$"
    # Reboot the IOP

    REBOOTIOP "rom0:UDNL rom0:OSDCNF"

    IF MATCHES "cdrom?:*" "$PWD$"
        SET "BM.INSTALLER_MODE" "1"
    ENDIF

ENDIF

#################################################################################################################################################

ECHO "Loading device drivers..."
LOADEXEC "PBATS" "$BM.BM_PATH$/DEVS/*/DEVINFO.PBT" "LOAD"

# Theme related init.
ECHO "Loading Theme..."

IF EQU "$BM.CNF_THEME_SCRIPT$" ""
    SET "BM.CNF_THEME_SCRIPT" "$BM.BM_PATH$/THMS/DEFAULT/THMINFO.PBT"
ENDIF

IF NOT EQU "$BM.CNF_THEME_SCRIPT$" "$BM.LOADED_THEME_SCRIPT$"
    IF FAIL LOADEXEC "PBAT" "$BM.CNF_THEME_SCRIPT$" "LOAD"
        ECHO "Failed loading theme!"
    ELSE
        ECHO "Loaded theme script successfully!"
    ENDIF
ENDIF

ECHO "Loading theme configuration..."
LOADEXEC "PBAT" "$BM.BM_PATH$/CONFIG/THMCONF.PBT"

#
# HDD(Hard Drive) related init
#

IF EQU "$BM.CNF_AUTO_HDD_EN$" "1"
    LOADEXEC "PBAT" "$BM.SCRIPTS$/LOADHDD.PBT"
ENDIF

#
# Network related init.
#

IF EQU "$BM.CNF_AUTO_NET_EN$" "1"
    LOADEXEC "PBAT" "$BM.SCRIPTS$/LOADNET.PBT"
ENDIF

IF EQU "$BM.CNF_AUTO_HOST_EN$" "1"
    LOADEXEC "PBAT" "$BM.SCRIPTS$/LOADHOST.PBT"
ENDIF

IF EQU "$BM.CNF_AUTO_FTPD_EN$" "1"
    LOADEXEC "PBAT" "$BM.SCRIPTS$/LOADFTPD.PBT"
ENDIF

IF EXISTS "$BM.BM_PATH$/CONFIG/MACROS.PBT"
    LOADEXEC "PBAT" "$BM.BM_PATH$/CONFIG/MACROS.PBT"
ENDIF
