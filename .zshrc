[[ -f ~/.config/zsh/aliases.zsh ]] && source ~/.config/zsh/aliases.zsh
[[ -f ~/.config/zsh/functions.zsh ]] && source ~/.config/zsh/functions.zsh
[[ -f ~/.config/zsh/functions.zsh ]] && source ~/.config/zsh/binds.zsh

zmodload zsh/zprof

zstyle ':completion:*' cache-path "$HOME/.cache/zsh/zcompcache"
zstyle ':completion:*' use-cache on

autoload -Uz compinit
compinit -C

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Z-a}'

# --- Configuración de Historial ---
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY      # No sobrescribir, añadir
setopt INC_APPEND_HISTORY  # Guardar inmediatamente
setopt SHARE_HISTORY      # Compartir entre terminales
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE

# --- Plugins ---
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 
source /usr/share/zsh/plugins/zsh-sudo/sudo.plugin.zsh
source /usr/share/doc/find-the-command/ftc.zsh askfirst
source /usr/share/zsh/plugins/zpy/zpy.plugin.zsh
source /usr/share/zsh/plugins/zsh-bat/zsh-bat.plugin.zsh
source /usr/share/zsh/plugins/zsh-archlinux/archlinux.plugin.zsh
source /usr/share/zsh/plugins/alt-and-select/alt-and-select.plugin.zsh

## Theme
source ~/.config/zsh/plugins/powerlevel10k/powerlevel10k.zsh-theme

# Integración de fzf
source <(fzf --zsh)
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# Zoxide
eval "$(zoxide init zsh --cmd cd)"
# Desplegable fzf
alias zi='zoxide query -i'




# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh



export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/julio/.lmstudio/bin"
# End of LM Studio CLI section

