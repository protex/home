command! ReplaceMarkdownHeaders :silent! %s/^\.h\([0-9]\)/\=repeat('#', submatch(1))
command! ConvertUnicode :silent! %s/\\u\(\x\{4\}\)/\=nr2char('0x'.submatch(1),1)/g
augroup test
  au!
  au InsertLeave *.md :ReplaceMarkdownHeaders
  au FileType markdown setlocal formatlistpat=^\\s*\\d\\+[.\)]\\s\\+\\\|^\\s*[*+~-]\\s\\+\\\|^\\(\\\|[*#]\\)\\[^[^\\]]\\+\\]:\\s | setlocal comments=n:> | setlocal formatoptions+=cn
  au InsertLeave *.md :ConvertUnicode
augroup END

let g:vim_markdown_auto_insert_bullets=0
let g:vim_markdown_new_list_item_indent=0
