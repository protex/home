set splitright

" Window controls
nnoremap <C-w><C-c> :close<CR>
nnoremap <C-w><C-v> :vnew<CR>
nnoremap <C-w><C-s> :new<CR>
" Buffer move remaps
nmap <C-b><C-l> :bn<CR>
nmap <C-b><C-h> :bp<CR>
nmap <C-b><C-c> :bd<CR>


" Close buffer without losing split
nmap <C-b><C-c> :bp\|bd #<CR>

nmap <C-t><C-l> :tabn<CR>
nmap <C-t><C-h> :tabp<CR>
nmap <C-t><C-c> :tabclose<CR>
nmap <C-t><C-n> :tabe<CR>
