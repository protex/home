let g:picker_selector_executable = 'fzf'
let g:picker_selector_flags = ''

let g:picker_custom_find_executable = 'fd'
let g:picker_custom_find_flags = '-I --color=never -H -E ".git"'
vnoremap <leader>64 c<c-r>=system('base64 --decode', @")<cr><esc>


function! PickerRgLineHandler(selection) abort
    let parts = split(a:selection, ':')
    return {'filename': parts[0], 'line': parts[1], 'column': parts[2]}
endfunction

command! -nargs=? PickerRg
    \ call picker#File('rg --color never --line-number --column '.shellescape(<q-args>), "edit", {'line_handler': 'PickerRgLineHandler'})

function! ListBuffers()
    redir @n
    silent exec 'ls'
    redir END

    let list = substitute(@n, '.\{-}"\(.\{-}\)".\{-}[0-9]', '\=join([submatch(1), "\n"], "")', "g")
    return list
endfunction


function! ConvertJournal()
      let @q='gg/^# [0-9]*\.
      normal @q
endfunction

command! ConvertJournal call ConvertJournal()

command! ListBuffers echo ListBuffers()

command! -nargs=? PickerDrop call picker#File(
      \ join([
      \   "{",
      \   join(["echo", join(['"', ListBuffers(), '";'], "")], " "),
      \   join([g:picker_custom_find_executable, g:picker_custom_find_flags], ' '),
      \   "}", "| awk '!x[$0]++'"
      \ ], " "),
      \ "drop")

nmap <C-l><C-e> <Plug>(PickerEdit)
nmap <C-l><C-s> <Plug>(PickerSplit)
nmap <C-l><C-t> <Plug>(PickerTabedit)
nmap <C-l><C-v> <Plug>(PickerVsplit)
nmap <C-l><C-b> :PickerDrop<CR>
nmap <C-l><C-]> <Plug>(PickerTag)
nmap <C-l><C-w> <Plug>(PickerStag)
nmap <C-l><C-o> <Plug>(PickerBufferTag)
nmap <C-l><C-h> <Plug>(PickerHelp)
nmap <C-l><C-r> :PickerRg<CR>