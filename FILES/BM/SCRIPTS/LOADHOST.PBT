# Crystal Chips BootManager PC Host Server PBAT Script v1.0
# (c) 2005-2006 Crystal Chips - http://www.crystal-chips.com/
# For use only with Crystal Chips hardware and software.
#
# Modification Info:
# This file is unmodified.  If you modify this script and distribute it,
#   please edit this text.  Please do not change the copyright information.
#
# Description:
# This script is used by BootManager(BM) to load the PC Host server modules and start
#   the PC Host server.

IF NEQ "$BM.HOST_STARTED$" "1"

    # If the network isn't already started, start it.
    IF NEQ "$BM.NET_STARTED$" "1"
        IF FAIL LOADEXEC "PBAT" "$BM.SCRIPTS$/LOADNET.PBT"
            RETURN -1
        ELSEIF NEQ "$BM.NET_STARTED$" "1"
            RETURN -1
        ENDIF
    ENDIF

    # If host: alread exists, return.
    IF EXISTS "host:/"
        SET "BM.HOST_STARTED" "1"
        RETURN 0
    ENDIF

    ECHO "Loading PC Host server..."

    IF FAIL LOADEXEC "IRX" "$BM.DRIVER_PATH$/PS2HOST.IRX"
        ECHO "Failed loading PS2HOST.IRX!"
        RETURN -1
    ENDIF

    SET "BM.HOST_STARTED" "1"
ENDIF
