return {
    'ggandor/leap.nvim',
    config = function()
        require('leap').create_default_mappings()

        -- Explicitly map `S` for backward search
        vim.keymap.set('n', 's', '<Plug>(leap-forward-to)', { silent = true, desc = "Leap: Jump forward" })
        vim.keymap.set('n', 'S', '<Plug>(leap-backward-to)', { silent = true, desc = "Leap: Jump backward" })
    end,
}
