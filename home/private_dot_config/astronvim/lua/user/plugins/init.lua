return {
  -- Colorscheme/theme
  ["EdenEast/nightfox.nvim"] = {
    config = function()
      require("nightfox").setup(require "user.plugins.nightfox")
    end,
  },
  ["wakatime/vim-wakatime"] = {
    -- opt = true,
    -- setup = function() table.insert(astronvim.file_plugins, "vim-wakatime") end,
  },
}
