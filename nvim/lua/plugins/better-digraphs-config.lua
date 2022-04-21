local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('i', '<C-k><C-k>', '<Cmd>lua require"betterdigraphs".digraphs("i")<CR>', opts)
vim.api.nvim_set_keymap('n', 'r<C-k><C-k>', '<Cmd>lua require"betterdigraphs".digraphs("r")<CR>', opts)
vim.api.nvim_set_keymap('v', 'r<C-k><C-k>', '<ESC><Cmd>lua require"betterdigraphs".digraphs("r")<CR>', opts)
