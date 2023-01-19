return {
  'VonHeikemen/lsp-zero.nvim',
  dependencies = {
    -- LSP Support
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },

    -- Autocompletion
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lua' },

    -- Snippets
    { 'L3MON4D3/LuaSnip' },
    { 'rafamadriz/friendly-snippets' },
  },
  config = function()
    local lsp = require('lsp-zero')

    lsp.preset('recommended')

    lsp.ensure_installed({
      'tsserver',
      'eslint',
      'sumneko_lua',
      'gopls',
    })

    lsp.configure('sumneko_lua', {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' }
          }
        }
      }
    })

    lsp.set_preferences({
      suggest_lsp_servers = true,
      sign_icons = {
        error = 'E',
        warn  = 'W',
        hint  = 'H',
        info  = 'I',
      }
    })

    lsp.on_attach(function(client, bufnr)
      local opts = { buffer = bufnr, remap = false }
      if client.name == 'eslint' then
        vim.cmd.LspStop('eslint')
        return
      end

      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', '<leader>vws', vim.lsp.buf.workspace_symbol, opts)
      vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, opts)
      vim.keymap.set('n', '[d', vim.diagnostic.goto_next, opts)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, opts)
      vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, opts)
      vim.keymap.set('n', '<leader>vrr', vim.lsp.buf.references, opts)
      vim.keymap.set('n', '<leader>vrn', vim.lsp.buf.rename, opts)
      vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)
    end)

    local cmp_sources = lsp.defaults.cmp_sources()
    table.insert(cmp_sources, { name = 'orgmode' })

    lsp.setup_nvim_cmp({
      sources = cmp_sources
    })

    lsp.setup()

    vim.diagnostic.config({
      virtual_text = true,
    })
  end,
}
