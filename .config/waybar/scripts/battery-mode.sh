#!/bin/bash
# Leer estado actual
STATUS=$(tr -d '[:space:]' < /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode)

# Si nos pasan el argumento "switch", cambiamos el modo
if [ "$1" == "switch" ]; then
    if [ "$STATUS" == "1" ]; then
        echo 0 | sudo /usr/bin/tee /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode > /dev/null
        STATUS="0"
    else
        echo 1 | sudo /usr/bin/tee /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode > /dev/null
        STATUS="1"
    fi
    # Avisar a Waybar para que se actualice
    pkill -RTMIN+10 waybar
fi

# Mostrar el icono/texto
if [ "$STATUS" == "1" ]; then
    echo "󰚥 ECO"
else
    echo "󰂄 MAX"
fi
