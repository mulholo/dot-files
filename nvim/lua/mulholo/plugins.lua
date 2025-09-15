-- Automatically install packer
local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
-- Like `local packer = require("packer")` but safe
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "single" }
    end,
  },
}

-- Install plugins
return packer.startup(function(use)
  use "wbthomason/packer.nvim"              -- Have packer manage itself
  use 'tpope/vim-sensible'                  -- sensible config defaults
  use "nvim-lua/plenary.nvim"               -- Useful lua functions used by lots of plugins
  use 'nvim-telescope/telescope.nvim'       -- (Fuzzy) finder
  use 'tpope/vim-surround'                  -- Select surrounding (, <tag>, ' etc.
  use 'tpope/vim-repeat'                    -- Extend .'s behaviour
  use 'lifepillar/vim-solarized8'           -- Solarized theme
  use 'vim-airline/vim-airline'             -- Airline
  use 'vim-airline/vim-airline-themes'      -- Airline themes
  use 'edkolev/tmuxline.vim'                -- Airline look for TMUX
  use "nvim-lua/popup.nvim"                 -- An implementation of the Popup API from vim in Neovim
  use 'kyazdani42/nvim-tree.lua'            -- Better file explorer
  use 'lewis6991/gitsigns.nvim'             -- Git status in gutter
  use 'tpope/vim-fugitive'                  -- Git integration (needed for airline branch display)

  -- Completion
  use "hrsh7th/nvim-cmp"                    -- Completion
  use "hrsh7th/cmp-buffer"                  -- Buffer Completion
  use "hrsh7th/cmp-path"                    -- Path Completion
  use "hrsh7th/cmp-cmdline"                 -- Commandline Completion
  use "hrsh7th/cmp-nvim-lsp"                -- LSP completion (see LSP config below)

  -- GitHub Copilot
  use {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  }
  use {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function ()
      require("copilot_cmp").setup()
    end
  }

  -- Motions and text objects
  use 'michaeljsmith/vim-indent-object'     -- Text object for lines: ai -> and line above; ii -> no line above; aI -> line above and line below
  use 'tpope/vim-commentary'                -- Comment motion e.g. gcip to comment a paragraph
  use 'vim-scripts/ReplaceWithRegister'     -- Replace motion e.g. `gre` to replace to end of word with current buffer
  use 'christoomey/vim-sort-motion'         -- Sort motion
  use 'kana/vim-textobj-user'               -- Enable other text object plugins
  use 'Julian/vim-textobj-variable-segment' -- Add text object for parts of camel and snake-case variables e.g. foo_ba|r_baz -> civquux -> foo_quux_baz

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
