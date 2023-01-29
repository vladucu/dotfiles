return {
  -- Colorscheme/theme
  ["EdenEast/nightfox.nvim"] = {
    module = "nightfox",
    config = function() require("nightfox").setup(require "user.plugins.nightfox") end,
  },
  ["folke/zen-mode.nvim"] = {
    cmd = { "ZenMode" },
    config = function() require("user.plugins.zen-mode").config() end,
  },
  ["simrat39/rust-tools.nvim"] = {
    after = "mason-lspconfig.nvim", -- make sure to load after mason-lspconfig
    config = function() require("rust-tools").setup(require "user.plugins.rust-tools") end,
  },
  ["wakatime/vim-wakatime"] = {
    -- opt = true,
    -- setup = function() table.insert(astronvim.file_plugins, "vim-wakatime") end,
  },
}
