# Neovim Configuration Architecture

This document describes the architecture and configuration of the Neovim setup in this dotfiles repository.

## Overview

The Neovim configuration is built using Lua and organized in a modular structure under `nvim/lua/mulholo/`. It uses Packer for plugin management and follows a clean separation of concerns.

## File Structure

```
nvim/
├── init.lua                    # Entry point - loads all modules
├── lua/mulholo/
│   ├── completion.lua          # nvim-cmp completion configuration
│   ├── gitsigns.lua            # Git status in gutter configuration
│   ├── keymaps.lua             # Custom key mappings
│   ├── lsp/                    # LSP configuration directory
│   │   ├── handlers.lua        # LSP handlers and diagnostics
│   │   ├── init.lua            # Main LSP setup
│   │   ├── lsp-installer.lua   # LSP server installer
│   │   └── settings/           # Language-specific LSP settings
│   │       ├── jsonls.lua      # JSON Language Server
│   │       ├── pyright.lua     # Python Language Server
│   │       └── sumneko_lua.lua # Lua Language Server
│   ├── null-ls.lua             # Formatting and linting
│   ├── nvim-tree.lua           # File explorer configuration
│   ├── options.lua             # Core Vim options
│   ├── plugins.lua             # Plugin management with Packer
│   ├── telescope.lua           # Fuzzy finder configuration
│   └── theme.lua               # Color scheme and appearance
└── plugin/
    └── packer_compiled.lua     # Auto-generated Packer compilation
```

## Configuration Modules

### Core Configuration (`init.lua`)
- Entry point that requires all modules in order
- Contains VimScript configurations for airline statusline
- Handles airline customization through `AirlineInit()` function

### Options (`options.lua`)
- Basic Vim settings and behavior
- Line numbers: absolute current line + relative others
- Mouse support, clipboard integration, search settings
- UI enhancements: cursorline, signcolumn, scrolloff

### Plugins (`plugins.lua`)
- Packer.nvim for plugin management
- Key plugins:
  - **Telescope**: Fuzzy finder with hidden file support
  - **nvim-tree**: File explorer (closes on file open)
  - **gitsigns**: Git status indicators in gutter
  - **vim-airline**: Status line with custom sections
  - **LSP ecosystem**: Language server support
  - **nvim-cmp**: Auto-completion framework

### Theme (`theme.lua`)
- Solarized8 color scheme with system theme detection
- Automatic dark/light mode switching based on macOS system preference
- Custom highlights for command line area
- Terminal colors and cursor line fixes

### File Explorer (`nvim-tree.lua`)
- Right-side placement
- Git integration enabled
- Custom key mappings for splits

### LSP Configuration (`lsp/`)
- Modular LSP setup with language-specific configurations
- Auto-installation of language servers
- Custom handlers for diagnostics and hover
- Support for JSON, Python, and Lua languages

## Installation Notes

1. Uses Packer for plugin management
2. Requires Nerd Font for proper icon display
3. System theme detection works on macOS
4. LSP servers auto-install on first use
5. All configuration is in Lua except airline (VimScript)

## Customization Philosophy

- Minimal, fast, and focused
- Hidden files accessible but not cluttered
- Clean statusline with essential info only
- Consistent theming across terminal/editor
- Modular architecture for easy maintenance
