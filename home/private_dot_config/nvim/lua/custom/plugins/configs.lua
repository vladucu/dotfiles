local M = {}

M.treesitter = {
   ensure_installed = {
      "bash",
      "css",
      "dockerfile",
      "eex",
      "elixir",
      "glimmer",
      "heex",
      "html",
      "javascript",
      "json",
      "json5",
      "lua",
      "make",
      "markdown",
      "ruby",
      "rust",
      "surface",
      "toml",
      "tsx",
      "typescript",
      "yaml",
   },
}

M.nvimtree = {
   git = {
      enable = true,
   },
}

return M