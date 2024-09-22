--leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--opts
vim.opt.clipboard = 'unnamedplus'

--plugins
local plugins =  {
  { 'jdhao/better-escape.vim' },
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.ai').setup();
      require('mini.comment').setup();
      require('mini.surround').setup({
        mappings = {
          add = "gsa", -- Add surrounding in Normal and Visual modes
          delete = "gsd", -- Delete surrounding
          find = "gsf", -- Find surrounding (to the right)
          find_left = "gsF", -- Find surrounding (to the left)
          highlight = "gsh", -- Highlight surrounding
          replace = "gsr", -- Replace surrounding
          update_n_lines = "gsn", -- Update `n_lines`
        },
      });
    end,
    version = false
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
};

-- general remaps
vim.keymap.set('x', 'p', 'pgvy');

-- vscode remaps
local vscode = require('vscode-neovim')
vim.keymap.set('n', '<Leader>fw', function() require('vscode-neovim').action('workbench.action.findInFiles') end);
vim.keymap.set('n', '<Leader>ff', function() require('vscode-neovim').action('workbench.action.quickOpen') end);
vim.keymap.set('n', '<Leader>r', function() require('vscode-neovim').action('editor.action.rename') end);
vim.keymap.set('n', '<Leader>ca', function() require('vscode-neovim').action('editor.action.quickFix') end);
vim.keymap.set('n', '<Leader>bc', function() require('vscode-neovim').action('workbench.action.closeActiveEditor') end);
vim.keymap.set('n', '<Leader>bo', function() require('vscode-neovim').action('workbench.action.closeOtherEditors') end);
vim.keymap.set('n', '<Leader>gg', function() require('vscode-neovim').action('lazygit.openLazygit') end);
vim.keymap.set('n', 'gr', function() require('vscode-neovim').action('references-view.findReferences') end);
vim.keymap.set('n', 'gr', function() require('vscode-neovim').action('editor.action.goToReferences') end);
vim.keymap.set('n', 'gi', function() require('vscode-neovim').action('editor.action.goToImplementation') end);


--lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup(plugins)