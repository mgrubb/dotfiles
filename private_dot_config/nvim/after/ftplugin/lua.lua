local rx = vim.regex('^' .. vim.fn.stdpath('config'))
if rx:match_str(vim.fn.expand('%:p')) then
  vim.cmd.iabbrev('vks', 'vim.keymap.set')
  vim.keymap.set('n', '<leader>ps', ':w<CR>:so<CR>:PackerSync<CR>')
end
