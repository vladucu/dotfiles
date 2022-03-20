local M = {}

local userPlugins = require "custom.plugins" -- path to table
local pluginConfs = require "custom.plugins.configs"

---- UI -----

M.ui = {
   theme = "onedark",
}

---- PLUGIN OPTIONS ----

M.plugins = {
   status = {
      alpha = true,
      colorizer = true,
   },

   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },
   },

   default_plugin_config_replace = {
      nvim_treesitter = pluginConfs.treesitter,
      nvim_tree = pluginConfs.nvimtree,
   },

   install = userPlugins
}

return M
