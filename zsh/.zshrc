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

export EDITOR='vi'

export FZF_DEFAULT_COMMAND="rg --files --hidden --follow"
export FZF_DEFAULT_OPTS='--height 96% --preview="bat --style=numbers --color=always {} | head -500" --preview-window=right:62%'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

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

export GPG_TTY=$(tty)

# command prompt
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.starship.toml

# fuck
export THEFUCK_REQUIRE_CONFIRMATION="false"
# make 'fuck' command work in terminal
eval $(thefuck --alias)

# Language setup ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Required for airbyte
export PATH="$HOME/.local/bin:$PATH"

# Go
export PATH=$PATH:$(go env GOPATH)/bin
export GOPATH=$(go env GOPATH)
export gopath=$(go env GOPATH)

eval "$(/opt/homebrew/bin/brew shellenv)"

# Rust
. "$HOME/.cargo/env" 

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

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "/Users/james/.bun/_bun" ] && source "/Users/james/.bun/_bun" # Bun completions

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/james/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/james/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/james/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/james/google-cloud-sdk/completion.zsh.inc'; fi
