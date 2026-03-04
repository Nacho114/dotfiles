return {
    url = "https://codeberg.org/andyg/leap.nvim",
    config = function()
        vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap)', { silent = true, desc = "Leap: Jump" })
        vim.keymap.set('n', 'S', '<Plug>(leap-from-window)', { silent = true, desc = "Leap: Jump to window" })
    end,
}
