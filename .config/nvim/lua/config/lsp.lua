-- LSP
--------------------------------------------------------------------------------

local lsp_servers = {
    'lua_ls',
    'rust_ls',
    'ts_ls',
    'svelte_ls',
    'pyright',
    'docker_ls',
    'nginx_ls',
    'tailwind_ls',
    'go_ls',
}

for _, server in ipairs(lsp_servers) do
    vim.lsp.enable(server)
end

vim.opt.completeopt = {
    'menu',
    'menuone',
    'noinsert',
    'fuzzy',
    'popup',
}

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)

        if not client then
            return
        end

        if client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
            vim.lsp.completion.enable(true, client.id, ev.buf, {
                autotrigger = true,
            })

            vim.keymap.set('i', '<C-Space>', vim.lsp.completion.get, {
                buffer = ev.buf,
                desc = 'Trigger LSP completion',
            })
        end

        vim.keymap.set('n', '<leader>df', vim.lsp.buf.definition, {
            buffer = ev.buf,
            desc = 'Go to definition',
        })

        vim.keymap.set('n', '<leader>-k', vim.lsp.buf.hover, {
            buffer = ev.buf,
            desc = 'LSP Hover',
        })
    end,
})

-- Automatic completion
--------------------------------------------------------------------------------

local completion_timer = vim.uv.new_timer()

vim.api.nvim_create_autocmd('TextChangedI', {
    callback = function()
        local line = vim.api.nvim_get_current_line()
        local col = vim.api.nvim_win_get_cursor(0)[2]
        local before_cursor = line:sub(1, col)

        if not before_cursor:match('[%w_]+$') then
            completion_timer:stop()
            return
        end

        completion_timer:stop()

        completion_timer:start(150, 0, vim.schedule_wrap(function()
            if vim.fn.mode() ~= 'i' then
                return
            end

            vim.lsp.completion.get()
        end))
    end,
})

-- Diagnostics
--------------------------------------------------------------------------------

vim.diagnostic.config({
    virtual_lines = {
        current_line = true,
    },
})
