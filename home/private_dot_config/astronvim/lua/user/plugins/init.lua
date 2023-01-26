return {
  -- Colorscheme/theme
  ["EdenEast/nightfox.nvim"] = {
    config = function()
      require("nightfox").setup(require "user.plugins.nightfox")
    end,
  },
  ["folke/zen-mode.nvim"] = {
    cmd = { "ZenMode" },
    config = function() require("user.plugins.zen-mode").config() end,
  },
  ["wakatime/vim-wakatime"] = {
    -- opt = true,
    -- setup = function() table.insert(astronvim.file_plugins, "vim-wakatime") end,
  },
}
