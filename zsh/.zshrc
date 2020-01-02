# Path to your oh-my-zsh installation.
export ZSH="/Users/jamesmulholland/.oh-my-zsh"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
export TERM="xterm-256color"
ZSH_THEME=""

#disable auto correct
ENABLE_CORRECTION="false"
unsetopt correct_all

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
  yarn
)

source $ZSH/oh-my-zsh.sh

autoload -U promptinit; promptinit
prompt pure

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='nvim'
# else
#   export EDITOR='vim'
# fi
export EDITOR='nvim'

export FZF_DEFAULT_COMMAND="ag -l --hidden -g '^(?!.*node_modules\/|.*dist\/|.*build).*$'"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Aliases
alias lf="lsof -i :"
alias cpr="cd ~/proj/"
alias dif="git diff"
alias sta="git status"
alias v="nvim"
alias zshrc="nvim ~/.zshrc"
alias vimrc="nvim ~/.vimrc"
alias pom="noti ~/pomodoro"
alias ngrok="~/ngrok"
alias stik="nvim ~/.stik.md"
# Show current requested and assigned PRS
alias prs="hub pr list --state=open --format='%pC%>(8)%i%Creset %t %n   Author: %au | Requested: %rs %n   URL: %U %n%n' --limit=200 --sort=long-running | grep --color='never' --context=2 -E 'mulholio'"
# Memrise
alias wa-up="docker-compose -f docker-compose.yml -f webapp/docker-compose-dev.yml up"
alias wa-down="docker-compose -f docker-compose.yml -f webapp/docker-compose-dev.yml down"
alias dc="cd ~/proj/memrise && docker-compose -f docker-compose.yml -f webapp/docker-compose-dev.yml -f web_client/docker-compose-dev.yml -f meme/docker-compose-dev.yml -f cas/docker-compose-dev.yml" # args go after here
alias wsh="docker exec -it web_client sh"

# FUCK
eval $(thefuck --alias)
eval $(thefuck --alias feck)
eval $(thefuck --alias FUCK)
alias stik="nvim ~/.stik.md"
alias fun="echo 'Coding is fun. Shutting off the world, solving problems, being in flow; the satisfaction of working hard is one of the best feeling you can have for an hour. Make some red, green, refactor loops. Learn somethign new. Improve your skills. Be a hacker.'"

# add Z
. /usr/local/Cellar/z/1.9/etc/profile.d/z.sh
# avoid clash with xcode ctags
alias ctags="`brew --prefix`/bin/ctags"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export GOPATH=$HOME/go

export JAVA_HOME="/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home"
export ANDROID_HOME="/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home"
export ANDROID_SDK_ROOT="/usr/local/share/android-sdk"

export PATH="$HOME/.npm-global/bin:$PATH"

export NVM_DIR="/Users/jamesmulholland/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH="$HOME/.fastlane/bin:$PATH"

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jamesmulholland/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jamesmulholland/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jamesmulholland/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jamesmulholland/google-cloud-sdk/completion.zsh.inc'; fi
