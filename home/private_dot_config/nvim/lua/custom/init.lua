-- Sources
-- https://github.com/nanotee/nvim-lua-guide
-- https://github.com/rockerBOO/awesome-neovim
-- https://github.com/siduck/dotfiles/tree/master/nvchad/custom

-- GUI
vim.api.nvim_exec([[set guifont=Hack\ Nerd\ Font:h13]], false)

require("custom.mappings")
