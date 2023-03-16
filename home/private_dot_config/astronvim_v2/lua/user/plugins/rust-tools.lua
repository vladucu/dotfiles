return {
    -- get the server settings and built in capabilities/on_attach
    server = astronvim.lsp.server_settings "rust_analyzer",
    tools = {
        inlay_hints = {
            auto = false,
        },
    },
}
