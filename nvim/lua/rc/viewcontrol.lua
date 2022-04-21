vim.o.splitright = true

-- Window controls
vim.keymap.set('n', '<C-w><C-d>', '<Cmd>close<CR>')
vim.keymap.set('n', '<C-w><C-v>', '<Cmd>vnew<CR>')
vim.keymap.set('n', '<C-w><C-n>', '<Cmd>new<CR>')

-- Buffer controls
vim.keymap.set('n', '<C-b><C-l>', '<Cmd>bn<CR>')
vim.keymap.set('n', '<C-b><C-h>', '<Cmd>bp<CR>')
vim.keymap.set('n', '<C-b><C-d>', [[<Cmd>bp\|bd #<CR>]])

-- Tab controls
vim.keymap.set('n', '<C-t><C-l>', '<Cmd>tabn<CR>')
vim.keymap.set('n', '<C-t><C-h>', '<Cmd>tabp<CR>')
vim.keymap.set('n', '<C-t><C-d>', '<Cmd>tabclose<CR>')
vim.keymap.set('n', '<C-t><C-n>', '<Cmd>tabe<CR>')
