# Crystal Chips BootManager HDD PBAT Script v1.1
# (c) 2005-2006 Crystal Chips - http://www.crystal-chips.com/
# For use only with Crystal Chips hardware and software.
#
# Modification Info:
# This file has been modified by R3Z3N to use __common instead of +Crystal partition along with modified HDDLOAD.IRX
#
# Description:
# This script is used by BootManager(BM) to load the HDD modules and mount the HDD.

IF NEQ "$BM.HDD_STARTED$" "1"
    ECHO "Starting HDD..."

    IF NOT MODLOADED "dev9_driver"
        IF FAIL LOADEXEC "IRX" "$BM.DRIVER_PATH$/PS2DEV9.IRX"
            ECHO "Failed loading PS2DEV9.IRX!"
            RETURN -1
        ENDIF
    ENDIF

    IF NOT MODLOADED "Poweroff_Handler"
        IF FAIL LOADEXEC "IRX" "$BM.DRIVER_PATH$/POWEROFF.IRX"
            ECHO "Failed loading POWEROFF.IRX!"
            RETURN -1
        ENDIF
    ENDIF

    IF NOT MODLOADED "atad_driver"
        IF FAIL LOADEXEC "IRX" "$BM.DRIVER_PATH$/PS2ATAD.IRX"
            ECHO "Failed loading PS2ATAD.IRX!"
            RETURN -1
        ENDIF
    ENDIF

    IF NOT MODLOADED "hdd_driver"
        IF FAIL LOADEXEC "IRX" "$BM.DRIVER_PATH$/PS2HDD.IRX"
        # -o 4 -n 20
            ECHO "Failed loading PS2HDD.IRX!"
            RETURN -1
        ENDIF
    ENDIF

    IF NOT MODLOADED "pfs_driver"
        IF FAIL LOADEXEC "IRX" "$BM.DRIVER_PATH$/PS2FS.IRX"
        # -m 2 -o 16 -n 40
            ECHO "Failed loading PS2FS.IRX!"
            RETURN -1
        ENDIF
    ENDIF

    IF NOT MODLOADED "hdd_mount"
        IF FAIL LOADEXEC "IRX" "$BM.DRIVER_PATH$/HDDMOUNT.IRX" "pfs0:" "hdd0:__common"
            ECHO "Failed loading HDDMOUNT.IRX!"
            RETURN -1
        ENDIF
    ENDIF

    SET "BM.HDD_STARTED" "1"

    RETURN 0
ENDIF