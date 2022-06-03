local M = {}

local present, null_ls = pcall(require, "null-ls")
if not present then
  return M
end

-- local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

M.sources = {
  -- Elixir
  diagnostics.credo,
  -- formatting.mix,
}

M.on_attach = function(client)
  -- Format on save
  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_create_autocmd("BufWritePre", {
      desc = "Auto format before save",
      pattern = "<buffer>",
      callback = function()
        vim.lsp.buf.formatting_sync()
      end
    })
  end
end

return M
