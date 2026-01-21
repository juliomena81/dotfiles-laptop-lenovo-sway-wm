#!/bin/bash

# 1. Obtenemos solo los nombres de las conexiones Wireguard de Proton
options=$(nmcli -t -f NAME,TYPE connection show | grep "wireguard" | cut -d: -f1)

# 2. Si no hay opciones, avisamos y salimos
if [ -z "$options" ]; then
    notify-send "VPN Error" "No se encontraron conexiones Wireguard"
    exit 1
fi

# 3. Lanzamos Wofi
chosen=$(echo "$options" | wofi --dmenu --prompt "Seleccionar Servidor Proton" --width 300 --height 250 --location center)

# 4. Si el usuario eligió algo, conectamos
if [ -n "$chosen" ]; then
    # Notificamos el cambio
    notify-send "Proton VPN" "Conectando a $chosen..."

    # Bajamos cualquier VPN activa primero
    active=$(nmcli -t -f NAME,TYPE connection show --active | grep "wireguard" | cut -d: -f1)
    if [ -n "$active" ]; then
        nmcli connection down "$active"
    fi

    # Subimos la nueva
    nmcli connection up "$chosen"
fi
