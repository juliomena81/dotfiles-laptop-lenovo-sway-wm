#!/usr/bin/lua

local function get_wifi_usage()
  -- Lee las estadísticas de red
  local f = io.popen("cat /proc/net/dev | grep wlan0")
  local stats = f:read("*a")
  f:close()
  -- Si hay mucho tráfico, podría enviar señal a MPD
  return stats
end
