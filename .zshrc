
export PATH="$PATH:$HOME/.local/bin"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Add rbenv to PATH
export PATH="$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

# Add local bin to PATH
export PATH="$PATH:$HOME/.local/bin"

# Add RVM to PATH for scripting (optional, if you still use RVM)
export PATH="$PATH:$HOME/.rvm/bin"

# ---- Starship -----
eval "$(starship init zsh)"
# Disable Starship in VS Code terminal
if [[ -z "$TERM_PROGRAM" || "$TERM_PROGRAM" != "vscode" ]]; then
  eval "$(starship init zsh)"
fi


# ---- Oh my posh -----
# if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
#   eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"
# fi

# ---- FZF -----

eval "$(fzf --zsh)"

# --- setup fzf theme ---

# --- setup fzf theme for Catppuccin Mocha ---
fg="#CDD6F4"           # Text
bg="#1E1E2E"           # Background
bg_highlight="#313244" # Highlight background
purple="#CBA6F7"       # Purple
blue="#89B4FA"         # Blue
cyan="#94E2D5"         # Cyan

export FZF_DEFAULT_OPTS="--color=fg:${fg},bg:${bg},hl:${purple},fg+:${fg},bg+:${bg_highlight},hl+:${purple},info:${blue},prompt:${cyan},pointer:${cyan},marker:${cyan},spinner:${cyan},header:${cyan}"

# --- ls preview ---

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# ----- Bat (better cat) -----

export BAT_THEME="Catppuccin Mocha"


# ---- Eza (better ls) -----

# alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias ls="eza --color=always --icons=always"
# alias ls="eza"

# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"

alias cd="z"

# --- The Fuck ---
eval $(thefuck --alias)
eval $(thefuck --alias fk)

# --- Yazi ---
export EDITOR=nvim

# function y() {
# 	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
# 	yazi "$@" --cwd-file="$tmp"
# 	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
# 		builtin cd -- "$cwd"
# 	fi
# 	rm -f -- "$tmp"
# }

# --- Terminal Autosuggestion --- 
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# --- Terminal Syntax Highlighting --- 
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# --- Rust --- 
export PATH="$HOME/.cargo/bin:$PATH"

# --- Fastfetch --- 
# pokeget charizard  --hide-name | fastfetch --logo-padding-top 4  --file-raw -

# --- Go ---
export PATH=$PATH:/usr/local/go/bin
