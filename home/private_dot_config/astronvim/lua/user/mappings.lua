-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
        -- normal mode mappings
        n = {
                -- second key is the lefthand side of the map
                -- mappings seen under group name "Buffer"
                ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
                ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
                ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
                ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },

                -- Treesitter Surfer
                ["<C-down>"] = {
                        function()
                                require("syntax-tree-surfer").move("n", false)
                        end,
                        desc = "Swap next tree-sitter object",
                },
                ["<C-right>"] = {
                        function()
                                require("syntax-tree-surfer").move("n", false)
                        end,
                        desc = "Swap next tree-sitter object",
                },
                ["<C-up>"] = {
                        function()
                                require("syntax-tree-surfer").move("n", true)
                        end,
                        desc = "Swap previous tree-sitter object",
                },
                ["<C-left>"] = {
                        function()
                                require("syntax-tree-surfer").move("n", true)
                        end,
                        desc = "Swap previous tree-sitter object",
                },
        },
        -- terminal mappings
        t = {
                -- setting a mapping to false will disable it
                -- ["<esc>"] = false,
        },
        x = {
                -- Tressitter Surfer
                ["J"] = {
                        function()
                                require("syntax-tree-surfer").surf("next", "visual")
                        end,
                        desc = "Surf next tree-sitter object",
                },
                ["K"] = {
                        function()
                                require("syntax-tree-surfer").surf("prev", "visual")
                        end,
                        desc = "Surf previous tree-sitter object",
                },
                ["H"] = {
                        function()
                                require("syntax-tree-surfer").surf("parent", "visual")
                        end,
                        desc = "Surf parent tree-sitter object",
                },
                ["L"] = {
                        function()
                                require("syntax-tree-surfer").surf("child", "visual")
                        end,
                        desc = "Surf child tree-sitter object",
                },
                ["<C-j>"] = {
                        function()
                                require("syntax-tree-surfer").surf("next", "visual", true)
                        end,
                        desc = "Surf next tree-sitter object",
                },
                ["<C-l>"] = {
                        function()
                                require("syntax-tree-surfer").surf("next", "visual", true)
                        end,
                        desc = "Surf next tree-sitter object",
                },
                ["<C-k>"] = {
                        function()
                                require("syntax-tree-surfer").surf("prev", "visual", true)
                        end,
                        desc = "Surf previous tree-sitter object",
                },
                ["<C-h>"] = {
                        function()
                                require("syntax-tree-surfer").surf("prev", "visual", true)
                        end,
                        desc = "Surf previous tree-sitter object",
                },
        },
}
