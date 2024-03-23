--leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "


--plugins
local betterescape = { 'jdhao/better-escape.vim' }
local vimsurround = { 'kylechui/nvim-surround', config = function() require('nvim-surround').setup({}) end }
local leap = { 'ggandor/leap.nvim', config = function() require('leap').create_default_mappings() end }
local improvedft = { 'backdround/improved-ft.nvim', config = function() require('improved-ft').setup({ use_default_mappings = true }) end }


local plugins =  {
  betterescape,
  vimsurround,
  leap,
  improvedft,
}


-- general remaps
vim.keymap.set('x', 'p', 'pgvy');


-- vscode remaps
local vscode = require('vscode-neovim')
vim.keymap.set('n', '<Leader>fw', function() require('vscode-neovim').action('workbench.action.findInFiles') end);
vim.keymap.set('n', '<Leader>ff', function() require('vscode-neovim').action('workbench.action.quickOpen') end);
vim.keymap.set('n', '<Leader>r', function() require('vscode-neovim').action('editor.action.rename') end);
vim.keymap.set('n', '<Leader>la', function() require('vscode-neovim').action('editor.action.quickFix') end);
vim.keymap.set('n', '<Leader>c', function() require('vscode-neovim').action('workbench.action.closeActiveEditor') end);
vim.keymap.set('n', '<Leader>gg', function() require('vscode-neovim').call('workbench.action.tasks.runTask', { args = { 'open_lazygit' } }) end);
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