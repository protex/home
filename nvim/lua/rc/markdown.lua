vim.api.nvim_create_user_command('ReplaceMarkdownHeaders', [[silent! %s/\\u\(\x\{4\}\)/\=nr2char("0x".submatch(1),1)/g<CR>]], {})
vim.api.nvim_create_user_command('ConvertUnicode', [[silent! %s/\\u\(\x\{4\}\)/\=nr2char('0x'.submatch(1),1)/g]], {})

vim.api.nvim_create_augroup('MarkdownGroup', {})
vim.api.nvim_create_autocmd('InsertLeave', {
  pattern = "*.md",
  command = ":ReplaceMarkdownHeaders"
})
vim.api.nvim_create_autocmd('FileType', {
  pattern = "markdown",
  callback = function()
    vim.api.nvim_set_option_value('formatlistpat', [[^\\s*\\d\\+[.\)]\\s\\+\\\|^\\s*[*+~-]\\s\\+\\\|^\\(\\\|[*#]\\)\\[^[^\\\]\]\\+\\]:\\s]], {scope="local"})
    vim.api.nvim_set_option_value('comments', [[]n:>]], {sope='local'})
    vim.api.nvim_set_option_value('formatoptions',
      vim.api.nvim_get_option_value('formatoptions', {scope='local'}).."cn",
      {sope='local'})
  end
})
vim.api.nvim_create_autocmd('InsertLeave', {
  pattern = "*.md",
  command = ":ConvertUnicode"
})
