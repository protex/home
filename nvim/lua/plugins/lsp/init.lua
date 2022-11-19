local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', function() vim.diagnostic.open_float({border = "rounded"}) end, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

local default_on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', "<cmd> lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap("n", "<space>fo", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

local lsp_config = {
  default_config = {
    on_attach = default_on_attach,
    flags = {
      debounce_text_changes = 150
    }
  },
  servers = {
    lua = {
      server_name = 'sumneko_lua',
      settings = {
        Lua = {
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {'vim'},
          },
        }
      }
    },
    typescript = {
      server_name = 'tsserver'
    },
    json = {
      server_name = 'jsonls'
    },
    python_lsp = {
      server_name = 'pylsp',
    },
  }
}

local function get_server_config(config_name)
  local config = lsp_config.default_config
  if(lsp_config.servers[config_name] ~= nil) then
    config = vim.tbl_deep_extend("force", config, lsp_config.servers[config_name])
  end
  return config
end

-- Setup servers, will be auto installed by mason-lspconfig
for config_name, server_config in pairs(lsp_config.servers) do
  require('lspconfig')[server_config.server_name].setup(
    get_server_config(config_name)
  )
end

