local M = {}

local present, null_ls = pcall(require, "null-ls")
if not present then
  return M
end

local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

M.sources = {
  -- Elixir
  diagnostics.credo,
  -- formatting.mix,

  -- Javascript
  code_actions.eslint,
  diagnostics.eslint,
  formatting.eslint,
  formatting.prettier.with { filetypes = { "html", "markdown", "css", "javascript", "glimmer", "handlebars" } },
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
