#!/usr/bin/lua

-- Configuración (0-100)
local BT_VOLUME = "40%"
local DEVICE_NAME = "bluez_output.33_DC_0A_87_B8_08" -- Basado en tu MAC

-- Comando para cambiar el volumen en PipeWire
local function set_volume(target)
  os.execute("pactl set-sink-volume " .. DEVICE_NAME .. " " .. target)
  -- Opcional: Notificación visual
  os.execute("notify-send 'Audio' 'Volumen ALE-HOP ajustado al " .. target .. "'")
end

set_volume(BT_VOLUME)
