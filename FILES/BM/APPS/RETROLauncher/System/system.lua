--[[------------------SPAGHETTICODE-------------------]]--
--[[█▀█ ██▀ ▀█▀ █▀█ █▀█ █    ▄▄ ▄ ▄ ▄▄▄ ▄▄▄ █▄▄ ▄▄  ▄▄]]--
--[[█▀▄ █▄▄  █  █▀▄ █▄█ █▄▄ ▀▄█ █▄█ █ █ █▄▄ █ █ ██▄ █ ]]--
--[[--------------------------------------------------]]--

-- Mostrar imagen antes de la carga de variables
if true then
	local res_x, res_y = 640,448
	if doesFileExist("System/Respaldo/PAL") == false and doesFileExist("System/Respaldo/NTSC") == false then
		local mensaje = "Boinas Hijo"
		local VMODE = System.openFile("System/Respaldo/NTSC",FCREATE)
		System.writeFile(VMODE,mensaje,string.len(mensaje))
		System.closeFile(VMODE)
	elseif doesFileExist("System/Respaldo/PAL") then
		Screen.setMode(PAL, 640, 512, CT24, INTERLACED, FIELD)
		res_x, res_y = 640,512
	end
	local FONDO_LOAD = Graphics.loadImage("System/Medios/Default/FONDO.png")
	local LOADING_LOAD = Graphics.loadImage("System/Medios/Default/LOADING.png")
	Screen.clear(Color.new(0,0,0))
	Graphics.drawScaleImage(FONDO_LOAD,-5,0,res_x+5,res_y,Color.new(0,80,120))
	Graphics.drawScaleImage(LOADING_LOAD,0,0,res_x,res_y)
	Screen.flip()
	Graphics.freeImage(FONDO_LOAD)
	Graphics.freeImage(LOADING_LOAD)
	if doesFileExist("System/Medios/Sound/Background/music.adp") == true and doesFileExist("System/Medios/Sound/Background/music0.adp") == true then
		System.removeFile("System/Medios/Sound/Background/music.adp")
	end
end

--- Líneas para audio
-----------------------------------------------------------------------------------------
-- Define formato de audio
Sound.setFormat(16,48000,4)

function set_volume() -- Define el volumen
	Sound.setADPCMVolume(1,OPCIONES.SOUND_VOLUME)
	if OPCIONES.SOUND_VOLUME >= 9 then
		Sound.setADPCMVolume(2,OPCIONES.SOUND_VOLUME-8)
	else
		Sound.setADPCMVolume(2,0)
	end
	Sound.setADPCMVolume(3,OPCIONES.SOUND_VOLUME)
	Sound.setADPCMVolume(4,OPCIONES.SOUND_VOLUME)
end

function verificar_sonidos(sonido,dir) -- Verifica los sonidos
	local actual = System.currentDirectory()
	if doesFileExist(actual .."/".. dir) then
		sonido = Sound.loadADPCM(dir)
	else
		sonido = nil
	end
	return sonido
end

MENU_SONIDOS = {
	CANCELAR = verificar_sonidos(CANCELAR,"System/Medios/Sound/Menu/back.adp");
	NETX = verificar_sonidos(NETX,"System/Medios/Sound/Menu/next.adp");
	MOVER = verificar_sonidos(MOVER,"System/Medios/Sound/Menu/move.adp");
	EJECUTAR = verificar_sonidos(EJECUTAR,"System/Medios/Sound/Menu/run.adp");
	ERROR = verificar_sonidos(ERROR,"System/Medios/Sound/Menu/error.adp");
	MUSICA = verificar_sonidos(MUSICA,"System/Medios/Sound/Background/music.adp");
}; -- Pre cargar sonidos del menu

-- Cargar todas las variables y configuraciones
-----------------------------------------------------------------------------------------
require("System/menu")
require("System/funciones")
puerto_usb()
recargar_todas()
cargar_config()

-- Ejecutar RETROLauncher
-----------------------------------------------------------------------------------------
while true do
	Dibujar()
	Generar_Listas()
	refrescar()
	CONTROL.FPS = Screen.getFPS(1)
end
--[[------------------SPAGHETTICODE-------------------]]--