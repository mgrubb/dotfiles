return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      local lineWiseRX = vim.regex([[^[@]\(function\|class\)\.inner$]])
      require 'nvim-treesitter.configs'.setup {
        ensure_installed = { 'help', 'javascript', 'typescript', 'org', 'c', 'lua', 'fennel', 'go', 'bash', 'python' },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = { 'org' },
        },
        rainbow = {
          enable = true,
          max_file_lines = nil,
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ['af'] = { query = '@function.outer', desc = 'Select outer function' },
              ['if'] = { query = '@function.inner', desc = 'Select inner function' },
              ['ac'] = { query = '@class.outer', desc = 'Select outer class' },
              ['ic'] = { query = '@class.inner', desc = 'Select inner class' },
              ['aP'] = { query = '@parameter.outer', desc = 'Select outer parameter' },
              ['iP'] = { query = '@parameter.inner', desc = 'Select inner parameter' },
            },
            selection_modes = function(obj)
              if lineWiseRX:match_str(obj.query_string) then
                return 'V'
              end
              return 'v'
            end,
            include_surrounding_whitespace = true,
          },
          swap = {
            enable = true,
            swap_next = {
              ['<leader>a'] = '@parameter.inner',
            },
            swap_previous = {
              ['<leader>A'] = '@parameter.inner',
            },
          },
        },
        matchup = {
          enable = true,
        },
      }
    end,
  },
  { 'nvim-treesitter/nvim-treesitter-textobjects' },
  { 'JoosepAlviste/nvim-ts-context-commentstring' },
}
