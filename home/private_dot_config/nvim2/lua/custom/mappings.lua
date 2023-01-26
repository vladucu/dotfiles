local map = require("core.utils").map

-- telescope
map("n", "<leader>cc", ":Telescope <CR>")
map("n", "<leader>q", ":q <CR>")

-- truezen
map("n", "<leader>ta", ":TZAtaraxis <CR>")
map("n", "<leader>tm", ":TZMinimalist <CR>")
map("n", "<leader>tf", ":TZFocus <CR>")

-- trouble
map("n", "<leader>tt", ":TroubleToggle<CR>")
map("n", "<leader>tw", ":Trouble workspace_diagnostics<CR>")
map("n", "<leader>td", ":Trouble document_diagnostics<CR>")
map("n", "<leader>tl", ":Trouble loclist<CR>")
map("n", "<leader>tq", ":Trouble quickfix<CR>")
map("n", "gR", ":Trouble lsp_references<CR>")