-- use mason-lspconfig to configure LSP installations
return {
  automatic_installation = true,
  ensure_installed = {
    "cssls", -- CSS
    "elixirls", -- Elixir
    "ember", -- Ember
    "glint", -- Glint
    "jsonls", -- Json
    "ltex", -- Latex/Markdown
    "marksman", -- Markdown
    "pyright", -- Python
    "rust_analyzer", -- Rust
    "solargraph", -- Ruby
    "sumneko_lua", -- Lua
    "tsserver", -- Typescript
    "yamlls", -- Yaml
  },
}
