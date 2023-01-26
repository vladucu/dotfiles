-- use mason-lspconfig to configure LSP installations
return {
  automatic_installation = true,

  ensure_installed = {
    "cssls",
    "elixirls",
    "html",
    "jsonls",
    "marksman",
    "pyright",
    "rust_analyzer",
    "sqls",
    "sumneko_lua",
    "tsserver",
    "yamlls",
  },
}
