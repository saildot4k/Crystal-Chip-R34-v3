#
# BootManager 2 Application Manager Script for PS2 DVD Player
#

# Change this information to describe the application.
SET "TITLE" "PS2 DVD Player"
SET "VERSION" "1.0"
SET "AUTHOR" "Sony Computer Entertainment Inc."
SET "DESC" "This is the internal PS2 DVD Player."
SET "MEDIAS" "DVDV"
#

GOTO "$ARG1$"

:LABEL_NAME
    ADDWIDGET "LABEL" "$ARG2$$TITLE$ v$VERSION$"
    EXIT "0"

:QUERY
    ADDWIDGET "CALL" "$TITLE$" "$BM.TXT_VERSION$: $VERSION$ $BM.TXT_AUTHOR$: $AUTHOR$ $BM.TXT_DESC$: $DESC$" $ARG2$ "$ARG0$" "$ARG3$" "$ARG4$" "$ARG5$" 
    EXIT "0"

:REMOVE
    EXIT 0

:INSTALL
    COPY "$PWD$" "$ARG2$/SCEDVD"
    EXIT "0"

:RUN
    SHUTDOWN "MM"
    GETDISKTYPE "DISK_TYPE"

    # Disable disc auth and cycle the tray if disc isn't already authenticated as DVD Video
    IF NEQ "$DISK_TYPE$" "DVDV"
        SETAUTH "OFF"
        CYCLETRAY "WAIT"
    ENDIF

    # Check both memory card slots for official DVD player upgrade
    IF EXISTS "mc0:/BAEXEC-DVDPLAYER/dvdplayer.elf"
        SET "MC_ELF" "mc0:/BAEXEC-DVDPLAYER/dvdplayer.elf"

    ELSEIF EXISTS "mc0:/BEEXEC-DVDPLAYER/dvdplayer.elf"
        SET "MC_ELF" "mc0:/BEEXEC-DVDPLAYER/dvdplayer.elf"

    ELSEIF EXISTS "mc0:/BIEXEC-DVDPLAYER/dvdplayer.elf"
        SET "MC_ELF" "mc0:/BIEXEC-DVDPLAYER/dvdplayer.elf"

    ELSEIF EXISTS "mc1:/BAEXEC-DVDPLAYER/dvdplayer.elf"
        SET "MC_ELF" "mc1:/BAEXEC-DVDPLAYER/dvdplayer.elf"

    ELSEIF EXISTS "mc1:/BEEXEC-DVDPLAYER/dvdplayer.elf"
        SET "MC_ELF" "mc1:/BEEXEC-DVDPLAYER/dvdplayer.elf"

    ELSEIF EXISTS "mc1:/BIEXEC-DVDPLAYER/dvdplayer.elf"
        SET "MC_ELF" "mc1:/BIEXEC-DVDPLAYER/dvdplayer.elf"

    ELSE
        ECHO "Loading DVD player from ROM"

        POKEW "0x1000E010" "0x00000020"

        GETDVDREG "DVD_REGION"

        IF NEQ "$DVD_REGION$" ""
            ECHO "Loading on v12+ region $DVD_REGION$"
            LOADEXEC "EEELF" "moduleload2 rom1:UDNL rom1:DVDCNF" "-k rom1:EROMDRV$DVD_REGION$" "-m erom0:UDFIO" "-x erom0:DVDPL$DVD_REGION$"
        ELSE
            ECHO "Loading on v1-v11"
            LOADEXEC "EEELF" "moduleload2 rom1:UDNL rom1:DVDCNF" "-k rom1:EROMDRV" "-m erom0:UDFIO" "-x erom0:DVDELF"
        ENDIF
    ENDIF

    ECHO "DVD Player Upgrade found at $MC_ELF$, loading..."
    LOADEXEC "EEELF" "moduleload" "-m rom0:SIO2MAN" "-m rom0:MCMAN" "-m rom0:MCSERV" "-x $MC_ELF$"
    EXIT "0"
