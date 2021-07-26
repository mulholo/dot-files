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

source ~/.zplug/init.zsh

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# # Then, source plugins and add commands to $PATH
zplug load --verbose

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='nvim'
# else
#   export EDITOR='vim'
# fi
export EDITOR='nvim'
export VIMCONFIG="$HOME/.dot-files/vim"

export FZF_DEFAULT_COMMAND="rg --files --hidden --follow"
export FZF_DEFAULT_OPTS='--height 96% --preview="bat --style=numbers --color=always {} | head -500" --preview-window=right:62%'

# Hide annoying iTerm2 title
echo -ne "\033]0;" "\007"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Src: https://davidxmoody.com/2014/permanent-bash-aliases/
# Example usage:
# mkalias hello=echo hello world  # Quotes optional
mkalias() {
  # Flatten arguments into one string
  local full_string=$*

  # Extract the first and last parts
  local alias_name=${full_string%%=*}
  local alias_result=${full_string#*=}

  # Construct the new command
  local alias_command="alias $alias_name='$alias_result'"

  # Execute the command, if successful then print
  # out the alias and add it to ~/.bash_aliases
  eval "$alias_command" && \
  echo "$alias_command" >> "$HOME/.bash_aliases" && \
  echo "$alias_command"
}

source $HOME/.bash_aliases


export TMUXINATOR_CONFIG="~/.tmuxinator"

# FUCK
eval $(thefuck --alias)
eval $(thefuck --alias FUCK)
export THEFUCK_REQUIRE_CONFIRMATION="false"

# add Z
. $HOME/z.sh
# avoid clash with xcode ctags

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# init rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export JAVA_HOME=$(/usr/libexec/java_home)

# go
export PATH=$PATH:$(go env GOPATH)/bin
export GOPATH=$(go env GOPATH)
export gopath=$(go env GOPATH)

export ANDROID_HOME="/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home"
export ANDROID_SDK_ROOT="/usr/local/share/android-sdk"

export PATH="$HOME/.npm-global/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH="$HOME/.fastlane/bin:$PATH"

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"

export BAT_CONFIG_PATH="$HOME/bat.conf"

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi
fpath+=${ZDOTDIR:-~}/.zsh_functions
export PATH="/usr/local/opt/openjdk/bin:$PATH"
export PATH="/usr/local/opt/swagger-codegen@2/bin:$PATH"

# command prompt
eval "$(starship init zsh)"

source $HOME/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fpath+=${ZDOTDIR:-~}/.zsh_functions
