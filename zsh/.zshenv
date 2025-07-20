# .zshenv is sourced for ALL zsh sessions (interactive and non-interactive)
# This ensures XDG_CONFIG_HOME is available to GUI apps launched from Finder/Dock
# which don't inherit shell environment variables from .zshrc
export XDG_CONFIG_HOME="$HOME/.dot-files"

. "$HOME/.cargo/env"
