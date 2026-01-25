#!/usr/bin/lua

-- Colores ANSI estándar
local blue     = "\27[34m"
local green    = "\27[32m"
local yellow   = "\27[33m"
local red      = "\27[31m"
local lavender = "\27[35m"
local bold     = "\27[1m"
local reset    = "\27[0m"

local function cmd(c)
  local h = io.popen(c .. " 2>/dev/null")
  if not h then return "" end
  local r = h:read("*a")
  h:close()
  return r:gsub("%s+$", "")
end

-- Lógica de Batería
local bat_raw = cmd("bluetoothctl info 33:DC:0A:87:B8:08 | grep 'Battery' | awk '{print $4}'")
local bat_val = tonumber(bat_raw:match("%d+") or "")
local bat_display = bat_val and (bat_val .. "%") or "Disconnected"
local bat_color = (not bat_val or bat_val < 20) and red or (bat_val < 50 and yellow or green)

local bitrate = cmd("mpc -f %bitrate% current")
bitrate = (bitrate ~= "") and (bitrate .. " kbps") or "Idle"

-- Renderizado (Línea 35 corregida)
print("\n" .. bold .. lavender .. " 󰎆  MPD DASHBOARD" .. reset)
print(string.format(" %s%-12s %s%s", blue, "󰋋 Device:", reset, "ALE-HOP 1712 mini"))
print(string.format(" %s%-12s %s%s%s", blue, "󱐋 Battery:", bat_color, bat_display, reset))
print(string.format(" %s%-12s %s%s", blue, "󰇧 Bitrate:", reset, bitrate))
print(" " .. lavender .. "──────────────────────────" .. reset .. "\n")
