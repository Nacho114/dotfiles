return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        local wk = require("which-key")
        wk.setup({})
        wk.add({
            { "<leader>c", group = "Code" },
            { "<leader>f", group = "Find" },
            { "<leader>g", group = "Git" },
            { "<leader>h", group = "Harpoon" },
            { "<leader>r", group = "Refactor" },
            { "<leader>y", group = "Yank" },
            { "<leader>v", group = "Venv" },
            { "<leader>z", group = "Zen" },
        })
    end,
}
