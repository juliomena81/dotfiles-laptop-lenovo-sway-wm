#!/bin/bash

# 1. Acciones de volumen
case "$1" in
    up)
        pactl set-sink-volume @DEFAULT_SINK@ +5% ;;
    down)
        pactl set-sink-volume @DEFAULT_SINK@ -5% ;;
    mute)
        pactl set-sink-mute @DEFAULT_SINK@ toggle ;;
esac

# 2. Obtener el volumen actual (extrayendo solo el número)
volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '[0-9]+(?=%)' | head -n 1)
is_muted=$(pactl get-sink-mute @DEFAULT_SINK@ | grep -Po '(?<=Mute: )(yes|no)')

# 3. Notificación HUD para Mako
if [ "$is_muted" == "yes" ]; then
    notify-send -h string:x-canonical-private-synchronous:volume \
                -h int:value:0 \
                -c volume \
                "Silenciado"
else
    # Envía el título y el porcentaje debajo, activando la barra de Mako
    notify-send -h string:x-canonical-private-synchronous:volume \
                -h int:value:"$volume" \
                -c volume \
                "Volumen" "$volume%"
fi
