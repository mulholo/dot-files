#!/bin/bash

# Install Command Line Tools
echo "Installing macOS Command Line Tools..."
xcode-select --install
echo "✅ Command Line Tools installed."

# Install Homebrew (brew.sh)
echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo "✅ Homebrew installed."

# Install packages via Homebrew
echo "Installing packages via Homebrew..."
brew bundle
echo "✅ Installed packages via Homebrew."

# Check if stow is installed
if ! command --verson stow &> /dev/null; then
  echo "Error: stow is not installed. Please install it and try again: https://ftp.gnu.org/gnu/stow/."
  exit 1
fi

echo "Stowing config"
stow alacritty
stow bat
stow git
stow starship
stow tmux
stow z
stow zsh
echo "✅ Stowed config."

echo "Linking nvim config"
mkdir ~/.config/nvim
touch ~/.config/nvim/init.vim
echo "set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.dot-files/nvim/init.vim" > ~/.config/nvim/init.vim
echo "✅ Linked nvim config"

echo "Installing NPM packages..."
npm i -g typescript neovim
echo "✅ Installed NPM packages"

echo "Installing Python neovim config"
pip3 install pynvim
echo "✅ Installed Python neovim config"

echo "Adding zsh syntax higlighting"
cd ~ && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "✅ Added zsh syntax higlighting"

echo "Setting up tmux plugins"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "✅ Set up tmux plugins"

echo "Setting up fzf auto-complete"
$(brew --prefix)/opt/fzf/install
echo "✅ Set up fzf auto-complete"
