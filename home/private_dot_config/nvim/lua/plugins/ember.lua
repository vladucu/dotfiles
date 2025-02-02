return {
  recommended = function()
    return LazyVim.extras.wants({
      ft = { "gjs", "gts" },
      root = { "package.json" },
    })
  end,

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "glimmer",
        "glimmer_javascript",
        "glimmer_typescript",
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      ft_parsers = {
        ["javascript.glimmer"] = "glimmer",
        ["typescript.glimmer"] = "glimmer",
      },

      formatters_by_ft = {
        ["javascript.glimmer"] = { "prettier" },
        ["typescript.glimmer"] = { "prettier" },
      },
    },
  },

  -- {
  --   "stevearc/conform.nvim",
  --   optional = true,
  --   ---@param opts ConformOpts
  --   opts = function(_, opts)
  --     opts.formatters_by_ft = opts.formatters_by_ft or {}
  --     for _, ft in ipairs(supported) do
  --       opts.formatters_by_ft[ft] = opts.formatters_by_ft[ft] or {}
  --       table.insert(opts.formatters_by_ft[ft], "prettier")
  --     end
  --
  --     opts.formatters = opts.formatters or {}
  --     opts.formatters.prettier = {
  --       condition = function(_, ctx)
  --         return M.has_parser(ctx) and (vim.g.lazyvim_prettier_needs_config ~= true or M.has_config(ctx))
  --       end,
  --     }
  --   end,
  -- },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ember = {},
        glint = {},
      },
    },
  },
}
