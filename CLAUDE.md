# Repository Overview

This is a personal dotfiles repository for macOS development environment configuration. It uses GNU `stow` to symlink configuration files to the `$HOME` directory and manages system packages through Homebrew.

# Repository Structure

# Key Components
- Uses `stow` for symlink management
- Neovim config in Lua with LSP support (`nvim/lua/mulholo/`)
- Package management via Brewfile
- Ghostty terminal
- Zsh

## Directories
- **nvim/**: Neovim configuration with Lua-based setup and LSP support
- **zsh/**: Zsh shell configuration including .zshrc, .zprofile, .zshenv, and .bash_aliases
- **git/**: Git configuration (.gitconfig and .gitignore)
- **tmux/**: Tmux terminal multiplexer configuration (.tmux.conf)
- **ghostty/**: Ghostty terminal emulator configuration
- **bin/**: Custom shell scripts and utilities (automatically added to PATH)
- **bat/**: Bat syntax highlighter configuration
- **lazygit/**: Lazygit TUI configuration
- **gh/**: GitHub CLI configuration
- **starship/**: Starship shell prompt configuration
- **nvm/**: Node Version Manager configuration
- **dlv/**: Delve Go debugger configuration
- **vi/**: Basic vi/vim configuration
- **z/**: Z directory jumper configuration

# Common Commands

```bash
# Install packages via Homebrew
brew bundle

# Stow individual configurations
stow git
stow nvim
...
```

# Custom Scripts
Scripts in `/bin` are automatically added to PATH via zshrc. Examples:
- `git-paginate [start-ref]` - Interactive paginated git commit viewer using bat
- `clean-docker` - Docker cleanup utility
- `find-file-usage` - File usage search utility

