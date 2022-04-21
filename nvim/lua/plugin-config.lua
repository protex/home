local fn = vim.fn
local install_path = fn.stdpath('config')..'/pack/packer/start/packer.nvim'

-- Install from source
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd[[packadd packer.nvim]]
end

local packer = require('packer')
local util = require('packer.util')
local use = packer.use

-- Initialize with some variation to keep things in the same folder structure
packer.init({
  package_root = util.join_paths(vim.fn.stdpath('config'), 'pack'),
  plugin_package = 'plugins'
});

use 'tpope/vim-fugitive'
use 'navarasu/onedark.nvim'
use 'nvim-treesitter/nvim-treesitter'
use 'tpope/vim-obsession'
use 'neovim/nvim-lspconfig'
use 'williamboman/nvim-lsp-installer'
use 'junegunn/fzf.vim'
use 'tpope/vim-obsessionm'
use {
  'nvim-telescope/telescope.nvim',
  requires={
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  }
}
