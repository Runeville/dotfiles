return {
    -- Command and arguments to start the server.
    cmd = { 'pyright-langserver', '--stdio' },

    -- Filetypes to automatically attach to.
    filetypes = { 'python' },

    -- Sets the "root directory" to the parent directory of the file in the
    -- current buffer that contains either a ".luarc.json" or a
    -- ".luarc.jsonc" file. Files that share a root directory will reuse
    -- the connection to the same LSP server.
    -- Nested lists indicate equal priority, see |vim.lsp.Config|.
    root_markers = { 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', '.git' },

    -- Specific settings to send to the server. The schema for this is
    -- defined by the server. For example the schema for lua-language-server
    -- can be found here https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "basic", -- или "strict" для более жёсткой проверки
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace", -- показывает ошибки по всему проекту
            },
        },
    }

}
