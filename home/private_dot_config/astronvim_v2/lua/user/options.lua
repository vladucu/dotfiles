-- set vim options here (vim.<first_key>.<second_key> = value)
return {
  opt = {
    -- set to true or false etc.
    linebreak = true, -- linebreak soft wrap at words
    list = true, -- show whitespace characters
    listchars = { tab = "│→", extends = "⟩", precedes = "⟨", trail = "·", nbsp = "␣" },
    number = true, -- sets vim.opt.number
    relativenumber = true, -- sets vim.opt.relativenumber
    showbreak = "﬌ ",
    signcolumn = "auto", -- sets vim.opt.signcolumn to auto
    spell = false, -- sets vim.opt.spell
    wrap = true, -- sets vim.opt.wrap. soft-wrap lines
  },
  g = {
    autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
    autopairs_enabled = true, -- enable autopairs at start
    cmp_enabled = true, -- enable completion at start
    diagnostics_enabled = true, -- enable diagnostics at start
    heirline_bufferline = false, -- enable new heirline based bufferline (requires :PackerSync after changing)
    icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
    mapleader = " ", -- sets vim.g.mapleader
    status_diagnostics_enabled = true, -- enable diagnostics in statusline
    ui_notifications_enabled = true, -- disable notifications when toggling UI elements
  },
}
