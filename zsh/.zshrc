export TERM="xterm-256color"

export XDG_CONFIG_HOME="$HOME/.dot-files/"

# disable auto correct
ENABLE_CORRECTION="false"
unsetopt correct_all

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR='nvim'

export FZF_DEFAULT_COMMAND="rg --files --hidden --follow"
export FZF_DEFAULT_OPTS='--height 96% --preview="bat --style=numbers --color=always {} | head -500" --preview-window=right:62%'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Hide annoying iTerm2 title
echo -ne "\033]0;" "\007"

# Add bash aliases
source $HOME/.bash_aliases

# Add custom bash scripts to path
export PATH="$HOME/bin:$PATH"

# tmux
export TMUXINATOR_CONFIG="~/.tmuxinator"

# z
. $HOME/z.sh

# bat
export BAT_CONFIG_PATH="$HOME/bat.conf"

# Syntax Highlighting
source $HOME/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

fpath+=${ZDOTDIR:-~}/.zsh_functions

# CLIs ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Hasura auto-completion on command line
# hasura completion zsh --file=$HOME/.oh-my-zsh/completions/_hasura

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

export GPG_TTY=$(tty)

# command prompt
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.starship.toml

# fuck
export THEFUCK_REQUIRE_CONFIRMATION="false"
# make 'fuck' command work in terminal
eval $(thefuck --alias)

# Add github-copilot-cli commands e.g. ??, git?
eval "$(github-copilot-cli alias -- "$0")"

# Language setup ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Go
export PATH=$PATH:$(go env GOPATH)/bin
export GOPATH=$(go env GOPATH)
export gopath=$(go env GOPATH)

#home
eval "$(/opt/homebrew/bin/brew shellenv)"

# Python
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"

# Node/nvm
export PATH="$HOME/.npm-global/bin:$PATH"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Auto run nvm in directories with an nvmrc
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
