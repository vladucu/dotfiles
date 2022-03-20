local present, null_ls = pcall(require, "null-ls")
if not present then
   return
end

local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

local sources = {
   code_actions.eslint,
   diagnostics.eslint,
   formatting.eslint,
   -- formatting.prettier.with { filetypes = { "html", "markdown", "css", "javascript", "glimmer", "handlebars" } },

   -- Lua
   diagnostics.luacheck.with { extra_args = { "--global vim" } },
   formatting.stylua,

   -- Elixir
   diagnostics.credo,
   -- formatting.mix,
   formatting.surface,

   -- Rust
   formatting.rustfmt,

   -- Shell
   -- formatting.shfmt,
   -- diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },
}

local M = {}

M.setup = function()
   null_ls.setup {
      debug = true,
      sources = sources,
   }
end

return M