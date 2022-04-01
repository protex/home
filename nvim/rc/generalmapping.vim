inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>0
map <Space> <leader>
map <Space><Space> <leader><leader>
" Re-source this file
command! Resource :source ~/.config/nvim/init.lua
" 'Cause I keep accidentilly doing this
command! REsource :Resource
tnoremap <C-[> <C-\><C-n>
tnoremap <C-v><Esc> <Esc>
" Ctag settings
set tags=tags
au BufWritePost *.c,*.C,*.cpp,*.h silent! !ctags -R .&
