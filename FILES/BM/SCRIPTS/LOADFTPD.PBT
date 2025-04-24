# Crystal Chips BootManager FTP Server PBAT Script v1.0
# (c) 2005-2006 Crystal Chips - http://www.crystal-chips.com/
# For use only with Crystal Chips hardware and software.
#
# Modification Info:
# This file is unmodified.  If you modify this script and distribute it,
# please edit this text.  Please do not change the copyright information.
#
# Description:
# This script is used by BootManager(BM) to load the FTP server modules and start
# the FTP server.

IF NEQ "$BM.FTPD_STARTED$" "1"

    # If the network isn't already started, start it.
    IF NEQ "$BM.NET_STARTED$" "1"
        IF FAIL LOADEXEC "PBAT" "$BM.SCRIPTS$/LOADNET.PBT"
            RETURN -1
        ELSEIF NEQ "$BM.NET_STARTED$" "1"
            RETURN -1
        ENDIF
    ENDIF

    ECHO "Starting FTP server..."

    IF EQU "$BM.CNF_FTP_ANON$" "1"
        IF FAIL LOADEXEC "IRX" "$BM.DRIVER_PATH$/PS2FTPD.IRX" "-anonymous" "-port" "$BM.CNF_FTP_PORT$"
            ECHO "Failed loading PS2FTPD.IRX!"
            BGCOLOR "0x0000FF"
            RETURN -1
        ENDIF
    ELSE
        IF FAIL LOADEXEC "IRX" "$BM.DRIVER_PATH$/PS2FTPD.IRX" "-user" "$BM.CNF_FTP_USER$" "-pass" "$BM.CNF_FTP_PASS$" "-port" "$BM.CNF_FTP_PORT$"
            ECHO "Failed loading PS2FTPD.IRX!"
            RETURN -1
        ENDIF
    ENDIF

    SET "BM.FTPD_STARTED" "1"

ENDIF