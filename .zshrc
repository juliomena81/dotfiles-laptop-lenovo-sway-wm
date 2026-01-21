# Integración de fzf
source <(fzf --zsh)
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# Zoxide
eval "$(zoxide init zsh --cmd cd)"
# Desplegable fzf
alias zi='zoxide query -i'

# Starship Prompt
eval "$(starship init zsh)"

# --- Configuración de Historial ---
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
setopt APPEND_HISTORY      # No sobrescribir, añadir
setopt INC_APPEND_HISTORY  # Guardar inmediatamente
setopt SHARE_HISTORY      # Compartir entre terminales

# --- Completado Automático ---
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Z-a}' # Case insensitive

# --- Plugins ---
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-sudo/sudo.plugin.zsh
source /usr/share/doc/find-the-command/ftc.zsh askfirst

zstyle ':completion:*' menu select



# --- Alias de Productividad ---
alias ls='ls --color=auto'
alias ll='ls -lh'
alias grep='grep --color=auto'
alias v='nvim'
alias update='sudo pacman -Syu'

# rm, cp , mv interactivo
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# eza (ls)
alias ls='eza --icons --group-directories-first'
alias ll='eza -lh --icons --group-directories-first'
# eza (tree)
alias tree='eza --tree --icons --level=2'
# eza - fzf
alias ftree='fzf --preview "eza --tree --color=always {}" --preview-window=right:50%'

alias duf='duf --theme dark --style rounded'
alias ncdu='ncdu --color dark'

# Virt Manager
alias vms='virt-manager'

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# --- Keybindings (Fix para teclas Home/End/Del) ---
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char

# FZF
export FZF_DEFAULT_OPTS="--color=bg+:#222222,bg:-1,spinner:#f5e0dc,hl:#f38ba8,fg:#bbbbbb,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc,marker:#f5e0dc,fg+:#ffffff,prompt:#cba6f7,hl+:#f38ba8"

# yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
