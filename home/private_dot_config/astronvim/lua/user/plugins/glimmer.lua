local utils = require "astronvim.utils"
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
      -- Add the "glimmer" language to opts.ensure_installed.
      utils.list_insert_unique(opts.ensure_installed, "glimmer")
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      -- Ensure that opts.ensure_installed exists and is a table
      if not opts.ensure_installed then opts.ensure_installed = {} end
      -- Add ember & glint lsp to ensure_installed
      utils.list_insert_unique(opts.ensure_installed, { "ember", "glint" })
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      -- Ensure that opts.ensure_installed exists and is a table
      if not opts.ensure_installed then opts.ensure_installed = {} end
      -- Add eslint_d to ensure_installed
      utils.list_insert_unique(opts.ensure_installed, { "eslint_d", "prettier" })
    end,
  },
  -- {
  --   "jay-babu/mason-nvim-dap.nvim",
  --   opts = function(_, opts)
  --     -- Ensure that opts.ensure_installed exists and is a table
  --     if not opts.ensure_installed then opts.ensure_installed = {} end
  --     -- Add chrome dap adapter
  --     -- utils.list_insert_unique(opts.ensure_installed, "chrome")
  --   end,
  -- },
}
