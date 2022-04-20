-- Load packer first
require 'plugin-config'

-- Plugins
vim.cmd 'source ~/.config/nvim/rc/plugins/picker.vim'
vim.cmd 'source ~/.config/nvim/rc/plugins/align.vim'
vim.cmd 'source ~/.config/nvim/rc/plugins/sneak.vim'
vim.cmd 'source ~/.config/nvim/rc/plugins/git-blame.vim'
vim.cmd 'source ~/.config/nvim/rc/plugins/better-digraphs.vim'
require 'plugins.lsp.init'
require 'plugins.tree-sitter'
require 'plugins.telescope-config'
--require 'plugins.nvim-compe'
--require 'plugins.lualine-config'
--require 'plugins.gitsigns-config'
--require 'plugins.neuron-config'
--require 'plugins.dadbod'

-- General configuration
vim.cmd 'source ~/.config/nvim/rc/display.vim'
vim.cmd 'source ~/.config/nvim/rc/viewcontrol.vim'
vim.cmd 'source ~/.config/nvim/rc/filetype/markdown.vim'
vim.cmd 'source ~/.config/nvim/rc/generalmapping.vim'
