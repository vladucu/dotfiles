return {
  timeout_ms = 1000, -- default format timeout
  -- control auto formatting on save
  format_on_save = {
    enabled = true, -- enable or disable format on save globally
    allow_filetypes = { -- enable format on save for specified filetypes only
      -- "go",
    },
    ignore_filetypes = { -- disable format on save for specified filetypes
      -- "python",
    },
  },
  disabled = { -- disable formatting capabilities for the listed language servers
    -- "sumneko_lua",
  },
  filter = function(client) -- fully override the default formatting function
    -- disable formatting for tsserver - conficts with eslint+prettier
    if client.name == "tsserver" then return false end

    -- enable all other clients
    return true
  end,
}
