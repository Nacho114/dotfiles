return {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewClose" },
    keys = {
        { "<leader>gd", "<cmd>DiffviewOpen main...HEAD<cr>", desc = "Git diff vs main" },
        { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "Git file history" },
        { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Git branch history" },
        { "<leader>gq", "<cmd>DiffviewClose<cr>", desc = "Close diff" },
    },
    opts = {},
}
