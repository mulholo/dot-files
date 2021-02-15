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
brew instal --HEAD neovim
echo "✅ Installed packages via Homebrew."

echo "Stowing config"
stow zsh
stow git
stow z
echo "✅ Stowed config."

echo "Installing NPM packages..."
npm i -g typescript typscript-language-server \
  vscode-html-languageserver-bin \
  vscode-json-languageserver \
  yaml-language-server
echo "✅ Installed NPM packages"

echo "Installing pip packages..."
pip install python-language-server
echo "✅ Installed pip packages"

echo "Adding zsh syntax higlighting"
cd ~ && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "✅ Added zsh syntax higlighting"
