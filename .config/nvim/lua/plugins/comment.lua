return {
    'nvim-mini/mini.comment',
    version = false,

    config = function()
        require("mini.comment").setup()

        local mc = require("mini.comment")

        -- Normal mode: comment current line
        vim.keymap.set("n", "<C-/>", function()
            mc.toggle_lines(vim.fn.line("."), vim.fn.line("."))
        end, { silent = true })

        -- Visual mode: comment selection
        vim.keymap.set("v", "<C-/>", function()
            local from = vim.fn.line("v")
            local to = vim.fn.line(".")
            if from > to then from, to = to, from end
            mc.toggle_lines(from, to)
        end, { silent = true })
    end,
}
