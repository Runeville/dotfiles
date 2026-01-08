return {
    cmd = { "rust-analyzer" },
    filetypes = { 'rust' },
    root_markers = { 'Cargo.toml', '.git' },
    settings = {
        ["rust-analyzer"] = {
            cargo = { allFeatures = true },
            check = { command = "clippy" },
            assist = {
                importGranularity = "module",
                importPrefix = "by_self",
            },
            diagnostics = {
                enable = true,
                disabled = { "unresolved-proc-macro", "inactive-code", "unresolved-import", "unused-imports" },
                enableExperimental = true,
            },
            inlayHints = { enable = true },
        },
    },
}
