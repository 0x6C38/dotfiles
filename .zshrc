# This outputs an error "gtk: Use -g to generate an oomox theme when oomox not
# installed and Loading oomox... + delay when installed."
#(wal -t -g &)
# Adding & (neofetch &) loads neofetch faster than the prompt
(neofetch)

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/usr/share/oh-my-zsh
#  source "$HOME/.cache/wal/colors.sh" # Exports wal colors, comment if not used

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)

(source /etc/environment &)

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="bureau"
# ZSH_THEME="geometry"
ZSH_THEME="wedisagree"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git cp jump nyan globalias)

source $ZSH/oh-my-zsh.sh

. ~/.cache/wal/colors.sh
# source antigen.zsh
# antigen theme funky
# antigen theme frmendes/geometry
# antigen bundle zsh-users/zsh-syntax-highlighting
# antigen bundle zsh-users/zsh-autosuggestions

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Aliases
alias -g zshconfig="vim ~/.zshrc"
alias -g ohmyzsh="vim ~/.oh-my-zsh"
alias -g reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias -g ytp='youtube-dl -cio "%(playlist_index)s-%(title)s.%(ext)s" '
alias -g lsn="ls --color=no"
alias -g pbcopy='xsel --clipboard --input'
alias -g pbpaste='xsel --clipboard --output'
alias -g sxiv='sxiv -s f'
alias j='jump'

# Fuzzy finder
source "$(fzf-share)/key-bindings.zsh"
source "$(fzf-share)/completion.zsh"


(if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi &)

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#

# This loads nvm, node and npm lazily so that the shell won't lag
nvm() {
    unset -f nvm
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    nvm "$@"
}

node() {
    unset -f node
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    node "$@"
}

npm() {
    unset -f npm
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    npm "$@"
}

# npm must be loaded into the shell before using sls or any npm packages
# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
([[ -f /home/ds/.nvm/versions/node/v9.5.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/ds/.nvm/versions/node/v9.5.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh &)
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
([[ -f /home/ds/.nvm/versions/node/v9.5.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /home/ds/.nvm/versions/node/v9.5.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh &)
