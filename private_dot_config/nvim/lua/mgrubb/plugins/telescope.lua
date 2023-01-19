return {
	  'nvim-telescope/telescope.nvim', branch = '0.1.x',
	  dependencies = { {'nvim-lua/plenary.nvim'} },

    keys = {
      { '<leader>pf', nil },
      { '<leader>gf', nil },
      { '<leader>ps', nil },
      { '<leader>bl', nil },
    },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
      vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
      vim.keymap.set('n', '<leader>ps', builtin.grep_string, {})
      vim.keymap.set('n', '<leader>bl', builtin.buffers, {})
    end,
}
