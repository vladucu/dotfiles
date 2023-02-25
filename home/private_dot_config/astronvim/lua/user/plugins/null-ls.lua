return function(config)
  local null_ls = require "null-ls"

  config.sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.eslint_d,
    null_ls.builtins.formatting.rustfmt,
    null_ls.builtins.formatting.shfmt.with {
      args = { "-i", "2" },
    },

    null_ls.builtins.diagnostics.credo,
    null_ls.builtins.diagnostics.eslint_d,
    -- null_ls.builtins.diagnostics.mix,
    null_ls.builtins.diagnostics.luacheck,
    null_ls.builtins.diagnostics.flake8,
    null_ls.builtins.diagnostics.mypy,

    null_ls.builtins.code_actions.eslint_d,
  }

  return config
end
