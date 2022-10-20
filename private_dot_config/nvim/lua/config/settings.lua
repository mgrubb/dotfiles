local o = vim.opt
local g = vim.g

-- Editing prefs
o.splitright = true
o.splitbelow = true
o.shiftwidth = 2
o.tabstop = 2
o.expandtab = true
o.autoindent = true
o.smarttab = true
o.wrap = false
o.termguicolors = true

-- Appearance
--vim.cmd [[colorscheme base16-outrun-dark]]

-- Plugin specific stuff
vim.g.NERDTreeIgnore = {'node_modules', 'vendor'}

