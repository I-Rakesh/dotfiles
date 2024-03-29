# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH


# Set name of the theme to load --- if set to "random", it will
# to know which specific one was loaded, run: echo $RANDOM_THEME
ZSH_THEME="robbyrussell"

# ~/.zshrc
eval "$(starship init zsh)"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git
)
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# vi mood
bindkey -v

# Example aliases
# alias zshconfig="mate ~/.zshrc"

alias ls='colorls'
alias python='python3'
alias v='nvim'
alias vi='nvim .'
alias c='clear'
alias lg='lazygit'
alias bare='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias ta="tmux a"
alias tx='tmux list-sessions | cut -d: -f1 | xargs -t -I {} tmux kill-session -t {}'


bindkey -s ^k '~/.local/scripts/tmux-session-selector\n'
bindkey -s ^f '~/.local/scripts/tmux-sessionizer\n'
bindkey -s ^h '~/.local/scripts/tmux-sessionizer ~/ \n'
bindkey -s ^o '~/.local/scripts/open-file\n'
bindkey '^ ' autosuggest-accept
bindkey '^d' fzf-cd-widget
KEYTIMEOUT=1
set -o ignoreeof
export FZF_ALT_C_OPTS=" --prompt '   ' --pointer "" --height=80% --preview 'tree -C {}'"
export FZF_CTRL_R_OPTS=" --prompt '   ' --pointer "" --reverse"

# Best way to change directory automatically
set_fzf_alt_c_command() {
  if [ "$PWD" = "$HOME" ]; then
    export FZF_ALT_C_COMMAND='find ~/Documents/* ~/ -mindepth 1 -maxdepth 4 -type d ! -name "." ! -path "/.Trash/" ! -path "*/Library/*" ! -path "*/.cache/*" 2>/dev/null'
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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# function to change the cursor shape base on the mood
# function zle-keymap-select () {
#     case $KEYMAP in
#         vicmd) echo -ne '\e[1 q\e[?12l';;      # block
#         viins|main) echo -ne '\e[5 q\e[?12l';; # beam
#     esac
# }
# zle -N zle-keymap-select
# zle-line-init() {
#     zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
#     echo -ne "\e[5 q"
# # Turn off blinking
#     echo -ne '\e[?12l\e[?25h'
# }
# zle -N zle-line-init
# echo -ne '\e[5 q\e[?12l' # Use beam shape cursor on startup.
# preexec() { echo -ne '\e[5 q\e[?12l' ;} # Use beam shape cursor for each new prompt.
