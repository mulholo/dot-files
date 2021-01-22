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

