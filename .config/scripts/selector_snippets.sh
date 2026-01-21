#!/bin/bash

# Lee el archivo, lo muestra en wofi y guarda la elección
SELECCION=$(cat ~/.config/scripts/snippets.txt | wofi --dmenu --prompt "Seleccionar texto fijo...")

if [ ! -z "$SELECCION" ]; then
    wl-copy "$SELECCION"
    sleep 0.2
    wtype -M ctrl v -m ctrl # Simula Ctrl+V
fi
