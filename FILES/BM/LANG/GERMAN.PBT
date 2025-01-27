#
# German translation of Crystal Chips BootManager menu for BMMENUS.PBT v1.4
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

SET "TITLE" "Deutsch"
SET "DESC" "Deutsche Sprachdatei."

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
    COPY "$PWD$/GERMAN.PBT" "$BM.BM_PATH$/LANG/GERMAN.PBT"
    EXIT 0

:REMOVE
    RRM "$ARG0$"
    EXIT 0

:LOAD
ECHO "Loading German text..."

# Miscellaneous
SET "BM.TXT_YES" "Ja"
SET "BM.TXT_NO" "Nein"
SET "BM.TXT_ON" "AN"
SET "BM.TXT_AUTO" "AUTO"
SET "BM.TXT_OFF" "AUS"
SET "BM.TXT_BOOT" "BOOT"
SET "BM.TXT_APP" "PROG"
SET "BM.TXT_STANDARD" "Standard"
SET "BM.TXT_FAST" "Schnell"
SET "BM.TXT_SMOOTH" "Flie�end"
SET "BM.TXT_AUTHOR" "Author(en)"
SET "BM.TXT_VERSION" "Version"
SET "BM.TXT_DESC" "Beschreibung"
SET "BM.TXT_DELAY" "Verz�gerung(Sek)"
SET "BM.TXT_CONFIRM" "Sind Sie sicher?"
SET "BM.TXT_BACK" "Zum Anfang"
SET "BM.TXT_HINT_BACK" "Zur�ck zum Anfang dieses Men�s."
SET "BM.TXT_CHOOSE_DEST" "W�hle Zielort"
SET "BM.TXT_MAIN" "Zur�ck zum Hauptmen�"
SET "BM.TXT_CURRENT" "Aktuell"
SET "BM.TXT_CONFIRM_CHOICE" "Auswahl best�tigen"
SET "BM.TXT_HINT_CANCEL_CHOICE" "Abbrechen und zum vorherigen Men� zur�ckkehren."
SET "BM.TXT_HINT_CONFIRM_CHOICE" "Best�tigt die gew�hlte Option."

#Media
SET "BM.TXT_PS1" "PS1"
SET "BM.TXT_PS2" "PS2"
SET "BM.TXT_DVDV" "DVD Video"
SET "BM.TXT_CDDA" "CD Audio"
SET "BM.TXT_OTHER" "Andere"
SET "BM.TXT_NODISC" "Keine Disk"

SET "BM.TXT_LANGUAGE" "Sprache"
SET "BM.TXT_HINT_BM_LANG" "�ndere die Sprache des BootManagers."
SET "BM.TXT_INSTALL_LANG" "Installiere Sprache"
SET "BM.TXT_HINT_INSTALL_LANG" "Installiere zus�tzliche Sprachdateien."
SET "BM.TXT_REMOVE_LANG" "Entferne Sprache"
SET "BM.TXT_HINT_REMOVE_LANG" "Entferne installierte Sprachdateien."
SET "BM.TXT_CHOOSE_LANG" "W�hle Sprache"
SET "BM.TXT_SOURCE_DEV" "W�hle Quelllaufwerk"
SET "BM.TXT_LANG_INST_AVAIL" "Verf�gbare Sprachen"
SET "BM.TXT_LANG_REMOVE_AVAIL" "Installierte Sprachen"

# Main Menu
SET "BM.TXT_MAIN_MENU" "Hauptmen�"

# Install BootManager
SET "BM.TXT_INST_BM" "BootManager installieren"
SET "BM.TXT_HINT_INST_BM" "BootManager installieren."
SET "BM.TXT_CHOOSE_INST_BM" "W�hle Installationsoption"
SET "BM.TXT_FULL" "Voll"
SET "BM.TXT_HINT_FULL" "Installiere BootManager mit allen Laufwerkstreibern."
SET "BM.TXT_MINIMAL" "Minimal"
SET "BM.TXT_HINT_MINIMAL" "Installiere BootManager ohne zus�tzliche Laufwerkstreiber f�r USB, HDD und Netzwerk."
SET "BM.TXT_INSTALL_BM_TO" "Installiere BootManager nach..."

# Firmware Manager
SET "BM.TXT_UPG_FIRMWARE" "Firmwareupgrade"
SET "BM.TXT_HINT_UPG_FIRMWARE" "Installiert die Firmware auf den Crystal Chip."

SET "BM.TXT_FORMAT_DFFS" "Formatiere DFFS"
SET "BM.TXT_HINT_FORMAT_DFFS" "Formatiere den Crystal Chip Flash."
SET "BM.TXT_DFFS_REM_BM" "Entferne dffs:/BM"
SET "BM.TXT_HINT_DFFS_REM_BM" "Entferne BootManager Verzeichnis vom Crystal Chip Flash."
SET "BM.TXT_FW_MANAGER" "Firmware Manager"
SET "BM.TXT_HINT_FW_MANAGER" "Firmware Manager erlaubt es Ihnen die Crystal Chip Firmware zu aktualisieren un zu l�schen."
SET "BM.TXT_UPG_FW" "Firmware aktualisieren"
SET "BM.TXT_HINT_UPG_FW" "Aktualisiert die CrystalChip Firmware von einer CCI Datei."
SET "BM.TXT_ERASE_FW" "Firmware l�schen"
SET "BM.TXT_HINT_ERASE_FW" "Den kompletten Inhalt des CrystalChip Flash/EEPROM l�schen."
SET "BM.TXT_ASK_ERASE_FW" "Sind Sie sicher dass Sie die Firmware l�schen wollen?"

SET "BM.TXT_FW_TITLE" "Firmware-Varianten:"
SET "BM.TXT_FW_QUESTION" "Boot-Manager von welcher Schnittstelle aus ausführen?"
SET "BM.TXT_FW_MC0" "1- BM läuft von Speicherkarte 1"
SET "BM.TXT_FW_MC0_HINT" "Installiere CC FW und führe BM auf MemCard1 aus"
SET "BM.TXT_FW_MC1" "2- BM läuft von Speicherkarte 2"
SET "BM.TXT_FW_MC1_HINT" "Installiere CC FW und führe BM auf MemCard1 aus"
SET "BM.TXT_FW_USB" "3- BM läuft von USB"
SET "BM.TXT_FW_USB_HINT" "Installiere CC FW und führe BM auf USB aus. WICHTIG: USB-Treiber MÜSSEN über den Geräte-Manager auf MemCard1 installiert werden"
SET "BM.TXT_FW_HDD" "4- BM läuft von HDD"
SET "BM.TXT_FW_HDD_HINT" "Installiere CC FW und führe BM auf HDD aus. WICHTIG: HDD-Treiber MÜSSEN über den Gerätemanager auf MemCard1 installiert"

# Reload Menu
SET "BM.TXT_RELOAD_MENU" "Men� neu laden"
SET "BM.TXT_HINT_RELOAD_MENU" "Neuladen der BMMENUS.PBT Datei."

# Boot Menu
SET "BM.TXT_BOOT_MEDIA" "CD/DVD starten"
SET "BM.TXT_HINT_BOOT_MENU" "Startet Spiele und Programme von CD/DVD."

# Application Browser
SET "BM.TXT_APP_BROWSER" "Programm Manager"
SET "BM.TXT_HINT_APP_BROWSER" "L�dt und installiert Homebrew Programme von Memory Card, CD/DVD, USB, HDD, etc."
SET "BM.TXT_APP" "Programm(e)"
SET "BM.TXT_APPS" "Programme"
SET "BM.TXT_DEV" "Laufwerk(e)"
SET "BM.TXT_DEVS" "Laufwerke"
SET "BM.TXT_THM" "Theme(s)"
SET "BM.TXT_THMS" "Themes"
SET "BM.TXT_MENU_INSTALL" "Installieren"
SET "BM.TXT_INSTALL_AVAIL" "Verf�gbar auf"
SET "BM.TXT_MENU_REMOVE" "Entfernen"
SET "BM.TXT_REMOVE_AVAIL" "Installiert auf"

# Run Application Browser
SET "BM.TXT_MENU_RUN" "Starten"
SET "BM.TXT_HINT_RUN_APP" "Startet ein Programm von einem Laufwerk."
SET "BM.TXT_RUN_APP_FROM" "Starte Programm von"
SET "BM.TXT_RUN_AVAIL" "Ausf�hrbar auf"

# Install Application Browser
SET "BM.TXT_HINT_INSTALL_APP" "Installiert ein Programm von einem Laufwerk auf ein anderes."
SET "BM.TXT_INSTALL_APP_FROM" "Installiere Programm(e) von"
SET "BM.TXT_INSTALL_APP_TO" "Installiere Programm auf"

# Remove Application Browser
SET "BM.TXT_HINT_REMOVE_APP" "Entfernt ein Programm von einem Laufwerk."
SET "BM.TXT_REMOVE_APP_FROM" "Entferne Programm(e) von"

# Dev Manager
SET "BM.TXT_DEV_MANAGER" "Laufwerk Manager"
SET "BM.TXT_HINT_DEV_MANAGER" "Installiere and entferne Laufwerktreiber."

# Install Device
SET "BM.TXT_HINT_INSTALL_DEV" "Installiere die Treiber f�r Laufwerke."
SET "BM.TXT_INSTALL_DEV_FROM" "Installiere Laufwerktreiber von"
SET "BM.TXT_INSTALL_DEV_TO" "Installiere Laufwerktreiber auf"

# Remove Device
SET "BM.TXT_HINT_REMOVE_DEV" "Entferne die Treiber f�r Laufwerke."
SET "BM.TXT_REMOVE_DEV_FROM" "Entferne Laufwerktreiber von"

# Devices
SET "BM.TXT_MC_DESC" "Memory Karte Steckplatz"
SET "BM.TXT_MMCE_DESC" "Mehrzweck Speicherkarten Emulator steckplatz"
SET "BM.TXT_MMCE_DESC_1" "MMCE Treiber"
SET "BM.TXT_CCFLASH_DESC" "Crystal Chip Flashlaufwerk"
SET "BM.TXT_CDVD_DESC" "CD/DVD Laufwerk"
SET "BM.TXT_HOST_DESC" "PC Host �ber PS2Client"
SET "BM.TXT_HOST_DESC_1" "PC Host Treiber"
SET "BM.TXT_USB_DESC" "USB Hard Festplatte/Stick"
SET "BM.TXT_USB_DESC_1" "USB Treiber"
SET "BM.TXT_HDD_DESC" "PS2 Festplatte"
SET "BM.TXT_HDD_DESC_1" "PS2 Festplattentreiber"
SET "BM.TXT_FTP_DESC" "FTP Treiber"
SET "BM.TXT_NET" "Netzwerk"
SET "BM.TXT_NET_DESC" "PS2 Netzwerktreiber"

# Memory Card Manager
SET "BM.TXT_MC_MANAGER" "Memory Card Manager"
SET "BM.TXT_HINT_MC_MANAGER" "Formatiert Memory Cards, entfernt den BootManager, etc."

SET "BM.TXT_MC_REM_ALL_APPS" "Alle Programme entfernen"
SET "BM.TXT_HINT_MC_REM_ALL_APPS" "L�scht alle Programme auf der Memory Card in Steckplatz 1."
SET "BM.TXT_MC_REM_BOOT" "Entferne mc0:/BOOT"
SET "BM.TXT_HINT_MC_REM_BOOT" "L�scht das BootManager 1.x Verzeichnis auf der Memory Card in Steckplatz 1."
SET "BM.TXT_MC_REM_BM" "Entferne mc0:/BM"
SET "BM.TXT_HINT_MC_REM_BM" "L�scht das BootManager 2.x Verzeichnis auf der Memory Card in Steckplatz 1."
SET "BM.TXT_MC0_COPY_HOST" "Kopiere mc0:/* nach HOST"
SET "BM.TXT_HINT_MC0_COPY_HOST" "Kopiert den Inhalt der Memory Card in Steckplatz 1 ins HOST-Verzeichnis."
SET "BM.TXT_MC1_COPY_HOST" "Kopiere mc1:/* to HOST"
SET "BM.TXT_HINT_MC1_COPY_HOST" "Kopiert den Inhalt der Memory Card in Steckplatz 1 ins HOST-Verzeichnis."
SET "BM.TXT_MC0_ERASE" "L�sche mc0:/*"
SET "BM.TXT_HINT_MC0_ERASE" "L�scht den kompletten Inhalt der Memory Card in Steckplatz 1."
SET "BM.TXT_MC1_ERASE" "L�sche mc1:/*"
SET "BM.TXT_HINT_MC1_ERASE" "L�scht den kompletten Inhalt der Memory Card in Steckplatz 2."

# System Information
SET "BM.TXT_SYS_INFO" "System Informationen"
SET "BM.TXT_HINT_SYS_INFO" "�berblick �ber die Hardware der Konsole."
SET "BM.TXT_CONSOLE_BIOS" "Konsolen BIOS ROM"
SET "BM.TXT_CONSOLE_VERSION" "Konsolenversion"
SET "BM.TXT_CONSOLE_REGION" "Konsolenregion"
SET "BM.TXT_CONSOLE_MODEL" "Konsolenmodel"

# Configuration Menu
SET "BM.TXT_CONFIGURATION" "Konfiguration"
SET "BM.TXT_HINT_CONFIGURATION" "�ndert die Einstellungen von BootManager und CrystalChip."
SET "BM.TXT_INTERF_CONFIG" "Interface Konfiguration"
SET "BM.TXT_SOFTWARE_CONFIG" "Software Konfiguration"

# BootManager Configuration
SET "BM.TXT_BM_CONFIG" "BootManager Konfiguration"
SET "BM.TXT_HINT_BM_CONFIG" "�ndere die Einstellungen des BootManagers."

SET "BM.TXT_BM_VIDEO_MODE" "BM Anzeigemodus"
SET "BM.TXT_HINT_BM_VIDEO_MODE" "!! ACHTUNG !! Diese Einstellung �ndert den Anzeigemodus des BootManagers!"

SET "BM.TXT_BM_SCREEN_POS" "BM Bildschirmposition"
SET "BM.TXT_HINT_BM_SCREEN_POS" "Anpassen der BootManager Position auf dem Bildschirm."

SET "BM.TXT_HINT_SCROLLBAR" "Hinweisleiste"
SET "BM.TXT_HINT_HINT_SCROLLBAR" "Schaltet die Hinweisleiste unten im Bild an und aus."

SET "BM.TXT_SCROLLBAR_SPEED" "Hinweisleiste Geschwindigkeit"
SET "BM.TXT_HINT_SCROLLBAR_SPEED" "Bestimmt die Laufgeschwindigkeit der Hinweisleiste."

# Network Configuration Menu
SET "BM.TXT_NET_CONFIG" "Netzwerk Konfiguration"
SET "BM.TXT_HINT_NET_CONFIG" "�ndere die PS2 Netzwerk Einstellungen."

SET "BM.TXT_START_NET" "Starte Netzwerk"
SET "BM.TXT_HINT_START_NET" "Starte das PS2 Netzwerk."
SET "BM.TXT_START_HOST" "Starte PC Host Server"
SET "BM.TXT_HINT_START_HOST" "Starte den PS2 PC Host server."
SET "BM.TXT_START_FTP" "Starte FTP Server"
SET "BM.TXT_HINT_START_FTP" "Starte den PS2 FTP server."

SET "BM.TXT_AUTOSTART_NET" "Autostart Netzwerk"
SET "BM.TXT_HINT_AUTOSTART_NET" "Automatisches starten des Netzwerks wenn BM startet."
SET "BM.TXT_AUTOSTART_HOST" "Autostart PC Host Server"
SET "BM.TXT_HINT_AUTOSTART_HOST" "Automatisches starten des PC Host Servers wenn BM startet."
SET "BM.TXT_AUTOSTART_FTP" "Autostart FTP Server"
SET "BM.TXT_HINT_AUTOSTART_FTP" "Automatisches starten des FTP Servers wenn BM startet."

SET "BM.TXT_PS2_IP" "PS2 IP"
SET "BM.TXT_HINT_PS2_IP" "Dies ist die IP Addresse der PS2."
SET "BM.TXT_SUBNET_MASK" "Subnet Maske"
SET "BM.TXT_HINT_SUBNET_MASK" "Dies ist die Subnet Maske des Netzwerks, normalerweise 255.255.255.0."
SET "BM.TXT_DEF_GATEWAY" "Standard Gateway"
SET "BM.TXT_HINT_DEF_GATEWAY" "Dies ist die IP Addresse des Standard Netzwerk Gateways."

SET "BM.TXT_PRIMARY_DNS" "Prim�rer DNS Server"
SET "BM.TXT_HINT_PRIMARY_DNS" "Dies ist die IP Addresse des prim�ren DNS Servers."
SET "BM.TXT_SECONDARY_DNS" "Sekund�rer DNS Server"
SET "BM.TXT_HINT_SECONDARY_DNS" "Dies ist die IP Addresse des sekund�ren DNS Servers."

# HDD Configuration Menu
SET "BM.TXT_HDD_CONFIG" "HDD Konfiguration"
SET "BM.TXT_HINT_HDD_CONFIG" "�ndere die Einstellungen der PS2 IDE Festplatte."

SET "BM.TXT_START_HDD" "Starte HDD"
SET "BM.TXT_HINT_START_HDD" "Lade HDD Treiber und mounte die HDD."

SET "BM.TXT_AUTOSTART_HDD" "Autostart HDD"
SET "BM.TXT_HINT_AUTOSTART_HDD" "Automatisches laden der HDD Treiber und mounten der HDD wenn BM startet."

# Autoload Configuration
SET "BM.TXT_AUTOLOAD_CONFIG" "Autoload Konfiguration"
SET "BM.TXT_HINT_AUTOLOAD_CONFIG" "Konfiguriere das Autoload Verhalten f�r die verschiedenen Software-Typen."

SET "BM.TXT_AUTOLOAD" "Autoload"
SET "BM.TXT_HINT_AUTOLOAD" "Autoload an und aus schalten."

SET "BM.TXT_ACTION" "Aktion"

SET "BM.TXT_AUTOLOAD_PS1" "Autoload PS1"
SET "BM.TXT_HINT_AL_ACT_PS1" "Diese Aktion wird ausgef�hrt, wenn eine PS1 Disk gestartet wird."
SET "BM.TXT_AL_PS1_APP_FROM" "W�hle PS1 Autoload Programm von"
SET "BM.TXT_AL_PS1_AVAIL" "Verf�gbar f�r PS1 Autoload auf"

SET "BM.TXT_AUTOLOAD_PS2" "Autoload PS2"
SET "BM.TXT_HINT_AL_ACT_PS2" "Diese Aktion wird ausgef�hrt, wenn eine PS2 Disk gestartet wird."
SET "BM.TXT_AL_PS2_APP_FROM" "W�hle PS2 Autoload Programm von"
SET "BM.TXT_AL_PS2_AVAIL" "Verf�gbar f�r PS2 Autoload auf"

SET "BM.TXT_AUTOLOAD_DVDV" "Autoload DVD Video"
SET "BM.TXT_HINT_AL_ACT_DVDV" "Diese Aktion wird ausgef�hrt, wenn eine DVD Video Disk gestartet wird."
SET "BM.TXT_AL_DVDV_APP_FROM" "W�hle DVD Video Autoload Programm von"
SET "BM.TXT_AL_DVDV_AVAIL" "Verf�gbar f�r DVD Video Autoload auf"

SET "BM.TXT_AUTOLOAD_CDDA" "Autoload CD Audio"
SET "BM.TXT_HINT_AL_ACT_CDDA" "Diese Aktion wird ausgef�hrt, wenn eine CD Audio Disk gestartet wird."
SET "BM.TXT_AL_CDDA_APP_FROM" "W�hle CD Audio Autoload Programm von"
SET "BM.TXT_AL_CDDA_AVAIL" "Verf�gbar f�r CD Audio Autoload auf"

SET "BM.TXT_AUTOLOAD_OTHER" "Autoload Andere Disk"
SET "BM.TXT_HINT_AL_ACT_OTHER" "Diese Aktion wird ausgef�hrt, wenn ein anderer Disktyp gestartet wird."
SET "BM.TXT_AL_OTHER_APP_FROM" "W�hle Andere Disk Autoload Programm von"
SET "BM.TXT_AL_OTHER_AVAIL" "Verf�gbar f�r Andere Disk Autoload auf"

SET "BM.TXT_AUTOLOAD_NODISC" "Autoload Keine Disk"
SET "BM.TXT_HINT_AL_ACT_NODISC" "Diese Aktion wird ausgef�hrt, wenn keine Disk eingelegt ist."
SET "BM.TXT_AL_NODISC_APP_FROM" "W�hle Keine Disk Autoload Programm von"
SET "BM.TXT_AL_NODISC_AVAIL" "Verf�gbar f�r Keine Disk Autoload auf"

SET "BM.TXT_SET_AL_APP" "Bestimme Autoload Programm"
SET "BM.TXT_HINT_SET_AL_APP" "W�hle das Programm, das beim Autoload dieser Disk ausgef�hrt werden soll."

SET "BM.TXT_AL_DELAY" "Autoload Verz�gerung(Sek)"
SET "BM.TXT_HINT_AL_DELAY" "Bestimmt die Leerlaufzeit, in Sekunden, bevor der BootManager den Autoload aktiviert."

# PS1 Configuration Menu
SET "BM.TXT_PS1_CONFIG" "PS1 Konfiguration"
SET "BM.TXT_HINT_PS1_CONFIG" "�ndere die Einstellungen f�r PS1 Spiele und Software."

SET "BM.TXT_DISC_SPEED" "Disk Geschwindigkeit"
SET "BM.TXT_HINT_DISC_SPEED" "Diese Option erlaubt es, die PS1-Disk Lese-Geschwindigkeit zu erh�hen. Bitte beachten Sie, dass diese Option eventuell nicht mit jeder PS1 Software kompatibel ist."

SET "BM.TXT_TEX_MAPPING" "Texturen-Mapping"
SET "BM.TXT_HINT_TEX_MAPPING" "Diese Option aktiviert die Texturgl�ttung f�r PS1 Software. Bitte beachten Sie, dass diese Option eventuell nicht mit jeder PS1 Software kompatibel ist."

# Common for PS1 and PS2
SET "BM.TXT_NTSC_SW_VID_FIXES" "NTSC Anzeige-Korrekturen"
SET "BM.TXT_HINT_NTSC_SW_VID_FIXES" "Schalte NTSC-Software Anzeige-Korrekturen an oder aus."

SET "BM.TXT_PAL_SW_VID_FIXES" "PAL Anzeige-Korrekturen"
SET "BM.TXT_HINT_PAL_SW_VID_FIXES" "Schalte PAL-Software Anzeige-Korrekturen an oder aus."

SET "BM.TXT_FORCE_VSYNC" "Erzwinge Vertical Sync"
SET "BM.TXT_HINT_FORCE_VSYNC" "Erzwinge Vertical Sync f�r die Software."

SET "BM.TXT_FORCE_COLOR" "Erzwinge Farbausgabe"
SET "BM.TXT_HINT_FORCE_COLOR" "Erzwinge Farbausgabe f�r die Software."

SET "BM.TXT_SCREEN_MODS" "Bildposition Modifizierung"
SET "BM.TXT_HINT_SCREEN_MODS" "Diese Einstellung erlaubt das Ein- oder Ausschalten der Bildschirmpositions Einstellungen."

SET "BM.TXT_SCREEN_MOD" "Bildposition X/Y"
SET "BM.TXT_HINT_SCREEN_X_MOD" "Bestimmt die X(horizontale) und Y(vertikale) Anzeigeposition von Software."

# PS2 Configuration Menu
SET "BM.TXT_PS2_CONFIG" "PS2 Konfiguration"
SET "BM.TXT_HINT_PS2_CONFIG" "�ndere die Einstellungen f�r PS2 Spiele und Software."

SET "BM.TXT_MEGAMEM_PATCHER" "MegaMemory Patcher"
SET "BM.TXT_HINT_MEGAMEM_PATCHER" "Ein/Ausschalten des Patches zum Benutzen �lterer MegaMemory/MAX Memory Karten."

SET "BM.TXT_ATAD_PATCHER" "ATAD(HDD) Patcher"
SET "BM.TXT_HINT_ATAD_PATCHER" "Ein/Ausschalten des ATAD-Patches zum Benutzen von nicht-Sony HDDs mit HDD-unterst�tzten PS2 Spielen."

SET "BM.TXT_DVDDL_PATCHER" "DVD+R Dual Layer Patcher"
SET "BM.TXT_HINT_DVDDL_PATCHER" "Ein/Ausschalten des DVD+R Dual Layer Disk Patches."

# DVD Configuration Menu
SET "BM.TXT_DVD_CONFIG" "DVD Konfiguration"
SET "BM.TXT_HINT_DVD_CONFIG" "�ndere die Einstellungen f�r DVDs."

SET "BM.TXT_DVD_VIDEO_FIXES" "DVD Anzeige-Korrekturen"
SET "BM.TXT_HINT_DVD_VIDEO_FIXES" "Schalte DVD Anzeige-Korrekturen an oder aus."

SET "BM.TXT_REGION_FREE" "Region Abschalten"
SET "BM.TXT_HINT_REGION_FREE" "Diese Fuktion erlaubt es importierte DVDs mit der PS2 anzusehen."

SET "BM.TXT_DVD_PLAYER_REGION" "DVD-Player Region"
SET "BM.TXT_HINT_DVD_PLAYER_REGION" "Dieses Feature erlaubt es die DVD-Player Region f�r RCE-gesch�tzte Filme einzustellen. Normalerweise sollte der Wert 1 gesetzt sein."

SET "BM.TXT_RGB_FIX" "RGB-Fix"
SET "BM.TXT_HINT_RGB_FIX" "Dieser Fix erlaubt es den Gr�nstich beim anschauen von DVD-Filmen zu entfernen."

SET "BM.TXT_VIDEO_STAB" "Bild-Stabilisation"
SET "BM.TXT_HINT_VIDEO_STAB" "Hier kann die Macrovision-Ausgabe deaktiviert werden, was manchmal zu einer verbesserten Bildqualit�t f�hrt."

SET "BM.TXT_HINT_FORCE_COLOR_DVD" "Dieses Feature erlaubt eine bestimmte Farbausgabe f�r DVD-Filme zu erzwingen."

# Disc Boot Menu
SET "BM.TXT_BOOT_MENU" "Disk Boot Men�"
SET "BM.TXT_BOOT_ENHANCED" "Boote im Erweiterten Modus"
SET "BM.TXT_HINT_BOOT_ENHANCED" "Boote die Disk mit allen momentan gew�hlten Verbesserungen."
SET "BM.TXT_BOOT_MINIMAL" "Boote im Minimal Modus"
SET "BM.TXT_HINT_BOOT_MINIMAL" "Boote die Disk mit mimimalen Verbesserungen."
SET "BM.TXT_BOOT_SLEEP" "Boote im Schlaf Modus"
SET "BM.TXT_HINT_BOOT_SLEEP" "Boote die Disk mit abgeschalteten Verbesserungen und Crystal Chip."

# Theme Manager
SET "BM.TXT_THEME_MANAGER" "Theme Manager"
SET "BM.TXT_HINT_THEME_MANAGER" "Konfiguriere, �ndere, installiere and entferne BootManager Themes."
SET "BM.TXT_SELECTED_THEME" "Gew�hltes Theme"
SET "BM.TXT_MANAGE_THEME" "Manage Themes"

# Theme Configuration
SET "BM.TXT_THEMES" "Themes"
SET "BM.TXT_THEME_CONFIG" "Theme Konfiguration"
SET "BM.TXT_HINT_THEME_CONFIG" "Konfiguriere das BootManager Men� Theme."

SET "BM.TXT_XY" "X/Y Position"
SET "BM.TXT_WH" "Breite/H�he"

SET "BM.TXT_THEME_MENU_IMG" "Men� Bild"
SET "BM.TXT_HINT_THEME_MENU_IMG_XY" "Passe die X/Y Bildschirm Position des Men� Hintergrundbilds an."
SET "BM.TXT_HINT_THEME_MENU_IMG_WH" "Passe die Breite/H�he des Men� Hintergrundbilds an."

SET "BM.TXT_THEME_DISC_IMG" "Disk Bild"
SET "BM.TXT_HINT_DISC_IMG_XY" "Passe die X/Y Bildschirm Position des Disk Bildes an."
SET "BM.TXT_HINT_DISC_IMG_WH" "Passe die Breite/H�he des Disk Bildes an."

SET "BM.TXT_THEME_MENU_TEXT" "Men�"
SET "BM.TXT_HINT_THEME_MENU_XY" "Passe die X/Y Bildschirm Position des Men�s an."
SET "BM.TXT_HINT_THEME_MENU_WH" "Passe die Breite/H�he des Men�s an."

SET "BM.TXT_THEME_MENU_TITLE" "Men� Titel"
SET "BM.TXT_HINT_THEME_MENU_TITLE_XY" "Passe die X/Y Bildschirm Position des Men� Titels an."
SET "BM.TXT_HINT_THEME_MENU_TITLE_WH" "Passe die Breite/H�he des Men� Titels an."

SET "BM.TXT_BM_VERSION" "BM Versionslabel"
SET "BM.TXT_HINT_BM_VERSION" "Passe die X/Y Bildschirm Position des BM Versionstextes an."

SET "BM.TXT_THEME_SCROLLER" "Hinweisleiste"
SET "BM.TXT_HINT_THEME_SCROLLER_XY" "Passe die X/Y Bildschirm Position der Hinweisleiste an."
SET "BM.TXT_HINT_THEME_SCROLLER_WH" "Passe die Breite/H�he der Hinweisleiste an."

SET "BM.TXT_THEME_COLOR" "Theme Farben"
SET "BM.TXT_THEME_BG_COLOR" "Hintergrund Farbe"
SET "BM.TXT_HINT_THEME_BG_COLOR" "W�hle die Farbe f�r den Hintergrund."
SET "BM.TXT_THEME_FONT_COLOR" "Schrift Farbe"
SET "BM.TXT_HINT_THEME_FONT_COLOR" "W�hle die Farbe f�r die Men�schrift."
SET "BM.TXT_THEME_FONT_COLOR_LABEL" "Titelschrift Farbe"
SET "BM.TXT_HINT_THEME_FONT_COLOR_LABEL" "W�hle die Farbe f�r Titelschrift und Versionslabel."
SET "BM.TXT_THEME_FONT_COLOR_SCROLLER" "Hinweisleiste Farbe"
SET "BM.TXT_HINT_THEME_FONT_COLOR_SCROLLER" "W�hle die Farbe f�r die Hinweisleiste."

# Change Theme
SET "BM.TXT_MENU_CHANGE" "�ndern"
SET "BM.TXT_HINT_THEME_CHANGE" "W�hle ein neues Theme und �ndere das Aussehen von BM."
SET "BM.TXT_CHANGE_THM_FROM" "W�hle Theme von"
SET "BM.TXT_CHANGE_AVAIL" "Verf�gbare Themes auf"

# Install Themes
SET "BM.TXT_HINT_THEME_INSTALL" "Installiere ein Theme von einem Laufwerk auf ein anderes."
SET "BM.TXT_INSTALL_THM_FROM" "Installiere Theme(s) von"
SET "BM.TXT_INSTALL_THM_TO" "Installiere Theme nach"

# Remove Themes
SET "BM.TXT_HINT_THEME_REMOVE" "Entferne ein Theme von einem Laufwerk."
SET "BM.TXT_REMOVE_THM_FROM" "Entferne Theme(s) von"

# Disc Test
SET "BM.TXT_PS1_TEST_INFO" "Disk Test wird jetzt die Crystal Chip PS1(aka SCEx) Authentifikation testen."
SET "BM.TXT_START_PS1_TEST" "Starte PS1 Disk Test"

SET "BM.TXT_DISC_TEST" "Disk Test"
SET "BM.TXT_HINT_DISC_TEST" "Disk Test erlaubt es die Crystal Chip Installation zu �berpr�fen, durch testen der PS1(aka SCEx) Authentifikation."

SET "BM.TXT_PS1_WORK" "PS1 Disk Authentifikation funktioniert!"
SET "BM.TXT_PS1_FAIL" "PS1 Disk Authentifikation fehlgeschlagen!"

SET "BM.TXT_CHECK_SX" "Bitte den CrystalChip SX Draht �berpr�fen."

# Misc Config
SET "BM.TXT_MISC_CONFIG" "Verschiedene Konfigurationen"
SET "BM.TXT_HINT_MISC_CONFIG" "Verschiedene Konfigurationsoptionen die in keine andere Kategorie passen."

SET "BM.TXT_GS_HOOK" "GS Hook"
SET "BM.TXT_HINT_GS_HOOK" "Der CrystalChip GS Hook wird benutzt um erweiterte Anzeige-Korrekturen f�r PS2 Software zu aktivieren, ist aber eventuell inkompatibel mit manchen Spielen."

SET "BM.TXT_IGR" "In-Game Reset"
SET "BM.TXT_HINT_IGR" "In-Game Reset(IGR) erlaubt es durch dr�cken und halten von L1+L2+R1+R2+Start+Select die PS2 aus einem PS2 Spiel heraus neu zu starten."

# Video Wizard
SET "BM.TXT_VID_WIZ" "Video Wizard"
SET "BM.TXT_VID_WIZ_1" "Dieser Wizard hilft dabei die Anzeigemodi herauszufinden die der Fernseher unterst�tzt."
SET "BM.TXT_VID_WIZ_2" "Wenn der Wizard abgeschlossen ist, wird er automatisch die besten Anzeige-Korrektur Optionen f�r das TV-Ger�t w�hlen."
SET "BM.TXT_VID_WIZ_3" "Jeder Schritt testet einen anderen Modus und es muss die passende Option gew�hlt werden zu dem was auf dem Bildschirm zu sehen ist."
SET "BM.TXT_VID_WIZ_4" "Wenn nach 10 Sekunden nichts zu sehen ist einmal X dr�cken und 10 Sekunden auf den n�chsten Bildschirm warten."
SET "BM.TXT_VID_WIZ_START" "Test starten"
SET "BM.TXT_HINT_VID_WIZ_START" "Startet den Video Wizard Anzeigemodus Test."

#Video Test
SET "BM.TXT_TEST_50HZ" "Teste 50Hz"
SET "BM.TXT_TEST_PAL" "Teste PAL Farbe"
SET "BM.TXT_TEST_60HZ" "Teste 60Hz"
SET "BM.TXT_TEST_NTSC" "Teste NTSC Farbe"
SET "BM.TXT_CAN_YOU_READ" "K�nnen Sie diesen Bildschirm lesen?"
SET "BM.TXT_YES_BUT" "Ja, aber der Bildschrim 'rollt'."
SET "BM.TXT_SCREEN_COLOR" "Ist dieser Bildschrim in Farbe?"

SET "BM.TXT_TEST_RESULTS" "Anzeigemodus Testergebnisse"
SET "BM.TXT_TEST_COMPLETE" "Test erfolgreich abgeschlossen!"
SET "BM.TXT_50HZ_YES" "Ihr Fernseher kann 50Hz anzeigen."
SET "BM.TXT_50HZ_NO" "Ihr Fernseher kann 50Hz nicht anzeigen."
SET "BM.TXT_60HZ_YES" "Ihr Fernseher kann 60Hz anzeigen."
SET "BM.TXT_60HZ_NO" "Ihr Fernseher kann 60Hz nicht anzeigen."
SET "BM.TXT_PAL_YES" "Ihr Fernseher kann PAL Farbe anzeigen."
SET "BM.TXT_PAL_NO" "Ihr Fernseher kann PAL Farbe nicht anzeigen."
SET "BM.TXT_NTSC_YES" "Ihr Fernseher kann NTSC Farbe anzeigen."
SET "BM.TXT_NTSC_NO" "Ihr Fernseher kann NTSC Farbe nicht anzeigen."
SET "BM.TXT_DONE" "Fertig"
SET "BM.TXT_RETURN_CONFIG" "Zum Konfigurationsmen� zur�ckkehren."

#Lockout/Pin Mode
SET "BM.TXT_CNF_LOCKOUT" "Sicherheit"
SET "BM.TXT_CNF_LOCKOUT_HINT" "Funktionen des BootManagers mit einer PIN sperren."
SET "BM.TXT_CNF_LOCKOUT_LABEL1" "Alle Funktionen sperren außer"
SET "BM.TXT_CNF_LOCKOUT_LABEL2" "Bootdisketten und Apps."
SET "BM.TXT_CNF_LOCKOUT_LABEL3" "Geben Sie Ihre PIN ein, um alle Funktionen freizuschalten."
SET "BM.TXT_CNF_LOCKOUT_LABEL4" "Um eine vergessene PIN zu löschen, installieren Sie den BootManager neu."
SET "BM.TXT_PIN_SETUP" "Wählen Sie eine PIN"
SET "BM.TXT_PIN_SETUP_HINT" "Geben Sie eine PIN ein, mit der erweiterte Funktionen im BootManager gesperrt werden sollen."
SET "BM.TXT_PIN_CONF" "Bestätigen Sie Ihre gewählte PIN"
SET "BM.TXT_PIN_CONF_HINT" "Bestätigen Sie Ihre PIN, die zum Sperren erweiterter Funktionen im BootManager verwendet werden soll"
SET "BM.TXT_PIN_UNLOCK" "Geben Sie Ihre PIN ein, um alle Menüs zu entsperren."
SET "BM.TXT_PIN_UNLOCK_HINT" "Um alle Funktionen zu entsperren, geben Sie bitte Ihre PIN ein. Dies wird entsperrt, bis eine neue PIN eingerichtet wird."
SET "BM.TXT_INCORRECT_PIN" "PIN ist falsch. Versuchen Sie es erneut oder setzen Sie es zurück, indem Sie BM über eine CD neu installieren"
SET "BM.TXT_PIN_SET" "BootManager-Menüs gesperrt!"
SET "BM.TXT_UNLOCKED" "BootManager-Menüs entsperrt!"
SET "BM.TXT_LOCKOUT_WARNING" "Erweiterte Funktionen gesperrt."

#Messages
SET "BM.TXT_SAVE_CONF_FAIL" "Speichern der Konfigurationseinstellungen fehlgeschlagen!"
SET "BM.TXT_SAVE_THM_FAIL" "Speichern der Theme Konfigurationseinstellungen fehlgeschlagen!"
SET "BM.TXT_DEL_FW_FAIL" "L�schen der Firmware fehlgeschlagen!"
SET "BM.TXT_CREATE_FAIL" "Fehler beim Erstellen von"
SET "BM.TXT_COPY_FAIL" "Fehler beim Kopieren von"
SET "BM.TXT_COPY_DEF_THM_FAIL" "Fehler beim Kopieren des standard Themes!"
SET "BM.TXT_INST_FAIL" "Fehler bei der Installation von"
SET "BM.TXT_REM_FAIL" "Fehler beim Entfernen von"
SET "BM.TXT_NO_CC" "Nicht unterst�tzter CrystalChip"
SET "BM.TXT_PROGFW_FAIL" "Programmieren der Firmware fehlgeschlagen!"
SET "BM.TXT_PROGFW_DONE" "Firmware erfolgreich aktualisiert!"

EXIT "0"
