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
    -- Annotation generator
    ["danymat/neogen"] = {
        requires = "nvim-treesitter/nvim-treesitter",
        module = "neogen",
        cmd = "Neogen",
        config = function() require "user.plugins.neogen" end,
    },
    ["simrat39/rust-tools.nvim"] = {
        after = "mason-lspconfig.nvim", -- make sure to load after mason-lspconfig
        config = function() require("rust-tools").setup(require "user.plugins.rust-tools") end,
    },
    ["wakatime/vim-wakatime"] = {
        opt = true,
        setup = function() table.insert(astronvim.file_plugins, "vim-wakatime") end,
    },
    -- Navigate around your document
    -- Move / Swap elements around
    ["ziontee113/syntax-tree-surfer"] = { module = "syntax-tree-surfer" },
    -- Better motions
    -- TODO shortcuts conflict with syntax-tree-surfer
    -- ["ggandor/leap.nvim"] = {
    --     module = "leap.nvim",
    --     setup = function() table.insert(astronvim.file_plugins, "leap.nvim") end,
    --     config = function() require("leap").add_default_mappings() end,
    -- },
    ["lvimuser/lsp-inlayhints.nvim"] = {
        module = "lsp-inlayhints",
        config = function() require("lsp-inlayhints").setup() end,
    },
}
