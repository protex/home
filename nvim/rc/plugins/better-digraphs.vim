inoremap <C-k><C-k> <Cmd>lua require'betterdigraphs'.digraphs("i")<CR>
nnoremap r<C-k><C-k> <Cmd>lua require'betterdigraphs'.digraphs("r")<CR>
vnoremap r<C-k><C-k> <ESC><Cmd>lua require'betterdigraphs'.digraphs("gvr")<CR>

