# Habilitar Wayland nativo en Firefox
export MOZ_ENABLE_WAYLAND=1

# Forzar el uso de VA-APi
export LIBVA_DRIVER_NAME=radeonsi
export XDG_SESSION_TYPE=wayland

export GEM_HOME="$(ruby -e 'print Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"

# Zoxide - Lista de patrones a excluir (separados por dos puntos)
export ZOXIDE_EXCLUDE_DIRS=$HOME/Documentos/*:/run/media:/mnt
export _ZO_ECHO=pkcs11

if [ -z "$GNOME_KEYRING_CONTROL" ]; then
    eval $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh 2>/dev/null)
fi
export SSH_AUTH_SOCK
