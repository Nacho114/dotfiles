return {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewClose" },
    keys = {
        { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Git diff" },
        { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "Git file history" },
        { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Git branch history" },
        { "<leader>gq", "<cmd>DiffviewClose<cr>", desc = "Close diff" },
    },
    opts = {},
}
