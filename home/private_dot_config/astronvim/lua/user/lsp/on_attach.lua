return function(client, bufnr)
  if client.server_capabilities.inlayHintProvider then
    local inlayhints_avail, inlayhints = pcall(require, "lsp-inlayhints")
    if inlayhints_avail then
      inlayhints.on_attach(client, bufnr)
      vim.keymap.set("n", "<leader>uH", function() inlayhints.toggle() end, { desc = "Toggle inlay hints" })
    end
  end

  if client.server_capabilities.document_formatting then
    vim.api.nvim_create_augroup("format_on_save", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePre", {
      desc = "Auto format before save",
      group = "format_on_save",
      pattern = "<buffer>",
      callback = function() vim.lsp.buf.format { async = true } end,
    })
  end
end
