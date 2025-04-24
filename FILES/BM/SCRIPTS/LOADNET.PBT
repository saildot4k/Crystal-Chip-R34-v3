# Crystal Chips BootManager Network PBAT Script v1.0
# (c) 2005-2006 Crystal Chips - http://www.crystal-chips.com/
# For use only with Crystal Chips hardware and software.
#
# Modification Info:
# This file is unmodified.  If you modify this script and distribute it,
# please edit this text.  Please do not change the copyright information.
#
# Description:
# This script is used by BootManager(BM) to load the network modules and start the network.

IF NEQ "$BM.NET_STARTED$" "1"
    ECHO "Starting network..."

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

    IF NOT MODLOADED "TCP/IP Stack"
        IF FAIL LOADEXEC "IRX" "$BM.DRIVER_PATH$/PS2IP.IRX"
            ECHO "Failed loading PS2IP.IRX!"
            RETURN -1
        ENDIF
    ENDIF

    IF NOT MODLOADED "smap_driver"
        IF FAIL LOADEXEC "IRX" "$BM.DRIVER_PATH$/PS2SMAP.IRX" "$BM.CNF_NET_IP0$.$BM.CNF_NET_IP1$.$BM.CNF_NET_IP2$.$BM.CNF_NET_IP3$" "$BM.CNF_NET_SM0$.$BM.CNF_NET_SM1$.$BM.CNF_NET_SM2$.$BM.CNF_NET_SM3$" "$BM.CNF_NET_DG0$.$BM.CNF_NET_DG1$.$BM.CNF_NET_DG2$.$BM.CNF_NET_DG3$"
            ECHO "Failed loading PS2SMAP.IRX!"
            RETURN -1
        ENDIF
    ENDIF

    SET "BM.NET_STARTED" "1"
ENDIF