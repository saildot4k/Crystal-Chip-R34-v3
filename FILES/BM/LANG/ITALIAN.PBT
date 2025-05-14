# Italian translation of Crystal Chips BootManager menu for BMMENUS.PBT v1.4
# Only intended to use with the R34 modified v3+ release by R3Z3N.

# Check the menu script version to be sure this script supports it.
IF NEQ "$BM.MENU_MAJOR_VER$" "1"
    ECHO "Versione del menu non supportata v$BM.MENU_MAJOR_VER$.$BM.MENU_MINOR_VER$!"
    EXIT 0
ELSEIF NEQ "$BM.MENU_MINOR_VER$" "4"
    ECHO "Versione del menu non supportata v$BM.MENU_MAJOR_VER$.$BM.MENU_MINOR_VER$!"
    EXIT 0
ENDIF

SET "TITLE" "Italiano"
SET "DESC" "File in lingua italiana."

# Do not change these 2 lines!
GOTO "$ARG1$"
RETURN -1

:LABEL_NAME
    ADDWIDGET "LABEL" "$ARG2$$TITLE$"
    EXIT 0

:QUERY
    ADDWIDGET "CALL" "$TITLE$" "$DESC$" $ARG2$ "$ARG0$" "$ARG3$" "$ARG4$" "$ARG5$"
    EXIT 0

:INSTALL
    COPY "$PWD$/ITALIAN.PBT" "$BM.BM_PATH$/LANG/ITALIAN.PBT"
    EXIT 0

:REMOVE
    RRM "$ARG0$"
    EXIT 0

:LOAD
ECHO "Caricamento del testo italiano..."

# Varie
SET "BM.TXT_YES" "Sì"
SET "BM.TXT_NO" "No"
SET "BM.TXT_ON" "ON"
SET "BM.TXT_AUTO" "AUTO"
SET "BM.TXT_OFF" "OFF"
SET "BM.TXT_BOOT" "BOOT"
SET "BM.TXT_APP" "APP"
SET "BM.TXT_STANDARD" "STANDARD"
SET "BM.TXT_FAST" "VELOCE"
SET "BM.TXT_SMOOTH" "SMOOTH"
SET "BM.TXT_AUTHOR" "Autore/i"
SET "BM.TXT_VERSION" "Versione"
SET "BM.TXT_DESC" "Descrizione"
SET "BM.TXT_DELAY" "Ritardo(sec)"
SET "BM.TXT_CONFIRM" "Sei sicuro?"
SET "BM.TXT_BACK" "Torna in alto"
SET "BM.TXT_HINT_BACK" "Torna in alto nel menu."
SET "BM.TXT_CHOOSE_DEST" "Scegli destinazione"
SET "BM.TXT_MAIN" "Torna al menu principale"
SET "BM.TXT_CURRENT" "Corrente"
SET "BM.TXT_CONFIRM_CHOICE" "Conferma scelta"
SET "BM.TXT_HINT_CANCEL_CHOICE" "Annulla e torna al menu precedente."
SET "BM.TXT_HINT_CONFIRM_CHOICE" "Conferma scelta."

#Media
SET "BM.TXT_PS1" "PS1"
SET "BM.TXT_PS2" "PS2"
SET "BM.TXT_DVDV" "DVD Video"
SET "BM.TXT_CDDA" "CD Audio"
SET "BM.TXT_OTHER" "Altro"
SET "BM.TXT_NODISC" "Nessun disco"

SET "BM.TXT_LANGUAGE" "Lingua"
SET "BM.TXT_HINT_BM_LANG" "Imposta la lingua utilizzata da BootManager."
SET "BM.TXT_INSTALL_LANG" "Installa lingua"
SET "BM.TXT_HINT_INSTALL_LANG" "Installa file di lingua aggiuntivi."
SET "BM.TXT_REMOVE_LANG" "Rimuovi lingua"
SET "BM.TXT_HINT_REMOVE_LANG" "Rimuovi file di lingua installati."
SET "BM.TXT_CHOOSE_LANG" "Scegli lingua"
SET "BM.TXT_SOURCE_DEV" "Scegli dispositivo sorgente"
SET "BM.TXT_LANG_INST_AVAIL" "Lingue disponibili"
SET "BM.TXT_LANG_REMOVE_AVAIL" "Lingue installate"

# Menu principale
SET "BM.TXT_MAIN_MENU" "Menu principale"

# Installa BootManager
SET "BM.TXT_INST_BM" "Installa BootManager"
SET "BM.TXT_HINT_INST_BM" "Installa BootManager."
SET "BM.TXT_CHOOSE_INST_BM" "Scegli opzione di installazione"
SET "BM.TXT_FULL" "Completo"
SET "BM.TXT_HINT_FULL" "Installa BootManager con tutti i driver di dispositivo."
SET "BM.TXT_MINIMAL" "Minimo"
SET "BM.TXT_HINT_MINIMAL" "Installa BootManager senza driver di dispositivo aggiuntivi per USB, HDD e rete."
SET "BM.TXT_INSTALL_BM_TO" "Installa BootManager su..."

# Firmware Manager
SET "BM.TXT_UPG_FIRMWARE" "Aggiorna firmware"
SET "BM.TXT_HINT_UPG_FIRMWARE" "Aggiorna il firmware CC da questo disco."

SET "BM.TXT_FORMAT_DFFS" "Formatta DFFS"
SET "BM.TXT_HINT_FORMAT_DFFS" "Formatta flash Crystal Chip."
SET "BM.TXT_DFFS_REM_BM" "Rimuovi dffs:/BM"
SET "BM.TXT_HINT_DFFS_REM_BM" "Rimuovi la directory BootManager dal flash Crystal Chip."
SET "BM.TXT_FW_MANAGER" "Firmware Manager"
SET "BM.TXT_HINT_FW_MANAGER" "Firmware Manager ti consente di aggiornare e cancellare il firmware del tuo Crystal Chip."
SET "BM.TXT_UPG_FW" "Aggiorna firmware"
SET "BM.TXT_HINT_UPG_FW" "Aggiorna il firmware del tuo CrystalChip dal file CCI."
SET "BM.TXT_ERASE_FW" "Cancella firmware"
SET "BM.TXT_HINT_ERASE_FW" "Cancella completamente il contenuto della tua flash/EEPROM del CrystalChip."
SET "BM.TXT_ASK_ERASE_FW" "Sei sicuro di voler cancellare il firmware?"

SET "BM.TXT_FW_TITLE" "Varianti del firmware:"
SET "BM.TXT_FW_QUESTION" "Da quale interfaccia esegui Boot Manager?"
SET "BM.TXT_FW_MC0" "1- BM viene eseguito dalla Memory Card 1"
SET "BM.TXT_FW_MC0_HINT" "Installa CC FW ed esegue BM su MemCard1"
SET "BM.TXT_FW_MC1" "2- BM viene eseguito dalla Memory Card 2"
SET "BM.TXT_FW_MC1_HINT" "Installa CC FW ed esegue BM su MemCard1"
SET "BM.TXT_FW_USB" "3- BM viene eseguito da USB"
SET "BM.TXT_FW_USB_HINT" "Installa CC FW ed esegue BM su USB. IMPORTANTE: i driver USB DEVONO essere installati su MemCard1 tramite Gestione dispositivi"
SET "BM.TXT_FW_HDD" "4- BM viene eseguito da HDD"
SET "BM.TXT_FW_HDD_HINT" "Installa CC FW ed esegue BM su HDD. IMPORTANTE: i driver HDD DEVE essere installato su MemCard1 tramite Gestione dispositivi"

# Ricarica menu
SET "BM.TXT_RELOAD_MENU" "Ricarica menu"
SET "BM.TXT_HINT_RELOAD_MENU" "Ricarica il file BMMENUS.PBT."

# Menu di avvio
SET "BM.TXT_BOOT_MEDIA" "Supporto di avvio"
SET "BM.TXT_HINT_BOOT_MENU" "Avvia giochi e applicazioni dal disco."

# Browser applicazioni
SET "BM.TXT_APP_BROWSER" "Browser applicazioni"
SET "BM.TXT_HINT_APP_BROWSER" "Esegui applicazioni homebrew da scheda di memoria, CD/DVD, USB, HDD, ecc."
SET "BM.TXT_APP" "Applicazione(i)"
SET "BM.TXT_APPS" "Applicazioni"
SET "BM.TXT_DEV" "Dispositivo(i)"
SET "BM.TXT_DEVS" "Dispositivi"
SET "BM.TXT_THM" "Tema(i)"
SET "BM.TXT_THMS" "Temi"
SET "BM.TXT_MENU_INSTALL" "Installa"
SET "BM.TXT_INSTALL_AVAIL" "Disponibile su"
SET "BM.TXT_MENU_REMOVE" "Rimuovi"
SET "BM.TXT_REMOVE_AVAIL" "Installato su"

# Esegui browser applicazioni
SET "BM.TXT_MENU_RUN" "Esegui"
SET "BM.TXT_HINT_RUN_APP" "Esegui un'applicazione da un dispositivo."
SET "BM.TXT_RUN_APP_FROM" "Esegui applicazione da"
SET "BM.TXT_RUN_AVAIL" "Eseguibile su"

# Installa browser applicazione
SET "BM.TXT_HINT_INSTALL_APP" "Installa un'applicazione da un dispositivo a un altro."
SET "BM.TXT_INSTALL_APP_FROM" "Installa applicazione/i da"
SET "BM.TXT_INSTALL_APP_TO" "Installa applicazione su"
SET "BM.TXT_NO_INSTALL" "Impossibile installare sullo stesso dispositivo!"
SET "BM.TXT_NO_INSTALL_CDROM" "Impossibile installare su CD/DVD!"

# Rimuovi browser applicazione
SET "BM.TXT_HINT_REMOVE_APP" "Rimuovi un'applicazione da un dispositivo."
SET "BM.TXT_REMOVE_APP_FROM" "Rimuovi applicazione/i da"

# Dev Manager
SET "BM.TXT_DEV_MANAGER" "Gestione dispositivi"
SET "BM.TXT_HINT_DEV_MANAGER" "Installa e rimuovi driver dispositivo."

# Install Device
SET "BM.TXT_HINT_INSTALL_DEV" "Installa i driver per i dispositivi."
SET "BM.TXT_INSTALL_DEV_FROM" "Installa dispositivo/i da"
SET "BM.TXT_INSTALL_DEV_TO" "Installa dispositivo su"

# Remove Device
SET "BM.TXT_HINT_REMOVE_DEV" "Rimuovi i driver per i dispositivi."
SET "BM.TXT_REMOVE_DEV_FROM" "Rimuovi driver dispositivo da"

# Dispositivi
SET "BM.TXT_MC_DESC" "Slot scheda di memoria"
SET "BM.TXT_MMCE_DESC" "Slot per emulatore di schede di memoria multiuso"
SET "BM.TXT_MMCE_DESC_1" "Driver MMCE"
SET "BM.TXT_CCFLASH_DESC" "Crystal Chip FlashDrive"
SET "BM.TXT_CDVD_DESC" "Unità disco CD/DVD"
SET "BM.TXT_HOST_DESC" "PC Host tramite PS2Client"
SET "BM.TXT_HOST_DESC_1" "Driver host PC"
SET "BM.TXT_USB_DESC" "Unità USB"
SET "BM.TXT_USB_DESC_1" "Driver USB"
SET "BM.TXT_HDD_DESC" "Disco rigido PS2"
SET "BM.TXT_HDD_DESC_1" "Driver HDD PS2"
SET "BM.TXT_FTP_DESC" "Driver FTP"
SET "BM.TXT_NET" "Rete"
SET "BM.TXT_NET_DESC" "Driver di rete PS2"

# Memory Card Manager
SET "BM.TXT_MC_MANAGER" "Memory Card Manager"
SET "BM.TXT_HINT_MC_MANAGER" "Formatta Memory Card, Rimuovi BootManager, ecc."

SET "BM.TXT_MC_REM_ALL_APPS" "Rimuovi tutte le applicazioni"
SET "BM.TXT_HINT_MC_REM_ALL_APPS" "Rimuovi tutte le applicazioni dalla Memory Card nello slot 1."
SET "BM.TXT_MC_REM_BOOT" "Rimuovi mc0:/BOOT"
SET "BM.TXT_HINT_MC_REM_BOOT" "Rimuovi la directory BootManager 1.x dalla Memory Card nello slot 1."
SET "BM.TXT_MC_REM_BM" "Rimuovi mc0:/BM"
SET "BM.TXT_HINT_MC_REM_BM" "Rimuovi la directory BootManager 2.x dalla Memory Card nello slot 1."
SET "BM.TXT_MC0_COPY_HOST" "Copia mc0:/* su HOST"
SET "BM.TXT_HINT_MC0_COPY_HOST" "Copia l'intero contenuto dalla Memory Card nello slot 1 all'host."
SET "BM.TXT_MC1_COPY_HOST" "Copia mc1:/* su HOST"
SET "BM.TXT_HINT_MC1_COPY_HOST" "Copia l'intero contenuto dalla Memory Card nello slot 2 all'host."
SET "BM.TXT_MC0_ERASE" "Cancella mc0:/*"
SET "BM.TXT_HINT_MC0_ERASE" "Elimina tutto il contenuto della Memory Card nello slot 1."
SET "BM.TXT_MC1_ERASE" "Cancella mc1:/*"
SET "BM.TXT_HINT_MC1_ERASE" "Elimina tutto il contenuto della Memory Card nello slot 2."

# Informazioni di sistema
SET "BM.TXT_SYS_INFO" "Informazioni di sistema"
SET "BM.TXT_HINT_SYS_INFO" "Visualizza informazioni sull'hardware del sistema."
SET "BM.TXT_CONSOLE_BIOS" "BOOTROM della console"
SET "BM.TXT_CONSOLE_VERSION" "Versione della console"
SET "BM.TXT_CONSOLE_REGION" "Informazioni sulla regione"
SET "BM.TXT_CONSOLE_MODEL" "Modello della console"

# Menu di configurazione
SET "BM.TXT_CONFIGURATION" "Configurazione"
SET "BM.TXT_HINT_CONFIGURATION" "Modifica le impostazioni di BootManager e CrystalChip."
SET "BM.TXT_INTERF_CONFIG" "Configurazione dell'interfaccia"
SET "BM.TXT_SOFTWARE_CONFIG" "Configurazione del software"

# Configurazione di BootManager
SET "BM.TXT_BM_CONFIG" "Configurazione di BootManager"
SET "BM.TXT_HINT_BM_CONFIG" "Modifica le impostazioni per BootManager."

SET "BM.TXT_BM_VIDEO_MODE" "Modalità video BM"
SET "BM.TXT_HINT_BM_VIDEO_MODE" "!! ATTENZIONE !! Questo cambierà la modalità video utilizzata da BootManager!"

SET "BM.TXT_BM_SCREEN_POS" "Posizione schermo BM"
SET "BM.TXT_HINT_BM_SCREEN_POS" "Regola la posizione dello schermo BootManager."

SET "BM.TXT_HINT_SCROLLBAR" "Barra di scorrimento suggerimenti"
SET "BM.TXT_HINT_HINT_SCROLLBAR" "Attiva e disattiva la barra di scorrimento suggerimenti nella parte inferiore dello schermo."

SET "BM.TXT_SCROLLBAR_SPEED" "Velocità barra di scorrimento suggerimenti"
SET "BM.TXT_HINT_SCROLLBAR_SPEED" "Imposta la velocità della barra di scorrimento suggerimenti."

# Menu di configurazione di rete
SET "BM.TXT_NET_CONFIG" "Configurazione di rete"
SET "BM.TXT_HINT_NET_CONFIG" "Modifica le impostazioni di rete PS2."

SET "BM.TXT_START_NET" "Avvia rete"
SET "BM.TXT_HINT_START_NET" "Avvia la rete PS2."
SET "BM.TXT_START_HOST" "Avvia server host PC"
SET "BM.TXT_HINT_START_HOST" "Avvia il server host PC PS2."
SET "BM.TXT_START_FTP" "Avvia server FTP"
SET "BM.TXT_HINT_START_FTP" "Avvia il server FTP PS2."

SET "BM.TXT_AUTOSTART_NET" "Avvia rete automatica"
SET "BM.TXT_HINT_AUTOSTART_NET" "Avvia automaticamente la rete all'avvio di BM."
SET "BM.TXT_AUTOSTART_HOST" "Avvia automaticamente server host PC"
SET "BM.TXT_HINT_AUTOSTART_HOST" "Avvia automaticamente il server host PC all'avvio di BM."
SET "BM.TXT_AUTOSTART_FTP" "Avvio automatico del server FTP"
SET "BM.TXT_HINT_AUTOSTART_FTP" "Avvia automaticamente il server FTP all'avvio di BM."

SET "BM.TXT_PS2_IP" "IP PS2"
SET "BM.TXT_HINT_PS2_IP" "Questo è l'indirizzo IP del PS2."
SET "BM.TXT_SUBNET_MASK" "Subnet Mask"
SET "BM.TXT_HINT_SUBNET_MASK" "Questa è la Subnet Mask della rete, in genere 255.255.255.0."
SET "BM.TXT_DEF_GATEWAY" "Gateway predefinito"
SET "BM.TXT_HINT_DEF_GATEWAY" "Questo è l'indirizzo IP del gateway predefinito della rete."

SET "BM.TXT_PRIMARY_DNS" "Server DNS primario"
SET "BM.TXT_HINT_PRIMARY_DNS" "Questo è l'indirizzo IP del server DNS primario."
SET "BM.TXT_SECONDARY_DNS" "Server DNS secondario"
SET "BM.TXT_HINT_SECONDARY_DNS" "Questo è l'indirizzo IP del server DNS secondario."

# Menu di configurazione HDD
SET "BM.TXT_HDD_CONFIG" "HDD"
SET "BM.TXT_HINT_HDD_CONFIG" "Cambia le impostazioni HDD della tua PS2."

SET "BM.TXT_START_HDD" "Avvia HDD"
SET "BM.TXT_HINT_START_HDD" "Carica i driver HDD e monta HDD."

SET "BM.TXT_AUTOSTART_HDD" "Avvia automaticamente HDD"
SET "BM.TXT_HINT_AUTOSTART_HDD" "Carica automaticamente i driver HDD e monta HDD all'avvio di BM."

# Configurazione di caricamento automatico
SET "BM.TXT_AUTOLOAD_CONFIG" "Caricamento automatico"
SET "BM.TXT_HINT_AUTOLOAD_CONFIG" "Imposta il caricamento automatico di vari tipi di software."

SET "BM.TXT_AUTOLOAD" "Caricamento automatico"
SET "BM.TXT_HINT_AUTOLOAD" "Attiva e disattiva il caricamento automatico."

SET "BM.TXT_ACTION" "Azione"

SET "BM.TXT_AUTOLOAD_PS1" "Caricamento automatico PS1"
SET "BM.TXT_HINT_AL_ACT_PS1" "Questa è l'azione che verrà intrapresa quando viene caricato un disco PS1."
SET "BM.TXT_AL_PS1_APP_FROM" "Scegli l'app di caricamento automatico PS1 da"
SET "BM.TXT_AL_PS1_AVAIL" "Disponibile per il caricamento automatico PS1 su"

SET "BM.TXT_AUTOLOAD_PS2" "Caricamento automatico PS2"
SET "BM.TXT_HINT_AL_ACT_PS2" "Questa è l'azione che verrà intrapresa quando viene caricato un disco PS2."
SET "BM.TXT_AL_PS2_APP_FROM" "Scegli l'app di caricamento automatico PS2 da"
SET "BM.TXT_AL_PS2_AVAIL" "Disponibile per il caricamento automatico PS2 su"

SET "BM.TXT_AUTOLOAD_DVDV" "Caricamento automatico DVD Video"
SET "BM.TXT_HINT_AL_ACT_DVDV" "Questa è l'azione che verrà intrapresa quando viene caricato un disco DVD Video."
SET "BM.TXT_AL_DVDV_APP_FROM" "Scegli l'app di caricamento automatico DVD Video da"
SET "BM.TXT_AL_DVDV_AVAIL" "Disponibile per il caricamento automatico DVD Video su"

SET "BM.TXT_AUTOLOAD_CDDA" "Caricamento automatico CD Audio"
SET "BM.TXT_HINT_AL_ACT_CDDA" "Questa è l'azione che verrà intrapresa quando viene caricato un disco CD Audio."
SET "BM.TXT_AL_CDDA_APP_FROM" "Scegli l'app di caricamento automatico CD Audio da"
SET "BM.TXT_AL_CDDA_AVAIL" "Disponibile per il caricamento automatico CD Audio su"

SET "BM.TXT_AUTOLOAD_OTHER" "Caricamento automatico altro"
SET "BM.TXT_HINT_AL_ACT_OTHER" "Questa è l'azione che verrà intrapresa quando viene caricato un 'altro' tipo di disco."
SET "BM.TXT_AL_OTHER_APP_FROM" "Scegli l'app di caricamento automatico altro disco da"
SET "BM.TXT_AL_OTHER_AVAIL" "Disponibile per il caricamento automatico altro disco su"

SET "BM.TXT_AUTOLOAD_NODISC" "Caricamento automatico nessun disco"
SET "BM.TXT_HINT_AL_ACT_NODISC" "Questa è l'azione che verrà intrapresa quando non è inserito alcun disco."
SET "BM.TXT_AL_NODISC_APP_FROM" "Scegli app di caricamento automatico senza disco da"
SET "BM.TXT_AL_NODISC_AVAIL" "Disponibile per caricamento automatico senza disco su"

SET "BM.TXT_SET_AL_APP" "Imposta applicazione di caricamento automatico"
SET "BM.TXT_HINT_SET_AL_APP" "Scegli l'applicazione che verrà eseguita al caricamento automatico di questo disco."

SET "BM.TXT_AL_DELAY" "Ritardo caricamento automatico (sec)"
SET "BM.TXT_HINT_AL_DELAY" "Imposta il ritardo di inattività, in secondi, prima che BM si carichi automaticamente."

# Menu di configurazione PS1
SET "BM.TXT_PS1_CONFIG" "PS1"
SET "BM.TXT_HINT_PS1_CONFIG" "Modifica le impostazioni per i giochi e il software PS1."

SET "BM.TXT_DISC_SPEED" "Velocità disco"
SET "BM.TXT_HINT_DISC_SPEED" "Questa opzione consente di velocizzare l'accesso al disco per il software PS1. Si prega di notare che questa opzione potrebbe non essere compatibile con tutti i software PS1."

SET "BM.TXT_TEX_MAPPING" "Texture Mapping"
SET "BM.TXT_HINT_TEX_MAPPING" "Questa opzione consente di levigare le texture nel software PS1. Si prega di notare che questa opzione potrebbe non essere compatibile con tutti i software PS1."

# Comune per PS1 e PS2
SET "BM.TXT_NTSC_SW_VID_FIXES" "Correzioni video software NTSC"
SET "BM.TXT_HINT_NTSC_SW_VID_FIXES" "Attiva o disattiva le correzioni video software NTSC."

SET "BM.TXT_PAL_SW_VID_FIXES" "Correzioni video software PAL"
SET "BM.TXT_HINT_PAL_SW_VID_FIXES" "Attiva o disattiva le correzioni video software PAL."

SET "BM.TXT_FORCE_VSYNC" "Forza sincronizzazione verticale"
SET "BM.TXT_HINT_FORCE_VSYNC" "Forza la sincronizzazione verticale per il tuo software."

SET "BM.TXT_FORCE_COLOR" "Forza colore"
SET "BM.TXT_HINT_FORCE_COLOR" "Forza il colore per il tuo software."

SET "BM.TXT_SCREEN_MODS" "Modificatori posizione schermo"
SET "BM.TXT_HINT_SCREEN_MODS" "Questa impostazione consente di attivare o disattivare la modifica della posizione dello schermo."

SET "BM.TXT_SCREEN_MOD" "Modificatore X/Y schermo"
SET "BM.TXT_HINT_SCREEN_MOD" "Questo modificatore viene utilizzato per compensare la posizione video X (orizzontale) e Y (verticale) del software."

# Menu di configurazione PS2
SET "BM.TXT_PS2_CONFIG" "PS2"
SET "BM.TXT_HINT_PS2_CONFIG" "Modifica le impostazioni per i giochi e il software PS2."

SET "BM.TXT_MEGAMEM_PATCHER" "Patcher MegaMemory"
SET "BM.TXT_HINT_MEGAMEM_PATCHER" "Attiva/disattiva il patcher per abilitare le vecchie schede MegaMemory/MAX Memory."

SET "BM.TXT_ATAD_PATCHER" "ATAD(HDD) Patcher"
SET "BM.TXT_HINT_ATAD_PATCHER" "Attiva/disattiva patcher per ATAD per sbloccare HDD non Sony con giochi PS2 abilitati per HDD."

SET "BM.TXT_DVDDL_PATCHER" "DVD+R Dual Layer Patcher"
SET "BM.TXT_HINT_DVDDL_PATCHER" "Attiva/disattiva patcher per dischi DVD+R Dual Layer."

# Menu di configurazione DVD
SET "BM.TXT_DVD_CONFIG" "Video DVD"
SET "BM.TXT_HINT_DVD_CONFIG" "Modifica le impostazioni per i video DVD."

SET "BM.TXT_DVD_VIDEO_FIXES" "Correzioni video DVD"
SET "BM.TXT_HINT_DVD_VIDEO_FIXES" "Attiva e disattiva le correzioni video DVD."

SET "BM.TXT_REGION_FREE" "Regione libera"
SET "BM.TXT_HINT_REGION_FREE" "Questa funzione ti consente di guardare i video DVD importati sulla tua PS2."

SET "BM.TXT_DVD_PLAYER_REGION" "Regione del lettore DVD"
SET "BM.TXT_HINT_DVD_PLAYER_REGION" "Questa funzione ti consente di impostare la regione del lettore DVD per i film protetti da RCE. Normalmente, dovresti lasciare questo set su 1."

SET "BM.TXT_RGB_FIX" "Correzione RGB"
SET "BM.TXT_HINT_RGB_FIX" "Questa funzione consente di risolvere il problema "Green Screen" quando si guardano video DVD."

SET "BM.TXT_VIDEO_STAB" "Stabilizzatore video"
SET "BM.TXT_HINT_VIDEO_STAB" "Questo consente di disattivare l'output Macrovision, migliorando la qualità video in alcuni casi."

SET "BM.TXT_HINT_FORCE_COLOR_DVD" "Questa funzione consente di forzare il colore dei video DVD."

# Menu di avvio del disco
SET "BM.TXT_BOOT_MENU" "Menu di avvio del disco"
SET "BM.TXT_BOOT_ENHANCED" "Avvio in modalità avanzata"
SET "BM.TXT_HINT_BOOT_ENHANCED" "Avvia il disco con l'attuale miglioramento selezionato abilitato."
SET "BM.TXT_BOOT_MINIMAL" "Avvia in modalità minima"
SET "BM.TXT_HINT_BOOT_MINIMAL" "Avvia il disco con i miglioramenti minimi abilitati."
SET "BM.TXT_BOOT_SLEEP" "Avvia in modalità sospensione"
SET "BM.TXT_HINT_BOOT_SLEEP" "Avvia il disco con tutti i miglioramenti e Crystal Chip disabilitati."

# Theme Manager
SET "BM.TXT_THEME_MANAGER" "Tema"
SET "BM.TXT_HINT_THEME_MANAGER" "Configura, modifica, installa e rimuovi i tuoi temi BootManager."
SET "BM.TXT_SELECTED_THEME" "Tema selezionato"
SET "BM.TXT_MANAGE_THEME" "Gestisci temi"

# Theme Configuration
SET "BM.TXT_THEMES" "Temi"
SET "BM.TXT_THEME_CONFIG" "Tema"
SET "BM.TXT_HINT_THEME_CONFIG" "Configura il tema del menu BootManager."

SET "BM.TXT_XY" "Posizione X/Y"
SET "BM.TXT_WH" "Larghezza/Altezza"

SET "BM.TXT_THEME_MENU_IMG" "Immagine menu"
SET "BM.TXT_HINT_THEME_MENU_IMG_XY" "Regola la posizione dello schermo X/Y per l'immagine del menu."
SET "BM.TXT_HINT_THEME_MENU_IMG_WH" "Regola la larghezza/altezza dell'immagine del menu."

SET "BM.TXT_THEME_DISC_IMG" "Immagine disco"
SET "BM.TXT_HINT_DISC_IMG_XY" "Regola la posizione dello schermo X/Y per l'immagine dell'icona del disco."
SET "BM.TXT_HINT_DISC_IMG_WH" "Regola la larghezza/altezza dell'immagine dell'icona del disco."

SET "BM.TXT_THEME_MENU_TEXT" "Menu"
SET "BM.TXT_HINT_THEME_MENU_XY" "Regola la posizione dello schermo X/Y per il menu."
SET "BM.TXT_HINT_THEME_MENU_WH" "Regola la larghezza/altezza del menu."

SET "BM.TXT_THEME_MENU_TITLE" "Titolo del menu"
SET "BM.TXT_HINT_THEME_MENU_TITLE_XY" "Regola la posizione dello schermo X/Y per il titolo del menu."
SET "BM.TXT_HINT_THEME_MENU_TITLE_WH" "Regola la larghezza/altezza del titolo del menu."

SET "BM.TXT_BM_VERSION" "Etichetta versione BM"
SET "BM.TXT_HINT_BM_VERSION" "Regola la posizione dello schermo X/Y per il testo della versione BM."

SET "BM.TXT_THEME_SCROLLER" "Barra di scorrimento suggerimenti"
SET "BM.TXT_HINT_THEME_SCROLLER_XY" "Regola la posizione X/Y dello schermo per la barra di scorrimento del menu."
SET "BM.TXT_HINT_THEME_SCROLLER_WH" "Regola la larghezza/altezza della barra di scorrimento del menu."

SET "BM.TXT_THEME_COLOR" "Colori tema"
SET "BM.TXT_THEME_BG_COLOR" "Colore sfondo"
SET "BM.TXT_HINT_THEME_BG_COLOR" "Scegli il colore di sfondo."
SET "BM.TXT_THEME_FONT_COLOR" "Colore carattere"
SET "BM.TXT_HINT_THEME_FONT_COLOR" "Scegli il colore carattere del menu."
SET "BM.TXT_THEME_FONT_COLOR_LABEL" "Colore titolo carattere"
SET "BM.TXT_HINT_THEME_FONT_COLOR_LABEL" "Scegli il colore del titolo e dell'etichetta del carattere."
SET "BM.TXT_THEME_FONT_COLOR_SCROLLER" "Colore scorrimento"
SET "BM.TXT_HINT_THEME_FONT_COLOR_SCROLLER" "Scegli il colore dello scorrimento dei suggerimenti."

# Cambia tema
SET "BM.TXT_MENU_CHANGE" "Cambia"
SET "BM.TXT_HINT_THEME_CHANGE" "Seleziona un nuovo tema e cambia l'aspetto di BootManager."
SET "BM.TXT_CHANGE_THM_FROM" "Seleziona tema da"
SET "BM.TXT_CHANGE_AVAIL" "Temi disponibili su"

# Installa temi
SET "BM.TXT_HINT_THEME_INSTALL" "Installa un tema da un dispositivo a un altro."
SET "BM.TXT_INSTALL_THM_FROM" "Installa tema/i da"
SET "BM.TXT_INSTALL_THM_TO" "Installa tema su"

# Rimuovi temi
SET "BM.TXT_HINT_THEME_REMOVE" "Rimuovi un tema da un dispositivo."
SET "BM.TXT_REMOVE_THM_FROM" "Rimuovi temi da"

# Test disco
SET "BM.TXT_PS1_TEST_INFO" "Il test disco ora testerà l'autenticazione PS1 (ovvero SCEx) del Crystal Chip."
SET "BM.TXT_START_PS1_TEST" "Avvia test disco PS1"

SET "BM.TXT_DISC_TEST" "Test disco"
SET "BM.TXT_HINT_DISC_TEST" "Il test disco consente di verificare l'installazione del Crystal Chip testando l'autenticazione PS1 (ovvero SCEx)."

SET "BM.TXT_PS1_WORK" "L'autenticazione disco PS1 funziona!"
SET "BM.TXT_PS1_FAIL" "L'autenticazione disco PS1 non è riuscita!"

SET "BM.TXT_CHECK_SX" "Controlla il cavo CrystalChip SX."

# Misc Config
SET "BM.TXT_MISC_CONFIG" "Varie"
SET "BM.TXT_HINT_MISC_CONFIG" "Opzioni di configurazione varie che non rientrano in nessun'altra categoria."

SET "BM.TXT_GS_HOOK" "GS Hook"
SET "BM.TXT_HINT_GS_HOOK" "CrystalChip GS Hook viene utilizzato per eseguire correzioni video avanzate per il software PS2, ma potrebbe essere incompatibile con alcuni giochi."

SET "BM.TXT_IGR" "In-Game Reset"
SET "BM.TXT_HINT_IGR" "In-Game Reset (IGR) consente di ripristinare la PS2 tenendo premuti L1+L2+R1+R2+Start+Select all'interno di un gioco PS2."

# Video Wizard
SET "BM.TXT_VID_WIZ" "Video Wizard"
SET "BM.TXT_VID_WIZ_1" "Questa procedura guidata ti aiuterà a determinare quali modalità video supporta la tua TV."
SET "BM.TXT_VID_WIZ_2" "Una volta completata la procedura guidata, selezionerà automaticamente le migliori opzioni di configurazione video per la tua TV."
SET "BM.TXT_VID_WIZ_3" "Ogni passaggio testerà una modalità video diversa e ti chiederà di selezionare un'opzione in base a ciò che vedi sullo schermo."
SET "BM.TXT_VID_WIZ_4" "Se non riesci a vedere ciò che è sullo schermo dopo 10 secondi, premi X una volta e attendi 10 secondi per la schermata successiva."
SET "BM.TXT_VID_WIZ_START" "Inizia il test"
SET "BM.TXT_HINT_VID_WIZ_START" "Avvia il test della modalità video di Video Wizard."

#Test video
SET "BM.TXT_TEST_50HZ" "Test 50Hz"
SET "BM.TXT_TEST_PAL" "Test colore PAL"
SET "BM.TXT_TEST_60HZ" "Test 60Hz"
SET "BM.TXT_TEST_NTSC" "Test colore NTSC"
SET "BM.TXT_CAN_YOU_READ" "Riesci a leggere questa schermata?"
SET "BM.TXT_YES_BUT" "Sì, ma lo schermo 'scorre'."
SET "BM.TXT_SCREEN_COLOR" "Questa schermata è a colori?"

SET "BM.TXT_TEST_RESULTS" "Risultati del test video"
SET "BM.TXT_TEST_COMPLETE" "Il test è ora completo!"
SET "BM.TXT_50HZ_YES" "La tua TV può visualizzare 50Hz."
SET "BM.TXT_50HZ_NO" "La tua TV non può visualizzare 50 Hz."
SET "BM.TXT_60HZ_YES" "La tua TV può visualizzare 60 Hz."
SET "BM.TXT_60HZ_NO" "La tua TV non può visualizzare 60 Hz."
SET "BM.TXT_PAL_YES" "La tua TV può visualizzare il colore PAL."
SET "BM.TXT_PAL_NO" "La tua TV non può visualizzare il colore PAL."
SET "BM.TXT_NTSC_YES" "La tua TV può visualizzare il colore NTSC."
SET "BM.TXT_NTSC_NO" "La tua TV non può visualizzare il colore NTSC."
SET "BM.TXT_DONE" "Fatto"
SET "BM.TXT_RETURN_CONFIG" "Torna al menu di configurazione."

#Modalità Blocco/Pin
SET "BM.TXT_CNF_LOCKOUT" "Sicurezza"
SET "BM.TXT_CNF_LOCKOUT_HINT" "Blocca le funzioni da BootManager con un PIN."
SET "BM.TXT_CNF_LOCKOUT_LABEL1" "Blocca tutte le funzioni tranne"
SET "BM.TXT_CNF_LOCKOUT_LABEL2" "dischi e app di avvio."
SET "BM.TXT_CNF_LOCKOUT_LABEL3" "Inserisci il tuo PIN per sbloccare tutte le funzioni."
SET "BM.TXT_CNF_LOCKOUT_LABEL4" "Per cancellare un PIN dimenticato, reinstalla BootManager."
SET "BM.TXT_PIN_SETUP" "Scegli un PIN"
SET "BM.TXT_PIN_SETUP_HINT" "Inserisci un PIN da utilizzare per bloccare le funzioni avanzate in BootManager."
SET "BM.TXT_PIN_CONF" "Conferma il PIN scelto"
SET "BM.TXT_PIN_CONF_HINT" "Conferma il PIN da utilizzare per bloccare le funzioni avanzate in BootManager"
SET "BM.TXT_PIN_UNLOCK" "Inserisci il PIN per sbloccare tutti i menu."
SET "BM.TXT_PIN_UNLOCK_HINT" "Per sbloccare tutte le funzioni, inserisci il PIN. Questo verrà sbloccato finché non verrà nuovamente impostato un PIN."
SET "BM.TXT_INCORRECT_PIN" "Il PIN non è corretto. Riprova o reimposta reinstallando BM tramite disco"
SET "BM.TXT_PIN_SET" "Menu BootManager bloccati!"
SET "BM.TXT_UNLOCKED" "Menu BootManager sbloccati!"
SET "BM.TXT_LOCKOUT_WARNING" "Funzioni avanzate bloccate."

#Messaggi
SET "BM.TXT_SAVE_CONF_FAIL" "Impossibile salvare le impostazioni di configurazione!"
SET "BM.TXT_SAVE_THM_FAIL" "Impossibile salvare le impostazioni di configurazione del tema!"
SET "BM.TXT_DEL_FW_FAIL" "Impossibile cancellare il firmware!"
SET "BM.TXT_CREATE_FAIL" "Impossibile creare"
SET "BM.TXT_COPY_FAIL" "Impossibile copiare"
SET "BM.TXT_COPY_DEF_THM_FAIL" "Impossibile copiare il tema predefinito!"
SET "BM.TXT_INST_FAIL" "Impossibile installare"
SET "BM.TXT_REM_FAIL" "Impossibile rimuovere"
SET "BM.TXT_NO_CC" "CrystalChip non supportato"
SET "BM.TXT_PROGFW_FAIL" "Impossibile programmare il file del firmware!"
SET "BM.TXT_PROGFW_DONE" "Firmware aggiornato correttamente!"

EXIT 0