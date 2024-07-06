# Shell integration
eval "$(starship init zsh)"
source <(fzf --zsh)
if [[ -f "/opt/homebrew/bin/brew" ]] then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Plugins
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh


# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

KEYTIMEOUT=1

# vi mood
bindkey -v

# Alias
alias ls='colorls'
alias python='python3'
alias v='nvim'
alias vi='nvim .'
alias c='clear'
alias lg='lazygit'
alias bare='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias ta="tmux a"
alias tx='tmux list-sessions | cut -d: -f1 | xargs -t -I {} tmux kill-session -t {}'

# Keybinding
bindkey -s ^k '~/.local/scripts/tmux-session-selector\n'
bindkey -s ^f '~/.local/scripts/tmux-sessionizer\n'
bindkey -s ^h '~/.local/scripts/tmux-sessionizer ~/ \n'
bindkey -s ^o '~/.local/scripts/open-file\n'
bindkey '^ ' autosuggest-accept
bindkey '^d' fzf-cd-widget
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# fzf settings
set -o ignoreeof
export FZF_ALT_C_OPTS=" --prompt '   ' --pointer "󰁕" --height=80% --preview 'tree -C {}'"
export FZF_CTRL_R_OPTS=" --prompt '   ' --pointer "󰁕" --reverse"
export FZF_CTRL_T_OPTS=" --prompt '   ' --pointer "󰁕""

# Best way to change directory automatically
set_fzf_alt_c_command() {
  if [ "$PWD" = "$HOME" ]; then
    export FZF_ALT_C_COMMAND='find -L ~/Documents/* ~/ -mindepth 1 -maxdepth 4 -type d ! -name "." ! -path "*/.Trash/*" ! -path "$HOME/Documents/*" ! -path "*/.vscode/*" ! -path "*/.git/*" ! -path "*/.tmux/*" ! -path "*/Library/*" ! -path "*/.cache/*" ! -path "*/.npm/*" ! -path "*/Pictures/*" ! -path "*/Movies/*" ! -path "*/Music/*" ! -path "*/.mypy_cache/*" 2>/dev/null'
  else
    unset FZF_ALT_C_COMMAND
  fi
}
    # Set FZF_ALT_C_COMMAND when Zsh changes directories
chpwd() {
    set_fzf_alt_c_command
}
    # Initial setup
set_fzf_alt_c_command

