Crystal Chips - http://www.crystal-chips.com/

This is the Crystal Chips software release 34.

Included in this package are firmware source codes for all revisions of Crystal Chips, support tools, BootManager and
associated scripts and applications.  This software is written by Crystal Chips for the express use on Crystal Chips
hardware unless otherwise specified.  Software written by other developers are covered by their respective licenses.

!!!! IMPORTANT NOTE !!!!!

You MUST boot the upgrade in Recovery Mode when an older version of BootManager is installed on your system!  Failure
to do so may result in a black screen!

Release History:

Release 34 -
    Fixes/Changes:

        - Fixed yet another bug in the PS2 Video Fixes that caused fixes to not work, or stop working after a while
            in some games.  Hopefully this is the last of them..

        - Added a new configuration variable, "BM.AUTOLOAD_FSD_EN", which allows you to disable the automatic loading
            of USB and Memory Card drivers when loading homebrew applications.  This is mostly only useful for
            Unofficial Launch ELF(uLE) and Simple Media System(SMS).  To use this, edit APPINFO.PBT for each of these
            applications and change the following line:
            SHUTDOWN "MM"
            to:
            SET "BM.AUTOLOAD_FSD_EN" "0"

Release 33 -
    Fixes/Changes:

        - Fixed a bug where macros would not be saved in some situations.

        - Fixed yet another bug in the PS2 Video Fixes where forcing the color would not work.

        - Added "auto-calibrate" function to CC hardware driver which automatically detects what speeds work best
            for the console that the chip is installed in.  This should resolve the black screen issues people
            are experiencing with slimline consoles, specifically v14+.  The additional benefit of this is that
            users get better speeds when reading/writing the CC DataFlash and EEPROM(not that EEPROM is ever going
            to be fast.)

        - Increased delays in the firmware source code CC hardware driver CCHW.S to improve compatability with v12+
            consoles.

        - Fixed a "typo" in BMINIT.PBT which caused it to not be possible to upgrade from PS2client.

Release 32 -
    Fixes/Changes:
        - Fixed black screen on booting of Upgrade Disc in some instances. NOTE: You *MUST* boot the Upgrade Disc in
            Recovery Mode when upgrading from older versions of BootManager!

        - Fixed a bug which caused PS2 PAL Software Video Fixes to not work properly.

        - Fixed some typos and a bug which caused "Console Version" to display "???" in System Information even when the
            version number is known.  If you still see "???" please let us know the BIOS ROM version and what you believe
            your console "version" to be so we can update the list of known versions!  Thanks to Jones23 and others who
            contributed version info!

        - Fixed compatability with CodeBreaker v9.3(perhaps also 9.2? Please let us know!)  Tested with CB 9.3 original.
            Note: This is only intended to work with booting CodeBreaker from disc and may not work when booting the
                application from memory card.  If this is a problem for you, please contact Pellican.  It's sad that the
                only people their protections end up protecting against are those who have legitimate copies of their
                software and the rest simply use a cracked version..

        - Fixed(hopefully) a bug which caused BM to randomly crash at the splash screen on startup.  This was a hard one
            to test/debug since it happens "randomly" but hopefully it's resolved now...

        - Fixed a minor graphics bug in BM which caused some flickering on the edge of the screen.

        - Improved In-Game Reset, should work with more games now.  Still more planned to improve compatability with even
            more games.

        - Fixed a condition where configuration may not be saved if user returned to main menu too quickly after changing
            settings.

        - Fixed conditions where macros could be executed before the menu was loaded which could cause crashes.

        - CrystalChip 2.0 firmware will now act like CC1.x firmware when BM is not installed.(no more black screen)

        - Added a work-around for the CC1.0 multi-disc PS2 hardware bug.

        - Various code clean-ups/fixes.

    Additions:
        - added poweroff.irx from PS2SDK to allow older(non-slim) consoles to be powered off when network/hdd are started
            without having to hold in reset to force power-off.

Release 31 -
    Fixes:
        Fixed a minor path error in BOOTMENU.PBT which caused PS1 discs not to boot.

Release 30 -

    NOTE: Loading BM from older versions of PS2LINK will not work since PS2LINK used an older version of PS2SMAP.IRX.  Use
        the latest PS2LINK with the latest PS2SMAP.IRX only! Encourage others to update PS2SMAP.IRX in their projects too.

    NOTE: Release 30 contains BM 2.1.0 which requires small changes to APPINFO.PBT scripts.  Older MegaPacks will not work.

    Additions:
        - "Shortcuts" allow you to assign a shortcut to one of the 7 "user buttons": L1, L2, R1, R2, Triangle, Square, and Start.
            Usage:
                Inside any BM menu that contains an option you wish to create a shortcut to:
                    1. Press "Select" button.(the cursor should turn green and you cannot move the cursor.)
                    2. Press the "user button" you wish to assign the shortcut to.
                    3. Select the option you wish to create the shortcut to and hit "X".
                    4. The cursor should return to normal.
                    5. Every time you press the "user button" assigned, the shortcut will be called.

                Note: If you hit "Select" again at any time during the shortcut recording the shortcut will be canceled.
                    You can use this to delete a shortcut by pressing Select then the button you wish to delete the shortcut
                    from then pressing Select again.

            By holding down the button desired and pressing "Select", you will enter "shortcut record mode".  You can cancel
            this mode by hitting "Select" again.  In Shortcut Record Mode, the cursor will turn green when it's above a valid
            widget that can be used as a shortcut.  When you've highlighted the widget you want to create a shortcut to, hit
            "X" to assign the shortcut.  This can be used to launch an application, enter a menu, start network/hdd, etc all
            by pressing a single button!

        - "In-Game Reset"(IGR) allows you to reset your PS2 simply by pressing(and holding) L1+L2+R1+R2+Start+Select on your controller!
            This feature has been very popular for XBOX1 users so we decided it was time the PS2 users were able to
            enjoy the same. Please note that this feature will not work unless the PS2 is actively reading the controller.
            For example some games do not read the controller while showing intro screen, etc.
            This will not work in PS1 games.
            This will also not work if the PS2 is crashed since all software is dead in that case...
            THIS FEATURE IS DISABLED BY DEFAULT!

        - Added "Miscellaneous Configuration" menu with the following options:
            - In Game Reset: enable/disable "In Game Reset". DEFAULT: OFF
            - GS Hook: enable/disable the "GS Hook" used for PS2 video fixes. DEFAULT: ON

        - PBAT scripts:
            - "PROGCCI" is no longer supported, see "PROGFW".

            - "PROGFW" will write a binary to a specified address in the CC on-chip EEPROM/flash.
                Syntax: PROGFW start_address file
                Arguments:
                    start_addr is the starting address, in either hexadecimal(0x..) or decimal, in EEPROM/flash to which the data will be written.
                    filename is the name of the file to load and program to the EEPROM/flash.
                Example: PROGFW 0 MYFILE.CCI
                Notes: This command will overwrite the specified areas in the EEPROM/flash, possibly requiring you to use Recovery Mode
                    to boot an Upgrade Disc!

            - "ERASEFW" will erase the entire contents of the CC on-chip EEPROM/flash.
                Syntax: ERASEFW
                Arguments: None
                Example: ERASEFW
                Notes: This command will erase the entire EEPROM/flash chip and you will lose all firmware, applications and settings
                    stored on the chip!

        - Added "N2EPACK.EXE" to allow you to pack any file with N2E compression for use in CC firmwares.

        - Added "CCITOOL.EXE"(replaces CCIGEN.EXE) to allow you to supply the necessary "CCI Header" to
            firmware loader binaries.

        - ???(Various forgotten additions I'm sure..)

    Fixes/Changes/Updates:
        - IMPORTANT: The Crystal Chip firmware image(.CCI) file format has changed.  There is no longer a 32-bit checksum at the start
            of the file.  BootManager v2.1.0 and later will only support the new format.

        - Removed "Button Configuration" menu as the "Button Configuration" has been replaced by Shortcuts which can do the same thing
            and more.

        - Fixed "Themes" so you can now change the theme correctly after installing a new theme.

        - Fixed Autoload "NODISC".

        - Rewrote CC hardware drivers, now much more efficient, stable, faster and supporting flash chips up to 4MByte.

        - Rewrote all CC firmwares, CC2.0 will notice much faster BM loading from flash and CC1.x users should get some slight improvements too.

        - Fixed some compatability issues with some games.

        - Fixed an issue causing crashes relating to HDD(No HDD, etc).

        - Fixed some scrolling issues in menus.

        - Fixed some typos in the Configuration Menus(options mislabeled, etc).

        - Updated PS2SMAP.IRX and USBHDFSD.IRX from PS2DEV.ORG SVN source.

        - Various bug fixes, cleanups, etc.  Should result in better compatability/stability. :)

        - ???(Various forgotten fixes/changes/updates I'm sure..)

Release 29 -
    Fixes:
        Fixed a scripting error that caused Button Configuration and Autoloading Application menus to not work correctly.
        Updated PS2FS.IRX to use latest from PS2DEV SVN.

Release 28 -
    Fixes:
        Changed auto-starting of network and HDD to occur in the STARTUP event rather than inside BMINIT.PBT.

Release 27 -
    Fixes:
        A change made to cleanit.bat in the firmware caused it not to delelete the configuration files
            from FILES\BM\CONFIG when run resulting in the installer disc using a PAL configuration file.

Release 26 -
    Fixes:
        A typo in the firmware caused release 25 to boot BootManager from Memory Card Slot 2 instead of
            Memory Card Slot 1 for CC1.x hardware.

Release 25 -

    Additions:
        - Added "Video Wizard" to help you determine the video modes supported by your TV and automatically
            choose the best configuration settings rather than basing the configuration purely on the console region.

        - Added native support for PS2HOST.IRX, a PS2 PC Host server.

        - Added native support for PS2 HDD.  You can now use your PS2 HDD like any other device for installing,
            removing and running homebrew software!

        - Added native support for USB HDD/pendrive.  You can now use your USB HDD like any other device for installing,
            removing and running homebrew software!

        - Added "Network Configuration" menu.  Network settings are stored in /BM/CONFIG/IPCONFIG.DAT

        - Added "IP" widget type for entry of IP addresses.

        - Added "AXIS" widget which allows changing of 2 variables such as X and Y positions.

        - Added PS2 DVD Player application script.

        - Added "DVD+R DL Patcher" configuration option to allow this to be disabled(was always active).

        - Added BMEVENTS.PBT script which is called when certain events occur.

        - Re-added "REDIRFILE" PBAT command(For example of usage see APPINFO.PBT for PS2LINK)

        - Added "FPRINT" PBAT command which allows you to "print" to files.

        - Added "MODLOADED" PBAT command which allows you to determine if an IRX module has already been
            loaded.

        - Added "MESSAGE" PBAT command which displays an error message on the screen for 5 seconds.  This
            is useful for script errors such as when installation of an application fails.

        - Added a boot menu for PS1 games to allow the same options as those for PS2.

        - Miscellaneous additions to the scripts.

        - Added Device Manager by Jones23.

        - Added 480P video mode for BM.

    Changes:
        - Replaced USBMASS.IRX with a newer USBHDFSD.IRX which has better USB HDD/pendrive compatability.

        - Split BMMENUS.PBT into BMMENUS.PBT and CONFMENU.PBT.

        - PBAT scripts in "/BM/STARTUP" are now executed after all initialization is complete.

        - Redesigned many parts of the menu structure.

        - Changed the Theme Configuration menu to use Jones23's Theme Manager.

        - Re-arranged the directory structure a bit to keep things clean.

        - APPINFO.PBT script for PS2LINK.PBT now redirects IPCONFIG.DAT to BM's IPCONFIG.DAT

    Fixes:
        - Fixed a bug which caused some PS2 games to not load unless booted in Minimal Mode.

        - Fixed many menu/textual bugs.(Thanks to Jones23)

        - Fixed a bug which caused SWITCH/CASE/DEFAULT PBAT commands to fail in some situations.
            This bug was notable when changing video modes or language multiple times in a session.

        - Fixed flickering which would occur when changing the BM screen position.

        - Fixed a bug which caused video modes to be selectable in only one direction or the other.

        - Fixed a bug where NTSC screens were set to 640x480 rather than 640x448 when changing video modes.

        - Included an updated version of CD-Tool.exe by Nicolas Nobel(aka "Pixel).  The older version did not
            work correctly on some PCs causing errors when attempting to run "makeit.bat".

        - Fixed an issue which caused Software Sleep Mode to be very slow and sometimes not work right.

        - Fixed compatability with CodeBreaker cheat devices(Tested with v9.0).

        - Fixed a scripting error which caused DVD videos to not be detected correctly when authenticated
            as DVD video.

        - Fixed a bug which caused the DVD player to not return to BM when exiting(when ejecting the disc).

        - Fixed some compatability issues with applications such as HDloader, SMS and uLaunchELF which
            caused these applications to not load unless "SHUTDOWN" was used.  HDloader can now be used
            along with all capabilities of BM2.

        - Fixed a bug where PS2 software color was not correctly disabled when set to "off" in some instances.

        - Rewrote PS2 video fixes, should now work properly 100% of the time.  Previously this didn't work
            with "Final Fantasy Dirge of Cerberus", perhaps others.

        - Miscellaneous cleanup and cosmetic bug fixes.

Release 24 -
    Note: Like Releases 20-24, Release 24 is BETA software.  This release includes some fixes
        but the menu scripts are still not 100% so please hold off on translations yet.

    Fixes:
        - Fixed a bug that caused many configuration settings to not be saved.

Release 23 -
    Note: Like Releases 20-22, release 23 is BETA software.  This release includes some fixes
        but the menu scripts are still not 100% so please hold off on translations yet.

    Note: CD-Tool has been re-added to the software pack since the author(Nicolas Nobel) was kind enough
        to fix the software.  Many thanks to Nicolas!

    Note: The only remaining bugs should be cosmetic in nature.  This release should be considered "stable".

    Fixes:
        - Fixed a typo in the BMMENUS.PBT script which caused CC1.2(CC1.0 with 128kbyte flash) to be programmed
            with the wrong firmware.
        - Adjusted some of the default configuration values to give better results on PAL consoles.(Thanks cherrypie)
        - Fixed some more bugs which caused PS1 video fixes to not work properly on pre-v14 consoles.
        - Fixed a bug where Audio CDs would not boot.(thanks to Jones23)
        - Fixed a bug that could result in DVD movies not booting.
        - Fixed a bug where Australian v14 and higher consoles would not boot PS1 discs.(Thanks to cherrypie)
        - Fixed some things in the Theme menus which caused the user to be unable to change themes.
        - Miscellaneous menu fixes.

    Additions:
        - As mentioned before, CD-Tool is once again included in the software pack, making it easier to
            generate upgrade images.

        - Added Button Configuration menu which allows you to assign applications to each of the following
            controller buttons: L1, L2, R1, R2, Square, Triangle, Start and Select.  Once you've configured
            your buttons, pressing that button will automatically execute the selected application without
            having to go into the Application Browser menu and manually select the application.

    Changes:
        - Modified "SET" PBAT command to allow specification of variable type.  Specifying 2 parameters to
            "SET" will default to "STRING" variable type.  Usage is: SET [TYPE] NAME VALUE
            Example: SET "STRING" "MYSTRING" "This is my string value"
            Example: SET "MYSTRING" "This is also my string value"
            Example: SET "U32" "MYNUM" "0x12345678"

            Variable Type:
                STRING - Text string.
                U8 - Unsigned 8-bit value
                S8 - Signed 8-bit value
                U16 - Unsigned 16-bit value
                S16 - Signed 16-bit value
                U32 - Unsigned 32-bit value
                S32 - Signed 32-bit value

Release 22 -
    Note: Like Release 20 and 21, Release 22 is BETA software.  This release includes some fixes and small changes
        but the menu scripts are still not 100% so please hold off on translations yet.

    Fixes:
        Fixed some menu and configuration bugs which caused PS1 video fixes to not work properly.

Release 21 -
    Note: Like Release 20, Release 21 is BETA software.  This release includes some fixes and small changes
        but the menu scripts are still not 100% so please hold off on translations yet.

    Known remaining issues:
        - As mentioned, menu scripts still need some of the text moved over to PBAT variables.

        - CC 1.2(CC 1.1 with 128kbyte flash) has problems with the Release 20 firmware.  We've attempted to
            resolve this, if this release does not fix the issue we will come out with another release
            ASAP.

        - Some PS2 games do not boot from BM unless using minimal mode.  This is under investigation.

        - Miscellaneous menu graphics glitches.

        - CodeBreaker and other cheat devices still not working.  Will be investigated in the near future.

        - ?? Conflicting reports of PS1 discs not booting from BM2 ??

    Changes:
        Note: BootManager now uses a 3-number version system: MAJOR.MINOR.PATCH
            This release contains BootManager v2.0.1

        Bug Fixes:
            - Not really a bug but DEVICE.PBT in the MEMCARD directory now uses the old SIO2MAN and MCMAN modules
                due to the fact that some applications which don't reboot the IOP will lock up when they load old
                modules and the new XSIO2MAN and XMCMAN modules are loaded.(Thanks to Jones23)

            - Fixed the path and file name case for the BM icon files(Thanks to Jones23)

            - Fixed Autoload No Disc support.

            - Fixed bug where sometimes menus would be skipped when going "back".(Thanks to Jones23)

            - Fixed some of the default configuration settings.

            - Fixed a bug in "CHOICE" widgets where correct choice would not be automatically selected.

        Changes and additional features:
            - Reorganized the Application Browser menu.

Release 20 -
    Note: Release 20 is BETA software and contains known bugs though these bugs are minor and should not cause any serious issues.
        It is known that the scrolling in menus is a bit strange and changing video modes for BM can have strange results.
        Very little of the BM 1.x code remains in BM 2.0 so many of the bugs that existed in BM 1.x should be fixed, and hopefully
        few new bugs were created.  Some clean-up of the menu and other scripts needs to be done yet, please do not start
        translating BM2 until release 21 come out.

    !!! IMPORTANT NOTE !!! BM 2.0 and higher are not compatible with BM 1.x scripts, including the MegaPack application scripts.
        PS2link v1.46 is included in this release as an example application for making new scripts.

    !!! IMPORTANT NOTE !!! BM 2.0 no longer uses the mc0:/BOOT directory for BootManager or applications.  It is highly recommended
        that you use the "Memory Card Manager" menu to remove mc0:/BOOT from your memory card to clear out all the old files.

    Firmware Changes:
        - Added support for booting BM from Memory Card Slot 2 or USB HDD(requires USB_MASS.IRX and USBD.IRX
            to be stored on Memory Card 1 at mc0:/BM/SHARED).
        - Added support for 3rd-party PS2LOGO.ELF when booting PS2 games from OSDSYS.
        - Miscellaneous little changes..

    BootManager Changes:
        - Replaced BootManager with BootManager 2.0(complete rewrite)
        - All menus are generated by PBAT scripts allowing for full customization of the BM menu system.
        - Multi-language support: new translations can be added by creating a new language file.
            !!! NOTE !!! It is not recommended that you create translations for this release since some of the
            menus do not use variables for the text at this time.  Release 21 will resolve this.
        - Support for wildcards in file names for COPY and RM PBAT functions.
        - Removal of some of the PBAT commands, addition of others(sorry, no list here..)
        - Rewriting of device system in a more intelligent way, allowing for any number of devices to be used
            for booting applications.
        - Much faster listing of applications in application menus.
        - Theme support allowing for customization of the images, fonts and general layout of BM2.
        - All configuration settings are stored as PBAT variables, allowing for complete customization of what
            settings are set when loading specific applications.
        - Many, many other changes(too many to list!)...

Release 19 -
    Note: BOOTMENU.PBT is now included in the main firmware folder and copied to FILES\BOOT\BM\BOOTMENU.PBT by makeit.bat.
        FILES\BOOT\BM\BOOTMENU.PBT will be overwritten so if you wish to modify BOOTMENU.PBT, please modify the copy in the
        main firmware folder.

    Firmware Changes:
        - Bug Fixes:
            - Fixed support for PS1 discs on v14.

    BootManager Changes:
        - Bug Fixes:
            - Fixed bug where some items in the menu could be selected
                which should not be selectable, such as blank lines and
                other assorted bugs in scrolling of menus.

            - Fixed bug where firmware upgrade would sometimes fail.

            - Fixed support for PS1 discs on v14.

        - New Features:
            - Added "System Information" screen which displays:
                - BIOS ROM version and region.
                - Crystal Chip hardware version
                - BootManager version

Release 18 -

    !!! PLEASE NOTE !!! Release 18, like Release 17, is a beta release and has some known bugs. Release 19 to follow shortly.

    Firmware Changes:
        Fixed bugs where firmware would give black screen on v14 consoles.

Release 17 -

    !!! PLEASE NOTE !!! Release 17 is a beta release and has some known bugs. Release 18 to follow shortly.

        BootManager 1.7 Changes:
            - Bug Fixes:
                Fixed bug in "RGB Fix" for DVD movies on v12 and higher consoles.
                Fixed bug in "PS2 Video Fix", games would crash when enabled.
                Fixed bug where menu title set by BOOTMENU.PBT was not setting actual
                    title correctly.
                ??? - other bugs

            - Added support for v14 consoles.

            - Added full support for CC1.1 hardware.

            - Disabled some menu items(System Configuration and some VGA video options) which were not intended
                to be enabled in public releases.  These options may or may not be added to future releases.

            - Added "ADDDEV" PBAT command

            - Added global variables to BM which can be accessed as "$BM.VAR$".  For example:
                ECHO "$BM.DEST_PATH$"

              Some of the supported global variables for BM:
                "DEST_PATH" - this is the path that applications are INSTALLED TO or EXECUTED FROM.
                "SRC_PATH" - this is the path that applications are INSTALLED FROM.
                "MENU_TITLE" - Title displayed at the top of the menu.

            Application Browser:
                The application browser has changed it's form a bit.  In the "Application Browser" menu
                    you now have:

                    Run - Run an application from the "DESTINATION" device.
                    Install - Install an application from the "SOURCE" device to the "DESTINATION" device.
                    Remove - Remove an application from the "DESTINATION" device.
                    Change Source Device - Change the device applications are installed from.
                    Change Destination Device - Change the device application are installed to and run from.

                Applications are listed in a submenu of Run/Install/Remove respectively.

                "SOURCE" and "DESTINATION" devices are the "drives" which apps are installed from/to, such as
                CD/DVD, Memory Card, USB HDD/pendrive, etc.

            Custom Device Support:

            Reconfigured the Application Browser menu to support "ADDDEV" devices.

            Firmware pack includes USBD.IRX(by Napalm) and USBMASS.IRX(by multiple people) which
                allows the user to install applications to/from USB HDD/pendrive as well as run
                applications from USB HDD/pendrive.  Please note that the USBMASS.IRX included
                was hacked up a bit by us to resolve some problems.  We're aware that some other
                developers have been working on improving USBMASS.IRX and may have had more
                success with fixing bugs and incompatabilities.  If your HDD/pendrive is not
                recognized, try replacing USBMASS.IRX with a newer version.

            Miscellaneous things that we've once again forgotten.. ;)

        Firmware Changes:
            LOADER.S is no longer in the pack, it has been replaced by the following 3 files:
                LOAD10.S - CC1.0 loader source
                LOAD11.S - CC1.1 loader source
                LOAD20.S - CC2.0 loader source

            OSDHOOK.S is common for all hardware revisions and has not changed.

            When you build the firmware, you will have 3 seperate .CCI files:
                FWARE10.CCI - CC1.0 firmware image
                FWARE11.CCI - CC1.1 firmware image
                FWARE20.CCI - CC2.0 firmware image

            When you go to upgrade your chip, the software will automatically detect which of these
                files to use.

        Other Changes:
            CCIGEN.EXE has been updated.  The updates source code will be released in the next week
                once we have a chance to clean it up a bit(and will try to resolve the endian issues
                for our Mac customers).

Release 16 -
        Beta release only available to beta testers(you don't want it anyway, 1.7 is better). ;)

Release 15 -
        BootManager Changes:
            PLEASE NOTE: Release 15(BM v1.6) is considered BETA SOFTWARE.  We expect bugs to occur and are
                aware that the application menus are slow.  These issues will be resolved in the next release
                once we get more feedback.

            A large number of changes have occured in BootManager though operation is virtually identical to
                previous versions.  BM has gone from v1.4 to v1.6 since v1.5 was an internal beta that never
                made release and quite a few changes occured between then and now.  The PBAT interpreter has
                been completely redesigned and rewritten, existing PBAT scripts and "MegaPack" application
                installers are not compatible with v1.6.  The installation system has been changed to allow
                easier installation of applications using alternative methods such as ExecFTPs without
                requiring you to edit a menu list.  Examples will follow within the next 1-2 days.

           New Features:
                - DVD+R DL support allows you to use DVD+R DL medias with your software.  Please note that
                    many DVD+R DL medias are not very good quality and result in movies skipping and games
                    crashing on occasion.  This is not something we can fix but hopefully as DVD+R DL becomes
                    more popular the quality of the medias will improve.

                - Application Association: this system allows you to associate certain media types(for example
                    a disc containing Sega Genesis ROMs) with certain applications(like PGEN) so that they may
                    be automatically executed when an associated media type is inserted.

                - "REDIRFILE" command in PBAT interpreter allows you to redirect specific file locations to
                    another location.  This means you can load homebrew applications off memory card without
                    needing to "hack" them.

                - ??? We know there're other things we've added but can't remember everything that's changed. ;)

            Bug Fixes:
                - Fixed ATAD Auto Patcher.

Release 14 -
        BootManager Changes:
            Bug Fixes:
                - Not exactly a bug, but added compatability for Ratchet & Clank 3 and potentially
                    other games.

                - Fixed a bug in the PS2 software X and Y modifiers.

                - Fixed a bug in the "REBOOTIOP" PBAT command.

                - Fixed a bug in BOOTMENU.PBT when loading upgraded DVD player software from memory
                    card.

Release 13 -
        BootManager is now capable of installing/removing itself and programming the firmware when
            booted from CD.

        FLASHER.ELF has been removed from the software pack as it is no longer needed.

        BootManager Changes:
            New Features:
                - BootManager now displays it's version number at the top left of the screen(oh boy!)

            Bug Fixes:
                - Hopefully fixed bug where some older consoles would not boot DVD videos
                    correctly.  This may still be a problem, we will continue to look into it.

                - Fixed problems where some PS2 games would return directly to BootManager rather
                    than loading properly.

                - Fixed problems when loading certain applications from Application Browser.

                - Fixed problems when using "RRM" PBAT command on memory card causing REMOVE.PBT scripts
                    to fail when RRM is used.
            Misc Changes:
                - Pressing any button will disable AutoLoading.
Release 12 -
        Firmware Changes:
            Slight changes to the PS2 bootstrap.

        BootManager Changes:
            New Features:
                PS2 Software:
                    - Configurable X *and* Y positioning modifiers with individual settings for PAL and
                        NTSC games for perfect screen positioning!  Please note that this is a very new
                        feature and may have bugs.  Also, some games will NOT like having their vsync
                        forced and will crash, but this should be a low number of games.

                PS1 Software:
                    - Greater seperation of NTSC and PAL game settings allowing disabling of fixes for
                        one type, without disabling the other.

                PBAT Interpreter:
                    - Added "FORMAT" command.  Be careful with this, you don't want to erase
                        your memcard on accident. :)
                        FORMAT "mc0:"
                    - Added "CDSTOP" command.  This will stop the CD/DVD from spinning.
                        CDSTOP

                Application Browser:
                    - Added "Failed!" text display if Run/Install/Remove of applications fails.

                Miscellaneous:
                    - Added support for CodeBreaker9(and perhaps version 7 and 8).  Note that this
                        will NOT work with copies of CB9 software, only the original CB9 disc.

            Bug Fixes/Changes:
                Autoload should work all the time now, the timer will now reset when you press a button
                    in the Main Menu but will not stop.  So if you don't want it to autoload, disable it!

                Fixed color carrier bug in PS2 software.

                Fixed a bug where switching from one disc to another inside BM would result in failure
                    to read the new disc and occasionally lock up BM.

                Fixed 2 bugs where returning from the DVD player would result in DVD Video discs not being
                    correctly detected.

                Removed stopping of the disc spinning when disc is idle as it slows down booting and can
                    potentially cause problems with normal operation.  You may add "CDSTOP"(see above)
                    to your RUN.PBT scripts for applications if you desire for the CD to stop spinning
                    when running a specific application.

Release 11 -
        BootManager Changes:
            Bug Fixes:
                - Fixed a bug where PBAT scripts would fail when using labels under certain conditions,
                    often resulting in the Boot Menu not working.

Release 10 -
        BootManager Changes:
            New Features:
                - ! IMPORTANT ! PBAT variables must now be specified as $VAR$ instead of $VAR as it had been
                    in previous versions.  This means that ALL PBAT files must be updated.

                - ! IMPORTANT ! FLASHER.ELF will remove the BOOT directory and all files/directories contained
                    in it if a previous version of BM was installed to avoid conflicts with the old script
                    system and avoid wasting space on your memory card.

                - Individual Boot Scripts(PS1BOOT.PBT, PS2BOOT.PBT, etc) have all been replaced by a single
                    scriptable Boot Menu(BOOTMENU.PBT) which allows for much greater customization of how your
                    disc booting is handled.

                - Software controlled Sleep Mode is scripted in the BOOTMENU.PBT

                - The disc will now stop spinning when idle.

                - Added ability to remove BOOT directory and all sub-directories from Memory Card 2 to the
                    Memory Card Manager.

                - Each PBAT script is now run as it's own "session", this changes the following behaviors:
                    You no longer need to UNSET all variables at the end of your script.  However, it is
                        recommended that you unset variables if you have a large number of variables in
                        your script as any given script can only have a total of 128 local variables.
                    You can LOADEXEC other PBAT files from within your PBAT file without having variable
                        conflicts.
                    You cannot share LOCAL variables with other scripts any longer.

                - Added "SETENV" command to PBAT.  "SETENV" allows you to create a variable which are shared
                    with all sessions:
                    SETENV "MY_SHARED_VAR" "My shared value"

                - Added "IFNOT" and "ELSEIFNOT" commands to PBAT.  They work just the way they sound,
                    if the condition is NOT met, the code following will be executed.

                - Added "EXISTS" operator to PBAT "IF" and "ELSEIF" commands:
                    IF "cdrom0:\PS2.ELF" "EXISTS" ...

                - Added "GOTO" command to PBAT. IMPORTANT NOTE: Do NOT use GOTO to jump to a label which is
                    within an IF statement! Doing so will result in script failure.

                - Added support for labels to PBAT(Note: labels only work with "GOTO")

                - Added "GETDISKTYPE" command to PBAT.
                    GETDISKTYPE "MY_VAR"

                - Added "SETBIOS" command to PBAT.
                    SETBIOS "PS2"

                - Added "PARSECNF" command to PBAT.
                    PARSECNF "cdrom0:\SYSTEM.CNF" "BOOT_NAME" "BOOT_TYPE"

                - Added "LOADSRAM" command to PBAT.
                    LOADSRAM "mc0:/BOOT/BM/PS1LOGO.BIN"

                - Added "EXIT" command to PBAT.
                    EXIT "0"

                - Added "PEEKB", "PEEKH", "PEEKW", "POKEB", "POKEH", "POKEW" commands to PBAT.
                    PEEKB "0x1F40200F" "MY_VAR_NAME"
                    POKEW "0x00101234" "0x12"

            Bug Fixes:
                - Fixed icon filename case so BM icon shows up properly in PS2 browser.

                - Fixed bug where last line of a PBT file would not be executed unless it ended in a newline.

                - Fixed bug where "SHUTDOWN" command did not work properly.

Release 9 -
        This is just a release to fix a mistake in the "cc-iso-builder.lua" file included in
            Release 8 as well as a typo in FLASHER.ELF.  These bugs would cause installation of
            BootManager to fail when installing from disc.

Release 8 -
        BootManager Changes:
            - Added BM memory card icon to software package, BM icon now shows up when viewing
                memory card in PS2 browser.

            - Fixed a bug when manually loading a disc if autoload was disabled.

            - Added disc icon for BMI(BootManager Installer) discs.

            - Fixed bug causing ATAD Auto-Patcher and potentially other features to fail.

            - Added Video Stabilizer DVD Video Enhancement which allows removal of Macrovision
                for improved video quality.

            - BM is now completely independant of the firmware for disc validation, instead using
                4 different boot scripts:
                    BOOTPS1.PBT <- PS1 disc boot script
                    BOOTPS2.PBT <- PS2 disc boot script
                    BOOTDVDV.PBT <- DVD Video boot script
                    BOOTCDDA.PBT <- CD Digital Audio("Audio CD") boot script.

            PBAT:
                - Fixed bug with variable names shorter than 3 characters(and perhaps other places).

                - Added IF(EQU, NEQ, ISIN), ELSEIF(EQU, NEQ, ISIN), ELSE and ENDIF commands to PBAT.

                - Added SETAUTH and CYCLETRAY commands to PBAT.

                - Added RRM and RCOPY commands to PBAT. NOTE: RRM and RCOPY will only work on file systems
                    that support directory access functions.

            - Many little changes, fixes, etc...

        Firmware Changes:
            - Integration of UCL N2E unpacker(written by Pixel taken as part of ps2-packer) allow for
                compression of the firmware to fit more code and data.

            - LOADER.S is now only used to load another binary out of CC EEPROM, unpack and execute it.

            - OSDHOOK.S replaces parts of the old LOADER.S and all of VALIDATOR.S.

            - Firmware no longer provides a method for homebrew applications to determine disc validation.

        Other Changes:
            - New CCIGEN.EXE with integrated OSDSYS Hook packer.

            - CCIGEN source is available for download from the official Crystal Chips website at
                http://www.crystal-chips.com/

            - New FLASHER.ELF supporting installation of latest BM.ELF and scripts.

Release 7 -
        BootManager Changes:
            Implemented new Application Installer Menu system.
            Fixed a problem with force video fixes in some games.
            Fixed miscellaneous bugs/texts.

Release 6 -
        BootManager Changes:
            Fixed another bug with the DVD Video "Green Screen Fix".  Seems to work perfectly now.

Release 5 -
        BootManager Changes:
            Fixed configuration bug for PS1 Disc Speed, PS1 Texture Mapping and DVD Video "Green Screen Fix".
            Added CD Digital Audio(CDDA) bootstrap, BM will now execute the PS2 browser for CD audio discs.
            Fixed configuration bug for autoload disc settings.

Release 4 -
        Made a small change to CCHW.S.
        Fixed a couple bugs in BM causing lockups when booting discs on some consoles as well as a bug
        in he path for install scripts.

Release 3 -
        Added ability to disable tray cycling for DVD videos if not required by player.
        Partially combined loader.s and ps2boot.s, split remainder of functionality into
        validator.s.
        Added cd-tool by Pixel for automating upgrade image generation.
        Removed HOSTUPG.ELF, PS2.ELF can be run from either host or cdrom.

Release 2 -
        Fixed macros.inc path in ps1logo.s
        Fixed file name in PS2.ELF
        Added HOSTUPG.ELF

Release 1 -
        Initial release.

This documentation is not the best, we'll improve it as time goes on.

Included in this package is the application ASM5900 by wiRe of the group Napalm.  We take no credit for
the creation of this application.  In addition, you may download this application from his site at
http://wire.napalm-x.com/.  There was no license file included in the release so there is none included
here.

CCITOOL.EXE and N2EPACK.EXE are applications written by Crystal Chips for generating CCI firmware images for use with
the Crystal Chip hardware.  Any other uses are strictly prohibited.  You may freely distribute this package
in whole, or in part provided you retain this file and do not remove or modify any of the credits.  Use
of CCITOOl, N2EPACK or associated applications is at your own risk.  Crystal Chips is not responsible for any damages
caused directly or indirectly by the use of these applications.  That is not to say there is any malicious
code in our software, only that if something goes wrong, we will not take responsibility.  Source code for
CCITOOL and N2EPACK are available for download from the official Crystal Chips website at http://www.crystal-chips.com/

cd-tool is written by Pixel and is packaged with our firmware with his permission.  This tool allows you to
generate upgrade images easily using the "makeit.bat" file.

BootManager and some other PS2 applications we provide use the open-source ps2sdk created by members of
the PS2DEV community.  You can download ps2sdk and many other great bits of code from the official PS2DEV
website at ps2dev.org.  These guys are responsible for there being a way to create homebrew apps, feel free to
let them know that you appreciate what they do.

To build the Crystal Chip firmware and upgrade disc image:

Extract all files to the same folder.

If you wish to make changes to the source or boot scripts, now is the time to do it.

Run the "makeit.bat" file.  This will compile the firmware then generate "cc-upgrade.bin" and "cc-upgrade.cue"
files.

Burn cc-upgrade.bin using your favorite bin/cue compatible burning software(CDRWIN, Alcohol, Fireburner,
Burn-At-Once, etc).

Notes on upgrading:

Step 1: Insert the Upgrade Disc into your PS2 and let it start up.
Step 2: Choose "Upgrade Firmware" and wait for it to complete.
Step 3: If you wish to use BootManager(highly suggested!):
    For CC1.0-CC1.2: make sure you have a memory card inserted in Slot 1 with AT LEAST 1mbyte free.
    For all CC revisions: choose "Install BootManager" then wait for it to complete.
Step 4: Reboot your PS2, you're all done!

Notes on upgrading from host(naplink/ps2link/etc):

After running the "makeit.bat" file, you can simply run "BM2.ELF"(inside the "FILES\BM" directory) with naplink/ps2link
and follow the steps outlined above.
