local fn = vim.fn
local install_path = fn.stdpath('config')..'/pack/packer/start/packer.nvim'

-- Install from source
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd[[packadd packer.nvim]]
end

local packer = require('packer')
local util = require('packer.util')

-- Initialize with some variation to keep things in the same folder structure
packer.init({
  package_root = util.join_paths(vim.fn.stdpath('config'), 'pack'),
  plugin_package = 'plugins'
});

local use = packer.use

use {'/wbthomason/packer.nvim'}
use {'/github/copilot.vim'}
use {'navarasu/onedark.nvim',
  config = function () require 'rc.colorscheme' end
}
use 'tpope/vim-fugitive'
use {'tpope/vim-obsession'}
use 'junegunn/fzf.vim'
use {'~/code/better-digraphs.nvim',
  config = function() require 'plugins.better-digraphs-config' end,
  requires = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  }
}
use {
  'nvim-telescope/telescope.nvim',
  config = function() require 'plugins.telescope-config' end,
  requires={
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  },
}
use {
  'norcalli/nvim-colorizer.lua',
  opt = true,
  cmd = "ColorizerToggle",
  config = function ()
    require 'colorizer'.setup()
  end
}
use {'tpope/vim-rhubarb',
  config = function()
    vim.g.github_enterprise_urls = {'https://git.viasat.com'}
  end
}
use 'tpope/vim-dadbod'
use 'kristijanhusak/vim-dadbod-ui'
use {
  {"williamboman/mason.nvim",
    config = function() require("mason").setup() end
  },
  {"williamboman/mason-lspconfig.nvim",
    requires = 'williamboman/mason.nvim',
    config = function() require("mason-lspconfig").setup() end
  },
  {'neovim/nvim-lspconfig',
    requires = 'williamboman/mason-lspconfig.nvim',
    config = function() require 'plugins.lsp.init' end
  }
}
-- use {
--     'nvim-treesitter/nvim-treesitter',
--     config = function() require 'plugins.tree-sitter' end,
--     run = function()
--         local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
--         ts_update()
--     end,
-- }
use {
  "CopilotC-Nvim/CopilotChat.nvim",
  config = function()
    require("CopilotChat").setup({
      mappings = {
        complete = {
          insert = "<C-space>"
        }
      },
      window = {
        border = "rounded",
        width = 80,
        height = 20,
      },
    })
  end,
  requires = {
    { "github/copilot.vim" },
    { "nvim-lua/plenary.nvim", branch = "master" }
  },
  run = "make tiktoken"
}
