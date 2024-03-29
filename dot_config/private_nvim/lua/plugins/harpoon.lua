return
{
    'ThePrimeagen/harpoon',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require("harpoon").setup({
            menu = {
                width = vim.api.nvim_win_get_width(0) - 25,
            }
        })
        vim.keymap.set("n", "<leader>ha", require("harpoon.mark").add_file, { silent = true, noremap = true })
        vim.keymap.set("n", "<leader>hf", require("harpoon.ui").toggle_quick_menu, { silent = true, noremap = true })
    end,
}
