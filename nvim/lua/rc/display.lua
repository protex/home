vim.cmd [[highlight ColorColumn ctermbg=0 guibg=maroon]]
vim.cmd [[colorscheme onedark]]
vim.cmd [[syntax on]]

vim.o.number = true
vim.o.relativenumber = true
vim.o.list = true
vim.o.listchars = 'tab:▸◇,trail:·'
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.softtabstop = 2

local enable_relative_number_toggle = function()
  vim.api.nvim_create_augroup('numbertoggle', {clear=true})

  local set_relative_number = function(enabled)
    return function()
      vim.o.relativenumber = enabled
    end
  end

  vim.api.nvim_create_autocmd({'InsertEnter'}, {
    group = 'numbertoggle',
    pattern = '*',
    callback = set_relative_number(false)
  })
  vim.api.nvim_create_autocmd({'InsertLeave'}, {
    group = 'numbertoggle',
    pattern = '*',
    callback = set_relative_number(true)
  })
end
enable_relative_number_toggle()



