# Path to your oh-my-zsh installation.
export ZSH="/Users/jamesmulholland/.oh-my-zsh"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

export TERM="xterm-256color"
ZSH_THEME="bullet-train"

ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-syntax-highlighting
  yarn
)

source $ZSH/oh-my-zsh.sh

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
else
   export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Aliases
alias lo3="lsof -i :3000"
alias lo8="lsof -i :3000"
alias lof="lsof -i :"
alias clr="clear"
alias ofor="foreman start -f Procfile.development"
alias cor="cd ~/proj/Orulo"
alias cpr="cd ~/proj/"
alias v="nvim"
alias zrc="vim ~/.zshrc"
alias gche="git checkout"
alias gpul="git pull"
alias gpus="git push"
alias gadd="git add ."
alias gcom="git commit -m "
alias gsta="git status"
alias glog="git log"
alias glogg="git log --oneline --graph --decorate --all"

# add Z
. /usr/local/Cellar/z/1.9/etc/profile.d/z.sh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Bullet Train Options
BULLETTRAIN_PROMPT_ORDER=(
  status
  custom
  context
  dir
  screen
  aws
  git
  hg
  cmd_exec_time
)

BULLETTRAIN_CONTEXT_DEFAULT_USER=jamesmulholland
