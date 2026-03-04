return {
    'folke/zen-mode.nvim',
    cmd = "ZenMode",
    opts = {
        window = {
            width = 90,
            options = {},
        },
    },
    keys = {
        { "<leader>zz", function()
            require("zen-mode").toggle()
            vim.wo.wrap = true
            vim.wo.number = true
            vim.wo.rnu = true
        end, desc = "Zen mode" },
    },
}
