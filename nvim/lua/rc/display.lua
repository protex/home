local set_relative_number_factory = function(enabled)
  return function()
    vim.o.relativenumber = enabled
  end
end
local set_relative_number = function(enabled)
  vim.o.relativenumber = enabled
end

local enable_relative_number_toggle = function()
  set_relative_number(true)
  vim.api.nvim_create_augroup('NumberToggle', {clear=true})

  vim.api.nvim_create_autocmd({'InsertEnter'}, {
    group = 'NumberToggle',
    pattern = '*',
    callback = set_relative_number_factory(false)
  })
  vim.api.nvim_create_autocmd({'InsertLeave'}, {
    group = 'NumberToggle',
    pattern = '*',
    callback = set_relative_number_factory(true)
  })
end

local disable_relative_number_toggle = function()
  set_relative_number(false)
  vim.api.nvim_clear_autocmds({group='NumberToggle'})
end

local relative_number_enabled = true
vim.api.nvim_create_user_command('ToggleRelativeNumber', function()
  if relative_number_enabled then
    disable_relative_number_toggle()
    relative_number_enabled = false
  else
    enable_relative_number_toggle()
    relative_number_enabled = true
  end
end, {})

-- Defaults
enable_relative_number_toggle()

vim.cmd [[highlight ColorColumn ctermbg=0 guibg=maroon]]
vim.cmd [[syntax on]]

vim.o.number = true
vim.o.list = true
vim.o.listchars = 'tab:▸◇,trail:·'
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.softtabstop = 2
vim.o.wrap = 0
