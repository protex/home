local plugins = {
  default = {
    {'navarasu/onedark.nvim',
      config = function() require 'rc.colorscheme' end},
    'tpope/vim-fugitive',
    {'tpope/vim-obsession'},
    {'neovim/nvim-lspconfig',
      config = function() require 'plugins.lsp.init' end},
    'junegunn/fzf.vim',
    {'~/code/better-digraphs.nvim',
      config = function() require 'plugins.better-digraphs-config' end},
    '~/code/home-manager.nvim',
    {'~/code/bodadui.nvim',
      requires = {
        'nvim-lua/plenary.nvim'
      },
      config = function() require 'plugins.bodadui-config' end},
    {
      'nvim-telescope/telescope.nvim',
      requires={
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
      },
      config = function() require 'plugins.telescope-config' end
    },
    {
      'williamboman/mason.nvim'
      requires = {
        "williamboman/mason-lspconfig.nvim"
      }
    }
  },
  dadbod = {
    {'tpope/vim-dadbod'},
    {'kristijanhusak/vim-dadbod-ui'}
  }
}
local function useConfig(use, configName)
  for name, config in pairs(plugins) do
    for _,plugin in pairs(config) do
      if type(plugin) == 'string' then
        plugin = {plugin}
      end
      plugin.opt = true
      plugin.cond = function() return true end
      if name ~= configName then
        plugin.config = nil
        plugin.cond = nil
      end
      vim.pretty_print(plugin)
      use(plugin)
    end
  end
end
return useConfig
