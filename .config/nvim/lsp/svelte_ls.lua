return {
    cmd = { "svelteserver", "--stdio" },
    filetypes = { "svelte" },
    root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
    settings = {
        svelte = {
            plugin = {
                typescript = { enable = true },
                svelte = { enable = true },
                html = { enable = true },
                css = { enable = true }
            }
        }
    }
}
