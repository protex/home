-- Load packer first
require 'plugin-config'

-- Plugins
require 'plugins.lsp.init'
require 'plugins.tree-sitter'
require 'plugins.telescope-config'
require 'plugins.better-digraphs-config'
--require 'plugins.nvim-compe'
--require 'plugins.lualine-config'
--require 'plugins.gitsigns-config'
--require 'plugins.neuron-config'
--require 'plugins.dadbod'

-- General configuration
require 'rc.display'
require 'rc.viewcontrol'
require 'rc.markdown'
require 'rc.generalmapping'
