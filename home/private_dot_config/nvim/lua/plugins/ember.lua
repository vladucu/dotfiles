return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "glimmer",
        "glimmer_javascript",
        "glimmer_typescript",
      })
    end,
  },

  {
    "conform.nvim",
    opts = function(_, opts)
      if LazyVim.has_extra "formatting.prettier" then
        opts.formatters_by_ft = opts.formatters_by_ft or {}
        opts.formatters_by_ft["javascript.glimmer"] = { "prettier" }
        opts.formatters_by_ft["typescript.glimmer"] = { "prettier" }
      end
    end,
  },

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
