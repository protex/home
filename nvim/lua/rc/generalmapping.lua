vim.keymap.set('i', '<C-e>', '<C-o>$')
vim.keymap.set('i', '<C-a>', '<C-o>0')
vim.keymap.set('', '<Space>', '<leader>')
vim.keymap.set('', '<Space><Space>', '<leader><leader>')

vim.api.nvim_create_user_command('Resource', "source ~/.config/nvim/init.lua", {})
-- Cause I keep mashing by accidednt
vim.api.nvim_create_user_command('REsource', "source ~/.config/nvim/init.lua", {})

vim.keymap.set('t', '<C-[>', [[<C-\><C-n>]])
vim.keymap.set('t', '<C-v><Esc>', '<Esc>')
