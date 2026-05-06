return {
  recommended = function()
    return LazyVim.extras.wants({
      ft = { "gjs", "gts" },
      root = { "package.json" },
    })
  end,

  {
    "NullVoxPopuli/ember.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    lazy = false,
    config = function()
      require("ember.nvim").config()

      -- Workaround for ember.nvim bug: its on_new_config checks `info.isGlintPlugin`
      -- (a field that doesn't exist) so the @glint/tsserver-plugin location is never
      -- rewritten from the placeholder. Re-register ts_ls so that before_init resolves
      -- the real path from the project's node_modules.
      vim.lsp.config("ts_ls", {
        before_init = function(params, config)
          local root = params.rootPath
            or (params.rootUri and vim.uri_to_fname(params.rootUri))
          if not root then
            return
          end
          local plugin_path = root .. "/node_modules/@glint/tsserver-plugin"
          if vim.uv.fs_stat(plugin_path) then
            config.init_options = config.init_options or {}
            config.init_options.plugins = {
              {
                name = "@glint/tsserver-plugin",
                location = plugin_path,
                languages = {
                  "typescript",
                  "javascript",
                  "typescript.glimmer",
                  "javascript.glimmer",
                  "typescript.tsx",
                  "javascript.jsx",
                  "html.handlebars",
                  "handlebars",
                },
                enableForWorkspaceTypeScriptVersions = true,
                configNamespace = "typescript",
              },
            }
          end
        end,
      })
    end,
  },

  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = { "glint" },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["javascript.glimmer"] = { "prettier" },
        ["typescript.glimmer"] = { "prettier" },
      },
      formatters = {
        prettier = { require_cwd = true },
      },
    },
  },
}
