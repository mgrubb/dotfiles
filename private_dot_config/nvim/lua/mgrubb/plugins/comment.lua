return {
  'numToStr/Comment.nvim',
  keys = {
    {"gcc", nil, {'n', 'v'} },
    {"gbc", nil, {'n', 'v'} },
    {"gbo", nil, {'n', 'v'} },
    {"gbO", nil, {'n', 'v'} },
    {"gbA", nil, {'n', 'v'} },
  },
  config = function()
    require('Comment').setup {
      ignore = [[^$]],
      pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      post_hook = require('ts_context_commentstring.integrations.comment_nvim').create_post_hook(),
    }
  end,
}
