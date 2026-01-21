#!/bin/bash
# Comprueba si hay alguna interfaz de WireGuard activa
if [ "$(nmcli -t -f TYPE,STATE dev | grep "wireguard:connected")" ]; then
    # Icono y texto cuando está conectada
    echo '{"text": " VPN", "class": "connected", "tooltip": "Proton VPN Activa"}'
else
    # Icono y texto cuando está desconectada
    echo '{"text": " VPN", "class": "disconnected", "tooltip": "Sin protección VPN"}'
fi
