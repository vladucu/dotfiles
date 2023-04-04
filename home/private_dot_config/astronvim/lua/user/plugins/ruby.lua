local utils = require "astrocommunity.utils"
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Ensure that opts.ensure_installed exists and is a table or string "all".
      if not opts.ensure_installed then
        opts.ensure_installed = {}
      elseif opts.ensure_installed == "all" then
        return
      end
      -- Add the "ruby" language to opts.ensure_installed.
      utils.list_insert_unique(opts.ensure_installed, "ruby")
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      -- Ensure that opts.ensure_installed exists and is a table
      if not opts.ensure_installed then opts.ensure_installed = {} end
      -- Add standardrb lsp to ensure_installed
      utils.list_insert_unique(opts.ensure_installed, "standardrb")
      -- utils.list_insert_unique(opts.ensure_installed, { "sorbet", "ruby_ls", "standardrb" })
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      -- Ensure that opts.ensure_installed exists and is a table
      if not opts.ensure_installed then opts.ensure_installed = {} end
      -- Add standardrb to ensure_installed
      utils.list_insert_unique(opts.ensure_installed, "standardrb")
    end,
  },
}
