local present, trouble = pcall(require, "trouble")
if not present then
    return
end

local M = {}

M.setup = function()
    -- https://github.com/folke/trouble.nvim#setup
    trouble.setup {
        auto_open = true,
        auto_close = true,
    }
end

return M