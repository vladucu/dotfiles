return {

    {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {}
        end
    },

    {
        "jose-elias-alvarez/null-ls.nvim",
        after = "nvim-lspconfig",
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
            require("custom.plugins.null-ls").setup()
        end,
    },

    {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("custom.plugins.trouble").setup()
        end
    },

    {
        "Pocco81/TrueZen.nvim",
        cmd = {
            "TZAtaraxis",
            "TZMinimalist",
            "TZFocus",
        },
        config = function()
            require("custom.plugins.truezen")
        end,
    },
}