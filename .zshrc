# Path to your oh-my-zsh installation.u
export ZSH=$HOME/.oh-my-zsh
export PATH=/Users/iha2/bin/activator-1.2.10:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=$HOME/Library/Haskell/bin:$PATH
export PATH=/usr/local/spark/bin:$PATH
export PATH=/Users/iha2/.local/bin:$PATH
export CLASSPATH=".:/usr/local/lib/antlr-4.5-complete.jar:$CLASSPATH"
export PATH=$HOME/.cargo/bin:$PATH
export PATH=/usr/local/Cellar/emacs/26.1_1/bin/emacs-26.1:$PATH
#rust source path
export RUST_SRC_PATH=$HOME/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src

#Android related
export ANDROID_HOME=/Applications/AndroidSDKDev/sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools


source ~/bin/alias
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="random"


#~~~Environment variables
#~~~zsh plugins
plugins=(dirhistory scala sudo web-search osx wd gem haskell)


#run TMUX in startup
#if [[ ! $TERM =~ screen ]]; then
#	exec tmux
#fi

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

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
plugins=(git)

source $ZSH/oh-my-zsh.sh
# export MANPATH="/usr/local/man:$MANPATH"

#AlIASES

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
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# OPAM configuration
./Users/iha2/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true


#for mactex


if [ -d "$HOME/.local/bin" ]; then
	export PATH="$HOME/local/bin:$PATH"
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export JPEG_DIR=/usr/local
export SVN_EDITOR=vim
export PATH="$HOME/anaconda2/bin:$PATH"

export NVM_DIR="/Users/iha2/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm