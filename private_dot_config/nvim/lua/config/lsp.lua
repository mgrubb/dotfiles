 local on_attach = function(_, bufnr)
   local vimp = require('vimp')
   vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

   vimp.add_buffer_maps(bufnr, function()
     vimp.nnoremap('gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
     vimp.nnoremap('gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
     vimp.nnoremap('K', '<cmd>lua vim.lsp.buf.hover()<CR>')
     vimp.nnoremap('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
     vimp.nnoremap({'silent'}, 'g?', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
     --vimp.nnoremap({'silent'}, 'g?', '<cmd>lua vim.diagnostic.get()<CR>')
     vimp.nnoremap('<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
     vimp.nnoremap('<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
     vimp.nnoremap('<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
     vimp.nnoremap('<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders())))<CR>')
     vimp.nnoremap('<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
     vimp.nnoremap('<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
     vimp.nnoremap('<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
     vimp.nnoremap('gr', '<cmd>lua vim.lsp.buf.references()<CR>')
     vimp.nnoremap('<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
   end)
   --bnkeymap(bufnr, 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
   --bnkeymap(bufnr, 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
   --bnkeymap(bufnr, 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
   --bnkeymap(bufnr, 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
   --bnkeymap(bufnr, '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
   --bnkeymap(bufnr, '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
   --bnkeymap(bufnr, '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
   --bnkeymap(bufnr, '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders())))<CR>')
   --bnkeymap(bufnr, '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
   --bnkeymap(bufnr, '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
   --bnkeymap(bufnr, '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
   --bnkeymap(bufnr, 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
   --bnkeymap(bufnr, '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
 end

local lsp_servers = { 'gopls', 'sumneko_lua', 'pylsp', 'texlab' }

-- Setup Autocomplete capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lsp_settings = {}
lsp_settings['sumneko_lua'] = {
  Lua = {
    runtime = {
      version = 'LuaJIT',
    },
    diagnostics = {
      -- get the LS to recognize the `vim` global
      globals = {'vim'},
    },
    workspace = {
      -- make the server aware of Neovim runtime files
      library = vim.api.nvim_get_runtime_file("", true),
    },
    -- Do not send telemetry data
    telemetry = {
      enable = false,
    },
  }
}

lsp_settings['texlab'] = {
  texlab = {
  auxDirectory = './aux',
  bibtexFormatter = 'texlab',
  build = {
    args = {'-X', 'compile', '%f', '--synctex', '--keep-logs', '--keep-intermediates'},
    executable = 'tectonic',
  },
  formatterLineLength = 80,
  latexFormatter = "latexindent",
  latexindent = {
    modifyLineBreaks = false,
  },
  },
}

for _, lsp in pairs(lsp_servers) do
  require('lspconfig')[lsp].setup {
    capabilities = capabilities,
    settings = lsp_settings[lsp],
    on_attach = on_attach,
  }
end
