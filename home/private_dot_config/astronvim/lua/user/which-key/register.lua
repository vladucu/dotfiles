-- Modify which-key registration
-- Add bindings which show up as group name
return {
  -- first key is the mode, n == normal mode
  n = {
    -- second key is the prefix, <leader> prefixes
    ["<leader>"] = {
      -- third key is the key to bring up next level and its displayed
      -- group name in which-key top level menu
      ["n"] = { "<cmd>tabnew<cr>", "New Buffer" },
      ["z"] = { "<cmd>ZenMode<cr>", "Zen Mode" },
    },
    a = {
      name = "Annotate",
      ["<cr>"] = { function() require("neogen").generate() end, "Current" },
      c = { function() require("neogen").generate { type = "class" } end, "Class" },
      f = { function() require("neogen").generate { type = "func" } end, "Function" },
      t = { function() require("neogen").generate { type = "type" } end, "Type" },
      F = { function() require("neogen").generate { type = "file" } end, "File" },
    },
  },
}
