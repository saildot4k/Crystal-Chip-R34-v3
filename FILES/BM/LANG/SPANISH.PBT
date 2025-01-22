#
# English translation of Crystal Chips BootManager menu for BMMENUS.PBT v1.4
# Only intended to use with the R34 modified v3 release by R3Z3N.
#

# Check the menu script version to be sure this script supports it.
IF NEQ "$BM.MENU_MAJOR_VER$" "1"
    ECHO "Versión de menú no compatible v$BM.MENU_MAJOR_VER$.$BM.MENU_MINOR_VER$!"
    EXIT 0
ELSEIF NEQ "$BM.MENU_MINOR_VER$" "4"
    ECHO "Versión de menú no compatible v$BM.MENU_MAJOR_VER$.$BM.MENU_MINOR_VER$!"
    EXIT 0
ENDIF

SET "TÍTULO" "Española"
SET "DESC" "Archivo en idioma español".

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
    COPY "$PWD$/SPANISH.PBT" "$BM.BM_PATH$/LANG/SPANISH.PBT"
    EXIT 0

:REMOVE
#    RRM "$ARG0$"
    EXIT 0

:LOAD
ECHO "Loading English text..."

# Miscellaneous
SET "BM.TXT_YES" "Sí"
SET "BM.TXT_NO" "No"
SET "BM.TXT_ON" "ENCENDIDO"
SET "BM.TXT_AUTO" "AUTO"
SET "BM.TXT_OFF" "APAGADO"
SET "BM.TXT_BOOT" "INICIO"
SET "BM.TXT_APP" "APLICACIÓN"
SET "BM.TXT_STANDARD" "ESTÁNDAR"
SET "BM.TXT_FAST" "RÁPIDO"
SET "BM.TXT_SMOOTH" "SUAVE"
SET "BM.TXT_AUTHOR" "Autor(es)"
SET "BM.TXT_VERSION" "Versión"
SET "BM.TXT_DESC" "Descripción"
SET "BM.TXT_DELAY" "Retraso (s)"
SET "BM.TXT_CONFIRM" "¿Está seguro?"
SET "BM.TXT_BACK" "Volver al principio"
SET "BM.TXT_HINT_BACK" "Volver al principio del menú."
SET "BM.TXT_CHOOSE_DEST" "Elegir destino"
SET "BM.TXT_MAIN" "Volver al menú principal"
SET "BM.TXT_CURRENT" "Actual"
SET "BM.TXT_CONFIRM_CHOICE" "Confirmar elección"
SET "BM.TXT_HINT_CANCEL_CHOICE" "Cancelar y volver al menú anterior."
SET "BM.TXT_HINT_CONFIRM_CHOICE" "Confirmar elección."

#Media
SET "BM.TXT_PS1" "PS1"
SET "BM.TXT_PS2" "PS2"
SET "BM.TXT_DVDV" "Video DVD"
SET "BM.TXT_CDDA" "Audio CD"
SET "BM.TXT_OTHER" "Otro"
SET "BM.TXT_NODISC" "Sin disco"

SET "BM.TXT_LANGUAGE" "Idioma"
SET "BM.TXT_HINT_BM_LANG" "SET el idioma utilizado por BootManager".
SET "BM.TXT_INSTALL_LANG" "Instalar idioma"
SET "BM.TXT_HINT_INSTALL_LANG" "Instalar archivos de idioma adicionales".
SET "BM.TXT_REMOVE_LANG" "Quitar idioma"
SET "BM.TXT_HINT_REMOVE_LANG" "Quitar archivos de idioma instalados".
SET "BM.TXT_CHOOSE_LANG" "Elegir idioma"
SET "BM.TXT_SOURCE_DEV" "Elegir dispositivo de origen"
SET "BM.TXT_LANG_INST_AVAIL" "Idiomas disponibles"
SET "BM.TXT_LANG_REMOVE_AVAIL" "Idiomas instalados"

# Main Menu
SET "BM.TXT_MAIN_MENU" "Main Menu"

# Install BootManager
SET "BM.TXT_INST_BM" "Instalar BootManager"
SET "BM.TXT_HINT_INST_BM" "Instalar BootManager."
SET "BM.TXT_CHOOSE_INST_BM" "Elegir opción de instalación"
SET "BM.TXT_FULL" "Completa"
SET "BM.TXT_HINT_FULL" "Instalar BootManager con todos los controladores de dispositivos."
SET "BM.TXT_MINIMAL" "Mínima"
SET "BM.TXT_HINT_MINIMAL" "Instalar BootManager sin controladores de dispositivos adicionales para USB, HDD y red."
SET "BM.TXT_INSTALL_BM_TO" "Instalar BootManager en..."

# Firmware Manager
SET "BM.TXT_UPG_FIRMWARE" "Actualizar firmware"
SET "BM.TXT_HINT_UPG_FIRMWARE" "Actualizar el firmware de CC desde este disco".

SET "BM.TXT_FORMAT_DFFS" "Formatear DFFS"
SET "BM.TXT_HINT_FORMAT_DFFS" "Formatear la memoria flash Crystal Chip".
SET "BM.TXT_DFFS_REM_BM" "Eliminar dffs:/BM"
SET "BM.TXT_HINT_DFFS_REM_BM" "Eliminar el directorio BootManager de la memoria flash Crystal Chip".
SET "BM.TXT_FW_MANAGER" "Administrador de firmware"
SET "BM.TXT_HINT_FW_MANAGER" "El Administrador de firmware le permite actualizar y borrar el firmware de Crystal Chip".
SET "BM.TXT_UPG_FW" "Actualizar firmware"
SET "BM.TXT_HINT_UPG_FW" "Actualizar el firmware de CrystalChip desde el archivo CCI".
SET "BM.TXT_ERASE_FW" "Borrar firmware"
SET "BM.TXT_HINT_ERASE_FW" "Borrar por completo el contenido de la memoria flash/EEPROM de CrystalChip".
SET "BM.TXT_ASK_ERASE_FW" "¿Está seguro de que desea borrar el firmware?"

SET "BM.TXT_FW_TITLE" "Variaciones de firmware:"
SET "BM.TXT_FW_QUESTION" "¿Desde qué interfaz se debe ejecutar el Administrador de arranque?"
SET "BM.TXT_FW_MC0" "1- BM se ejecuta desde la tarjeta de memoria 1"
SET "BM.TXT_FW_MC0_HINT" "Instala CC FW y ejecuta BM en MemCard1"
SET "BM.TXT_FW_MC1" "2- BM se ejecuta desde la tarjeta de memoria 2"
SET "BM.TXT_FW_MC1_HINT" "Instala CC FW y ejecuta BM en MemCard1"
SET "BM.TXT_FW_USB" "3- BM se ejecuta desde USB"
SET "BM.TXT_FW_USB_HINT" "Instala CC FW y ejecuta BM en USB. IMPORTANTE: Los controladores USB DEBEN instalarse en MemCard1 a través del Administrador de dispositivos"
SET "BM.TXT_FW_HDD" "4- BM se ejecuta desde HDD"
SET "BM.TXT_FW_HDD_HINT" "Instala CC FW y ejecuta BM en HDD. IMPORTANTE: Los controladores del HDD DEBEN instalarse en MemCard1 a través del Administrador de dispositivos.

# Reload Menu
SET "BM.TXT_RELOAD_MENU" "Recargar menú"
SET "BM.TXT_HINT_RELOAD_MENU" "Recargar el archivo BMMENUS.PBT".

# Boot Menu
SET "BM.TXT_BOOT_MEDIA" "Medio de arranque"
SET "BM.TXT_HINT_BOOT_MENU" "Arrancar juegos y aplicaciones desde el disco".

# Application Browser
SET "BM.TXT_APP_BROWSER" "Navegador de aplicaciones"
SET "BM.TXT_HINT_APP_BROWSER" "Ejecutar aplicaciones caseras desde una tarjeta de memoria, CD/DVD, USB, HDD, etc."
SET "BM.TXT_APP" "Aplicación(es)"
SET "BM.TXT_APPS" "Aplicaciones"
SET "BM.TXT_DEV" "Dispositivo(s)"
SET "BM.TXT_DEVS" "Dispositivos"
SET "BM.TXT_THM" "Tema(s)"
SET "BM.TXT_THMS" "Temas"
SET "BM.TXT_MENU_INSTALL" "Instalar"
SET "BM.TXT_INSTALL_AVAIL" "Disponible el"
SET "BM.TXT_MENU_REMOVE" "Eliminar"
SET "BM.TXT_REMOVE_AVAIL" "Instalado el"

# Run Application Browser
SET "BM.TXT_MENU_RUN" "Ejecutar"
SET "BM.TXT_HINT_RUN_APP" "Ejecutar una aplicación desde un dispositivo".
SET "BM.TXT_RUN_APP_FROM" "Ejecutar aplicación desde"
SET "BM.TXT_RUN_AVAIL" "Ejecutable en"

# Install Application Browser
SET "BM.TXT_HINT_INSTALL_APP" "Instalar una aplicación desde un dispositivo a otro".
SET "BM.TXT_INSTALL_APP_FROM" "Instalar aplicación(es) desde"
SET "BM.TXT_INSTALL_APP_TO" "Instalar aplicación en"

# Remove Application Browser
SET "BM.TXT_HINT_REMOVE_APP" "Eliminar una aplicación de un dispositivo".
SET "BM.TXT_REMOVE_APP_FROM" "Eliminar aplicaciones de"

# Dev Manager
SET "BM.TXT_DEV_MANAGER" "Administrador de dispositivos"
SET "BM.TXT_HINT_DEV_MANAGER" "Instalar y eliminar controladores de dispositivos".

# Install Device
SET "BM.TXT_HINT_INSTALL_DEV" "Instalar los controladores para los dispositivos".
SET "BM.TXT_INSTALL_DEV_FROM" "Instalar dispositivo(s) desde"
SET "BM.TXT_INSTALL_DEV_TO" "Instalar dispositivo en"

# Remove Device
SET "BM.TXT_HINT_REMOVE_DEV" "Eliminar los controladores de los dispositivos".
SET "BM.TXT_REMOVE_DEV_FROM" "Eliminar los controladores de los dispositivos"

# Devices
SET "BM.TXT_MC_DESC" "Ranura para tarjeta de memoria"
SET "BM.TXT_CCFLASH_DESC" "Unidad Flash Crystal Chip"
SET "BM.TXT_CDVD_DESC" "Unidad de CD/DVD"
SET "BM.TXT_HOST_DESC" "Host de PC a través de PS2Client"
SET "BM.TXT_HOST_DESC_1" "Controlador de host de PC"
SET "BM.TXT_USB_DESC" "Unidad USB"
SET "BM.TXT_USB_DESC_1" "Controladores USB"
SET "BM.TXT_HDD_DESC" "Disco duro PS2"
SET "BM.TXT_HDD_DESC_1" "Controladores de disco duro PS2"
SET "BM.TXT_FTP_DESC" "Controlador FTP"
SET "BM.TXT_NET" "Red"
SET "BM.TXT_NET_DESC" "Controladores de red PS2"

# Memory Card Manager
SET "BM.TXT_MC_MANAGER" "Administrador de tarjetas de memoria"
SET "BM.TXT_HINT_MC_MANAGER" "Formatear tarjetas de memoria, eliminar BootManager, etc."

SET "BM.TXT_MC_REM_ALL_APPS" "Eliminar todas las aplicaciones"
SET "BM.TXT_HINT_MC_REM_ALL_APPS" "Eliminar todas las aplicaciones de la tarjeta de memoria en la ranura 1."
SET "BM.TXT_MC_REM_BOOT" "Eliminar mc0:/BOOT"
SET "BM.TXT_HINT_MC_REM_BOOT" "Eliminar el directorio BootManager 1.x de la tarjeta de memoria en la ranura 1."
SET "BM.TXT_MC_REM_BM" "Eliminar mc0:/BM"
SET "BM.TXT_HINT_MC_REM_BM" "Eliminar el directorio BootManager 2.x de la tarjeta de memoria en la ranura 1."
SET "BM.TXT_MC0_COPY_HOST" "Copiar mc0:/* al HOST"
SET "BM.TXT_HINT_MC0_COPY_HOST" "Copiar todo el contenido de la tarjeta de memoria en la ranura 1 al host."
SET "BM.TXT_MC1_COPY_HOST" "Copiar mc1:/* al HOST"
SET "BM.TXT_HINT_MC1_COPY_HOST" "Copiar todo el contenido de la tarjeta de memoria en la ranura 2 al host."
SET "BM.TXT_MC0_ERASE" "Borrar mc0:/*"
SET "BM.TXT_HINT_MC0_ERASE" "Eliminar todo el contenido de la tarjeta de memoria en la ranura 1."
SET "BM.TXT_MC1_ERASE" "Borrar mc1:/*"
SET "BM.TXT_HINT_MC1_ERASE" "Eliminar todo el contenido de la tarjeta de memoria en la ranura 2."

# System Information
SET "BM.TXT_SYS_INFO" "Información del sistema"
SET "BM.TXT_HINT_SYS_INFO" "Ver información sobre el hardware del sistema".
SET "BM.TXT_CONSOLE_BIOS" "ROM DE ARRANQUE DE LA CONSOLA"
SET "BM.TXT_CONSOLE_VERSION" "Versión de la consola"
SET "BM.TXT_CONSOLE_REGION" "Información de la región"
SET "BM.TXT_CONSOLE_MODEL" "Modelo de la consola"

# Configuration Menu
SET "BM.TXT_CONFIGURATION" "Configuración"
SET "BM.TXT_HINT_CONFIGURATION" "Cambiar la configuración de BootManager y CrystalChip".
SET "BM.TXT_INTERF_CONFIG" "Configuración de la interfaz"
SET "BM.TXT_SOFTWARE_CONFIG" "Configuración del software"

# BootManager Configuration
SET "BM.TXT_BM_CONFIG" "Configuración de BootManager"
SET "BM.TXT_HINT_BM_CONFIG" "Cambiar la configuración de BootManager".

SET "BM.TXT_BM_VIDEO_MODE" "Modo de video de BM"
SET "BM.TXT_HINT_BM_VIDEO_MODE" "!! ADVERTENCIA !! Esto cambiará el modo de video que utiliza BootManager!"

SET "BM.TXT_BM_SCREEN_POS" "Posición de la pantalla de BootManager"
SET "BM.TXT_HINT_BM_SCREEN_POS" "Ajusta la posición de la pantalla de BootManager."

SET "BM.TXT_HINT_SCROLLBAR" "Barra de desplazamiento de sugerencias"
SET "BM.TXT_HINT_HINT_SCROLLBAR" "Activa y desactiva la barra de desplazamiento de sugerencias en la parte inferior de la pantalla."

SET "BM.TXT_SCROLLBAR_SPEED" "Velocidad de la barra de desplazamiento de sugerencias"
SET "BM.TXT_HINT_SCROLLBAR_SPEED" "Establece la velocidad de la barra de desplazamiento de sugerencias."

# Network Configuration Menu
SET "BM.TXT_NET_CONFIG" "Configuración de red"
SET "BM.TXT_HINT_NET_CONFIG" "Cambiar la configuración de red de PS2".

SET "BM.TXT_START_NET" "Iniciar red"
SET "BM.TXT_HINT_START_NET" "Iniciar la red PS2".
SET "BM.TXT_START_HOST" "Iniciar servidor host de PC"
SET "BM.TXT_HINT_START_HOST" "Iniciar servidor host de PC PS2".
SET "BM.TXT_START_FTP" "Iniciar servidor FTP"
SET "BM.TXT_HINT_START_FTP" "Iniciar servidor FTP PS2".

SET "BM.TXT_AUTOSTART_NET" "Iniciar red automáticamente"
SET "BM.TXT_HINT_AUTOSTART_NET" "Iniciar la red automáticamente cuando se inicia BM".
SET "BM.TXT_AUTOSTART_HOST" "Iniciar automáticamente el servidor host de PC"
SET "BM.TXT_HINT_AUTOSTART_HOST" "Iniciar automáticamente el servidor host de PC cuando se inicia BM".
SET "BM.TXT_AUTOSTART_FTP" "Iniciar automáticamente el servidor FTP"
SET "BM.TXT_HINT_AUTOSTART_FTP" "Iniciar automáticamente el servidor FTP cuando se inicia BM".

SET "BM.TXT_PS2_IP" "IP de PS2"
SET "BM.TXT_HINT_PS2_IP" "Esta es la dirección IP de PS2".
SET "BM.TXT_SUBNET_MASK" "Máscara de subred"
SET "BM.TXT_HINT_SUBNET_MASK" "Esta es la máscara de subred de la red, normalmente 255.255.255.0".
SET "BM.TXT_DEF_GATEWAY" "Puerta de enlace predeterminada"
SET "BM.TXT_HINT_DEF_GATEWAY" "Esta es la dirección IP de la puerta de enlace predeterminada de la red".

SET "BM.TXT_PRIMARY_DNS" "Servidor DNS primario"
SET "BM.TXT_HINT_PRIMARY_DNS" "Esta es la dirección IP del servidor DNS primario".
SET "BM.TXT_SECONDARY_DNS" "Servidor DNS secundario"
SET "BM.TXT_HINT_SECONDARY_DNS" "Esta es la dirección IP del servidor DNS secundario".

# HDD Configuration Menu
SET "BM.TXT_HDD_CONFIG" "HDD"
SET "BM.TXT_HINT_HDD_CONFIG" "Cambiar la configuración del HDD de PS2".

SET "BM.TXT_START_HDD" "Iniciar HDD"
SET "BM.TXT_HINT_START_HDD" "Cargar controladores del HDD y montar el HDD".

SET "BM.TXT_AUTOSTART_HDD" "Iniciar HDD automáticamente"
SET "BM.TXT_HINT_AUTOSTART_HDD" "Cargar automáticamente los controladores del HDD y montar el HDD al iniciar BM".

# Autoload Configuration
SET "BM.TXT_AUTOLOAD_CONFIG" "Carga automática"
SET "BM.TXT_HINT_AUTOLOAD_CONFIG" "Configurar la carga automática de varios tipos de software".

SET "BM.TXT_AUTOLOAD" "Carga automática"
SET "BM.TXT_HINT_AUTOLOAD" "Activar y desactivar la carga automática".

SET "BM.TXT_ACTION" "Acción"

SET "BM.TXT_AUTOLOAD_PS1" "Carga automática de PS1"
SET "BM.TXT_HINT_AL_ACT_PS1" "Esta es la acción que se realizará cuando se cargue un disco PS1".
SET "BM.TXT_AL_PS1_APP_FROM" "Elegir aplicación de carga automática de PS1 de"
SET "BM.TXT_AL_PS1_AVAIL" "Disponible para carga automática de PS1 activada"

SET "BM.TXT_AUTOLOAD_PS2" "Cargar PS2 automáticamente"
SET "BM.TXT_HINT_AL_ACT_PS2" "Esta es la acción que se realizará cuando se cargue un disco de PS2".
SET "BM.TXT_AL_PS2_APP_FROM" "Elegir aplicación de carga automática de PS2 de"
SET "BM.TXT_AL_PS2_AVAIL" "Disponible para carga automática de PS2 activada"

SET "BM.TXT_AUTOLOAD_DVDV" "Cargar DVD de vídeo automáticamente"
SET "BM.TXT_HINT_AL_ACT_DVDV" "Esta es la acción que se realizará cuando se cargue un disco de vídeo DVD".
SET "BM.TXT_AL_DVDV_APP_FROM" "Elegir aplicación de carga automática de DVD Video de"
SET "BM.TXT_AL_DVDV_AVAIL" "Disponible para carga automática de DVD Video activada"

SET "BM.TXT_AUTOLOAD_CDDA" "Cargar automáticamente CD Audio"
SET "BM.TXT_HINT_AL_ACT_CDDA" "Esta es la acción que se realizará cuando se cargue un disco CD Audio".
SET "BM.TXT_AL_CDDA_APP_FROM" "Elegir aplicación de carga automática de CD Audio de"
SET "BM.TXT_AL_CDDA_AVAIL" "Disponible para carga automática de CD Audio activada"

SET "BM.TXT_AUTOLOAD_OTHER" "Cargar automáticamente otro"
SET "BM.TXT_HINT_AL_ACT_OTHER" "Esta es la acción que se realizará cuando se cargue 'otro' tipo de disco".
SET "BM.TXT_AL_OTHER_APP_FROM" "Elegir otra aplicación de carga automática de discos"
SET "BM.TXT_AL_OTHER_AVAIL" "Disponible para la carga automática de otros discos activada"

SET "BM.TXT_AUTOLOAD_NODISC" "Cargar automáticamente ningún disco"
SET "BM.TXT_HINT_AL_ACT_NODISC" "Esta es la acción que se realizará cuando no se inserte ningún disco".
SET "BM.TXT_AL_NODISC_APP_FROM" "Elegir ninguna aplicación de carga automática de discos"
SET "BM.TXT_AL_NODISC_AVAIL" "Disponible para la carga automática de discos activada"

SET "BM.TXT_SET_AL_APP" "SET aplicación de carga automática"
SET "BM.TXT_HINT_SET_AL_APP" "Elegir la aplicación que se ejecutará al cargar automáticamente este disco".

SET "BM.TXT_AL_DELAY" "Retardo de carga automática (seg.)"
SET "BM.TXT_HINT_AL_DELAY" "Establezca el retraso de inactividad, en segundos, antes de que BM se cargue automáticamente".

# PS1 Configuration Menu
SET "BM.TXT_PS1_CONFIG" "PS1"
SET "BM.TXT_HINT_PS1_CONFIG" "Cambiar la configuración de los juegos y el software de PS1."

SET "BM.TXT_DISC_SPEED" "Velocidad del disco"
SET "BM.TXT_HINT_DISC_SPEED" "Esta opción le permite acelerar el acceso al disco para el software de PS1. Tenga en cuenta que esta opción puede no ser compatible con todo el software de PS1."

SET "BM.TXT_TEX_MAPPING" "Mapeo de texturas"
SET "BM.TXT_HINT_TEX_MAPPING" "Esta opción le permite suavizar las texturas en el software de PS1. Tenga en cuenta que esta opción puede no ser compatible con todo el software de PS1."

# Common for PS1 and PS2
SET "BM.TXT_NTSC_SW_VID_FIXES" "Correcciones de video de software NTSC"
SET "BM.TXT_HINT_NTSC_SW_VID_FIXES" "Activar o desactivar correcciones de video de software NTSC".

SET "BM.TXT_PAL_SW_VID_FIXES" "Correcciones de video de software PAL"
SET "BM.TXT_HINT_PAL_SW_VID_FIXES" "Activar o desactivar correcciones de video de software PAL".

SET "BM.TXT_FORCE_VSYNC" "Forzar sincronización vertical"
SET "BM.TXT_HINT_FORCE_VSYNC" "Fuerzar la sincronización vertical para su software".

SET "BM.TXT_FORCE_COLOR" "Forzar color"
SET "BM.TXT_HINT_FORCE_COLOR" "Fuerzar el color para su software".

SET "BM.TXT_SCREEN_MODS" "Modificadores de posición de pantalla"
SET "BM.TXT_HINT_SCREEN_MODS" "Esta configuración le permite activar o desactivar la modificación de la posición de la pantalla".

SET "BM.TXT_SCREEN_MOD" "Modificador X/Y de pantalla"
SET "BM.TXT_HINT_SCREEN_MOD" "Este modificador se utiliza para compensar la posición de video X (horizontal) e Y (vertical) del software".

# PS2 Configuration Menu
SET "BM.TXT_PS2_CONFIG" "PS2"
SET "BM.TXT_HINT_PS2_CONFIG" "Cambiar la configuración de los juegos y el software de PS2".

SET "BM.TXT_MEGAMEM_PATCHER" "Parcheador MegaMemory"
SET "BM.TXT_HINT_MEGAMEM_PATCHER" "Activar o desactivar el parcheador para habilitar tarjetas de memoria MegaMemory/MAX más antiguas".

SET "BM.TXT_ATAD_PATCHER" "Parcheador ATAD(HDD)"
SET "BM.TXT_HINT_ATAD_PATCHER" "Activar o desactivar el parcheador para ATAD para desbloquear discos duros que no sean de Sony con juegos de PS2 habilitados para discos duros".

SET "BM.TXT_DVDDL_PATCHER" "Parcheador de DVD+R de doble capa"
SET "BM.TXT_HINT_DVDDL_PATCHER" "Activar o desactivar el parcheador para discos DVD+R de doble capa".

# DVD Configuration Menu
SET "BM.TXT_DVD_CONFIG" "Video DVD"
SET "BM.TXT_HINT_DVD_CONFIG" "Cambiar la configuración de los videos DVD".

SET "BM.TXT_DVD_VIDEO_FIXES" "Correcciones de video DVD"
SET "BM.TXT_HINT_DVD_VIDEO_FIXES" "Activar y desactivar correcciones de video DVD".

SET "BM.TXT_REGION_FREE" "Región libre"
SET "BM.TXT_HINT_REGION_FREE" "Esta función le permite ver videos DVD importados en su PS2".

SET "BM.TXT_DVD_PLAYER_REGION" "Región del reproductor de DVD"
SET "BM.TXT_HINT_DVD_PLAYER_REGION" "Esta función le permite configurar la región del reproductor de DVD para películas protegidas por RCE. Normalmente, conviene dejar esta opción configurada en 1".

SET "BM.TXT_RGB_FIX" "Corrección de RGB"
SET "BM.TXT_HINT_RGB_FIX" "Esta función le permite corregir el problema de la "pantalla verde" al ver videos en DVD".

SET "BM.TXT_VIDEO_STAB" "Estabilizador de video"
SET "BM.TXT_HINT_VIDEO_STAB" "Esto le permite desactivar la salida de Macrovision, mejorando la calidad del video en algunos casos".

SET "BM.TXT_HINT_FORCE_COLOR_DVD" "Esta función le permite forzar el color de los videos en DVD".

# Disc Boot Menu
SET "BM.TXT_BOOT_MENU" "Menú de arranque del disco"
SET "BM.TXT_BOOT_ENHANCED" "Arrancar en modo mejorado"
SET "BM.TXT_HINT_BOOT_ENHANCED" "Arrancar el disco con la mejora seleccionada actualmente habilitada".
SET "BM.TXT_BOOT_MINIMAL" "Arrancar en modo mínimo"
SET "BM.TXT_HINT_BOOT_MINIMAL" "Arrancar el disco con las mejoras mínimas habilitadas".
SET "BM.TXT_BOOT_SLEEP" "Arrancar en modo de suspensión"
SET "BM.TXT_HINT_BOOT_SLEEP" "Arrancar el disco con todas las mejoras y el chip Crystal deshabilitados".

# Theme Manager
SET "BM.TXT_THEME_MANAGER" "Tema"
SET "BM.TXT_HINT_THEME_MANAGER" "Configura, cambia, instala y elimina los temas de BootManager".
SET "BM.TXT_SELECTED_THEME" "Tema seleccionado"
SET "BM.TXT_MANAGE_THEME" "Administrar temas"

# Theme Configuration
SET "BM.TXT_THEMES" "Temas"
SET "BM.TXT_THEME_CONFIG" "Tema"
SET "BM.TXT_HINT_THEME_CONFIG" "Configurar el tema del menú de BootManager".

SET "BM.TXT_XY" "Posición X/Y"
SET "BM.TXT_WH" "Ancho/Alto"

SET "BM.TXT_THEME_MENU_IMG" "Imagen del menú"
SET "BM.TXT_HINT_THEME_MENU_IMG_XY" "Ajusta la posición X/Y de la pantalla para la imagen del menú".
SET "BM.TXT_HINT_THEME_MENU_IMG_WH" "Ajusta el ancho/alto de la imagen del menú".

SET "BM.TXT_THEME_DISC_IMG" "Imagen del disco"
SET "BM.TXT_HINT_DISC_IMG_XY" "Ajusta la posición X/Y de la pantalla para la imagen del icono del disco".
SET "BM.TXT_HINT_DISC_IMG_WH" "Ajusta el ancho/alto de la imagen del icono del disco".

SET "BM.TXT_THEME_MENU_TEXT" "Menú"
SET "BM.TXT_HINT_THEME_MENU_XY" "Ajusta la posición de pantalla X/Y para el menú."
SET "BM.TXT_HINT_THEME_MENU_WH" "Ajusta el ancho/alto del menú."

SET "BM.TXT_THEME_MENU_TITLE" "Título del menú"
SET "BM.TXT_HINT_THEME_MENU_TITLE_XY" "Ajusta la posición de pantalla X/Y para el título del menú."
SET "BM.TXT_HINT_THEME_MENU_TITLE_WH" "Ajusta el ancho/alto del título del menú."

SET "BM.TXT_BM_VERSION" "Etiqueta de la versión de BM"
SET "BM.TXT_HINT_BM_VERSION" "Ajusta la posición de pantalla X/Y para el texto de la versión de BM."

SET "BM.TXT_THEME_SCROLLER" "Barra de desplazamiento de sugerencias"
SET "BM.TXT_HINT_THEME_SCROLLER_XY" "Ajusta la posición X/Y de la pantalla para la barra de desplazamiento del menú".
SET "BM.TXT_HINT_THEME_SCROLLER_WH" "Ajusta el ancho/alto de la barra de desplazamiento del menú".

SET "BM.TXT_THEME_COLOR" "Colores del tema"
SET "BM.TXT_THEME_BG_COLOR" "Color de fondo"
SET "BM.TXT_HINT_THEME_BG_COLOR" "Elija el color de fondo".
SET "BM.TXT_THEME_FONT_COLOR" "Color de fuente"
SET "BM.TXT_HINT_THEME_FONT_COLOR" "Elija el color de fuente del menú".
SET "BM.TXT_THEME_FONT_COLOR_LABEL" "Color del título de la fuente"
SET "BM.TXT_HINT_THEME_FONT_COLOR_LABEL" "Elija el color del título y la etiqueta de la fuente".
SET "BM.TXT_THEME_FONT_COLOR_SCROLLER" "Color del cursor"
SET "BM.TXT_HINT_THEME_FONT_COLOR_SCROLLER" "Elija el color del cursor de sugerencias".

# Change Theme
SET "BM.TXT_MENU_CHANGE" "Cambiar"
SET "BM.TXT_HINT_THEME_CHANGE" "Seleccionar un nuevo tema y cambiar la apariencia de BootManager".
SET "BM.TXT_CHANGE_THM_FROM" "Seleccionar tema de"
SET "BM.TXT_CHANGE_AVAIL" "Temas disponibles en"

# Install Themes
SET "BM.TXT_HINT_THEME_INSTALL" "Instalar un tema de un dispositivo a otro".
SET "BM.TXT_INSTALL_THM_FROM" "Instalar tema(s) desde"
SET "BM.TXT_INSTALL_THM_TO" "Instalar tema en"

# Remove Themes
SET "BM.TXT_HINT_THEME_REMOVE" "Eliminar un tema de un dispositivo".
SET "BM.TXT_REMOVE_THM_FROM" "Eliminar tema(s) de"

# Disc Test
SET "BM.TXT_PS1_TEST_INFO" "La prueba de disco ahora probará la autenticación de Crystal Chip PS1 (también conocida como SCEx)".
SET "BM.TXT_START_PS1_TEST" "Iniciar prueba de disco PS1"

SET "BM.TXT_DISC_TEST" "Prueba de disco"
SET "BM.TXT_HINT_DISC_TEST" "La prueba de disco le permite verificar la instalación de Crystal Chip probando la autenticación de PS1 (también conocida como SCEx)".

SET "BM.TXT_PS1_WORK" "¡La autenticación de disco PS1 funciona!"
SET "BM.TXT_PS1_FAIL" "¡La autenticación de disco PS1 falló!"

SET "BM.TXT_CHECK_SX" "Verifique el cable de CrystalChip SX".

# Misc Config
SET "BM.TXT_MISC_CONFIG" "Miscelánea"
SET "BM.TXT_HINT_MISC_CONFIG" "Opciones de configuración diversas que no encajan en ninguna otra categoría".

SET "BM.TXT_GS_HOOK" "GS Hook"
SET "BM.TXT_HINT_GS_HOOK" "GS Hook de CrystalChip se utiliza para realizar correcciones de video avanzadas para el software de PS2, pero puede ser incompatible con algunos juegos".

SET "BM.TXT_IGR" "Reinicio en el juego"
SET "BM.TXT_HINT_IGR" "El reinicio en el juego (IGR) le permite reiniciar su PS2 presionando y manteniendo presionado L1+L2+R1+R2+Inicio+Seleccionar desde dentro de un juego de PS2".

# Video Wizard
SET "BM.TXT_VID_WIZ" "Asistente de video"
SET "BM.TXT_VID_WIZ_1" "Este asistente lo ayudará a determinar qué modos de video admite su televisor".
SET "BM.TXT_VID_WIZ_2" "Cuando el asistente esté completo, seleccionará automáticamente las mejores opciones de configuración de video para su televisor".
SET "BM.TXT_VID_WIZ_3" "Cada paso probará un modo de video diferente y le solicitará que seleccione una opción según lo que vea en la pantalla".
SET "BM.TXT_VID_WIZ_4" "Si no puede ver lo que está en la pantalla después de 10 segundos, presione X una vez y espere 10 segundos para la siguiente pantalla".
SET "BM.TXT_VID_WIZ_START" "Comenzar la prueba"
SET "BM.TXT_HINT_VID_WIZ_START" "Iniciar la prueba del modo de video del Asistente de video".

#Video Test
SET "BM.TXT_TEST_50HZ" "Prueba de 50 Hz"
SET "BM.TXT_TEST_PAL" "Prueba de color PAL"
SET "BM.TXT_TEST_60HZ" "Prueba de 60 Hz"
SET "BM.TXT_TEST_NTSC" "Prueba de color NTSC"
SET "BM.TXT_CAN_YOU_READ" "¿Puedes leer esta pantalla?"
SET "BM.TXT_YES_BUT" "Sí, pero la pantalla está 'rodando'".
SET "BM.TXT_SCREEN_COLOR" "¿Esta pantalla está en color?"

SET "BM.TXT_TEST_RESULTS" "Resultados de la prueba de video"
SET "BM.TXT_TEST_COMPLETE" "¡La prueba ya está completa!"
SET "BM.TXT_50HZ_YES" "Tu TV puede mostrar 50 Hz".
SET "BM.TXT_50HZ_NO" "Su televisor no puede mostrar 50 Hz".
SET "BM.TXT_60HZ_YES" "Su televisor puede mostrar 60 Hz".
SET "BM.TXT_60HZ_NO" "Su televisor no puede mostrar 60 Hz".
SET "BM.TXT_PAL_YES" "Su televisor puede mostrar color PAL".
SET "BM.TXT_PAL_NO" "Su televisor no puede mostrar color PAL".
SET "BM.TXT_NTSC_YES" "Su televisor puede mostrar color NTSC".
SET "BM.TXT_NTSC_NO" "Su televisor no puede mostrar color NTSC".
SET "BM.TXT_DONE" "Listo"
SET "BM.TXT_RETURN_CONFIG" "Volver al menú de configuración".

#Lockout/Pin Mode
SET "BM.TXT_CNF_LOCKOUT" "Seguridad"
SET "BM.TXT_CNF_LOCKOUT_HINT" "Bloquear funciones de BootManager con un PIN."
SET "BM.TXT_CNF_LOCKOUT_LABEL1" "Bloquear todas las funciones excepto"
SET "BM.TXT_CNF_LOCKOUT_LABEL2" "discos y aplicaciones de arranque."
SET "BM.TXT_CNF_LOCKOUT_LABEL3" "Ingrese su PIN para desbloquear todas las funciones."
SET "BM.TXT_CNF_LOCKOUT_LABEL4" "Para borrar un PIN olvidado, reinstale BootManager."
SET "BM.TXT_PIN_SETUP" "Elija un PIN"
SET "BM.TXT_PIN_SETUP_HINT" "Ingrese un PIN que se utilizará para bloquear funciones avanzadas en BootManager."
SET "BM.TXT_PIN_CONF" "Confirme el PIN elegido"
SET "BM.TXT_PIN_CONF_HINT" "Confirme el PIN que se utilizará para bloquear las funciones avanzadas en BootManager"
SET "BM.TXT_PIN_UNLOCK" "Ingrese su PIN para desbloquear todos los menús".
SET "BM.TXT_PIN_UNLOCK_HINT" "Para desbloquear todas las funciones, ingrese su PIN. Esto desbloqueará hasta que se configure un PIN nuevamente".
SET "BM.TXT_INCORRECT_PIN" "El PIN es incorrecto. Inténtelo nuevamente o restablezca reinstalando BM a través del disco".
SET "BM.TXT_PIN_SET" "¡Menús de BootManager bloqueados!"
SET "BM.TXT_UNLOCKED" "¡Menús de BootManager desbloqueados!"
SET "BM.TXT_LOCKOUT_WARNING" "Funciones avanzadas bloqueadas".

#Messages
SET "BM.TXT_SAVE_CONF_FAIL" "¡Error al guardar los ajustes de configuración!"
SET "BM.TXT_SAVE_THM_FAIL" "¡Error al guardar los ajustes de configuración del tema!"
SET "BM.TXT_DEL_FW_FAIL" "¡Error al borrar el firmware!"
SET "BM.TXT_CREATE_FAIL" "Error al crear"
SET "BM.TXT_COPY_FAIL" "Error al copiar"
SET "BM.TXT_COPY_DEF_THM_FAIL" "¡Error al copiar el tema predeterminado!"
SET "BM.TXT_INST_FAIL" "Error al instalar"
SET "BM.TXT_REM_FAIL" "Error al eliminar"
SET "BM.TXT_NO_CC" "CrystalChip no compatible"
SET "BM.TXT_PROGFW_FAIL" "¡Error al programar el archivo de firmware!"
SET "BM.TXT_PROGFW_DONE" "¡Firmware actualizado exitosamente!"

EXIT "0"
