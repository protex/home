highlight ColorColumn ctermbg=0 guibg=maroon
colorscheme onedark
augroup test2
  au!
  au BufEnter * call matchadd('ColorColumn', '\%81v', 100)
augroup END

syntax on
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd InsertEnter * :set norelativenumber
  autocmd InsertLeave * :set relativenumber
augroup END
set t_Co=256
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
end
let g:terminal_color_8 = "#56637c"
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight Normal guibg=none
highlight NonText guibg=none
set list
set listchars=tab:▸◇,trail:·
set nowrap

let g:netrw_preview   = 1
let g:netrw_liststyle = 3
let g:netrw_winsize   = 20
let g:netrw_browse_split = 0

" show existing tab with 2 spaces width
set tabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces
set expandtab
set softtabstop=2
