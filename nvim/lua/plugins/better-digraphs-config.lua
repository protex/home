local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('i', '<C-k><C-k>', '<Cmd>lua require"better-digraphs".digraphs("i")<CR>', opts)
vim.api.nvim_set_keymap('n', 'r<C-k><C-k>', '<Cmd>lua require"better-digraphs".digraphs("r")<CR>', opts)
vim.api.nvim_set_keymap('v', 'r<C-k><C-k>', '<ESC><Cmd>lua require"better-digraphs".digraphs("gvr")<CR>', opts)
