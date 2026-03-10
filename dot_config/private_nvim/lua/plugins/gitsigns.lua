return {
    'lewis6991/gitsigns.nvim',
    opts = {
        -- See `:help gitsigns.txt`
        signs = {
            add = { text = '+' },
            change = { text = '~' },
            delete = { text = 'x' },
            topdelete = { text = '‾' },
            changedelete = { text = '~' },
        },
        on_attach = function(bufnr)
            local gs = require('gitsigns')
            local opts = function(desc) return { buffer = bufnr, desc = desc } end

            vim.keymap.set('n', '<leader>gn', gs.next_hunk, opts('Git next hunk'))
            vim.keymap.set('n', '<leader>gN', gs.prev_hunk, opts('Git prev hunk'))
            vim.keymap.set('n', '<leader>gp', gs.preview_hunk, opts('Git preview hunk'))
            vim.keymap.set('n', '<leader>gr', gs.reset_hunk, opts('Git reset hunk'))
        end,
    },
}
