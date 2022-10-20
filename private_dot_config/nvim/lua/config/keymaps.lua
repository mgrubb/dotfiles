local vimp = require('vimp')

vim.g.mapleader = ','

-- nkeymap('<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>')
-- nkeymap('[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
-- nkeymap(']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
-- nkeymap('<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>')

vimp.map('<F1>', '<Esc>')
vimp.imap('<F1>', '<Esc>')
vimp.nnoremap({'silent'}, '<D-v>', '"*p')
vimp.inoremap({'silent'}, '<D-v>', '<C-r>*')
vimp.vnoremap({'silent'}, '<D-c>', '"*y')
vimp.nnoremap({'silent'}, '<F2>', ':NERDTreeToggle<CR>')
vimp.nnoremap({'silent'}, '<F9>', ':syntax sync fromstart <CR>')
vimp.nnoremap({'silent'}, '<leader>n', ':cnext<CR>')
vimp.nnoremap({'silent'}, '<leader>p', ':cprevious<CR>')
vimp.nnoremap({'silent'}, '<leader><Enter>', ':nohlsearch<CR>')
vimp.nnoremap({'silent'}, '<Right>', ':tabnext<CR>')
vimp.nnoremap({'silent'}, '<Left>', ':tabprevious<CR>')
-- add blank line below current line but stay here
vimp.nnoremap({'silent'}, '<leader>o', 'o<Esc>k')
-- add blank line above current line but stay here
vimp.nnoremap({'silent'}, '<leader>O', 'O<Esc>j')
-- Shows/hides hidden characters
vimp.nnoremap({'silent'}, '<leader><space>', ':set invlist<cr>')
-- Replace up(to next char
vimp.nnoremap('<leader>m', 'ct')
-- Use // to search for selected text
vimp.vnoremap('//', [[y/\V<C-R>=escape(@",'/\')<CR><CR>]])
