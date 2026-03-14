return {
    -- Command and arguments to start the server.
    cmd = { 'gopls' },

    -- Filetypes to automatically attach to.
    filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },

    -- Root directory markers.
    root_markers = { { 'go.work', 'go.mod' }, '.git' },

    -- Specific settings for gopls.
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
                shadow = true,
            },
            staticcheck = true,
            gofumpt = true,
            usePlaceholders = true,
            completeUnimported = true,
        },
    },
}
