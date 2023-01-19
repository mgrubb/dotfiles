return {
  'nvim-orgmode/orgmode',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  keys = {
    { '<leader>oa', nil },
    { '<leader>oc', nil },
  },
  config = function()
    local orgmode = require('orgmode')
    orgmode.setup_ts_grammar()

    orgmode.setup {
      org_agenda_files = {'~/Dropbox/org/*'},
      org_default_notes_file = '~/Dropbox/org/brain.org',
      org_capture_templates = {
        r = {
          description = "Repo",
          template = "* [[%x][%(return string.match('%x', '([^/]+)$'))]]%?",
          target = "~/Dropbox/org/repos.org"
        }
      },
    }
  end,
}
