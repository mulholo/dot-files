#!/bin/bash

# Install Command Line Tools
echo "Installing macOS Command Line Tools..."
xcode-select --install
echo "✅ Command Line Tools installed."

# Install Homebrew (brew.sh)
echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
echo "✅ Homebrew installed."

# Install packages via Homebrew
echo "Installing packages via Homebrew..."
brew bundle
echo "✅ Installed packages via Homebrew."

echo "Stowing config"
stow alacritty
stow bat
stow git
stow tmux
stow tmuxinator
stow yarn
stow z
stow zsh
echo "✅ Stowed config."

echo "Linking nvim config"
mkdir .config/nvim
touch .config/nvim/init.vim
echo "set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.dot-files/init.vim" > .config/nvim/init.vim
echo "✅ Linked nvim config"

echo "Installing NPM packages..."
npm i -g typescript neovim
echo "✅ Installed NPM packages"

echo "Installing pip packages..."
pip install python-language-server
echo "✅ Installed pip packages"

echo "Adding zsh syntax higlighting"
cd ~ && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "✅ Added zsh syntax higlighting"

echo "Setting up tmux plugins"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "✅ Set up tmux plugins"

echo "Setting up fzf auto-complete"
$(brew --prefix)/opt/fzf/install
echo "✅ Set up fzf auto-complete"
