local M = {}

M.setup_lsp = function(attach, capabilities)
  local lspconfig = require "lspconfig"

  -- lspservers with default config
  local servers = { "html", "cssls", "ember"}

  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
       on_attach = attach,
       capabilities = capabilities,
       flags = {
          debounce_text_changes = 150,
       },
    }
  end

  lspconfig.elixirls.setup {
    on_attach = attach,
    capabilities = capabilities,
    cmd = { "/Users/vladucu/code/github.com/elixir-lsp/elixir-ls/rel/language_server.sh" },
    flags = {
      debounce_text_changes = 150,
    },
  }
end

return M
