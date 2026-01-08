return {
    'numToStr/Comment.nvim',
    opts = {
        -- add any options here
    },
    config = function()
        require("Comment").setup()
        vim.keymap.set("n", "<C-/>", "<Plug>(comment_toggle_linewise_current)", { silent = true })
        vim.keymap.set("v", "<C-/>", "<Plug>(comment_toggle_linewise_visual)", { silent = true })
    end
}

