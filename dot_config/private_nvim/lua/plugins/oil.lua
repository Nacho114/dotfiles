return {
    'stevearc/oil.nvim',
    -- Optional dependencies
    -- dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    config = function()
        require("oil").setup({
            columns = {
                -- "icon",
                -- "permissions",
                -- "size",
                -- "mtime",
            },
            skip_confirm_for_simple_edits = false,
            delete_to_trash = true,
        })
        local oil_status, oil = pcall(require, "oil")
        if oil_status then
            -- Custom function to automatically toggle Oil
            vim.keymap.set("n", "<leader>e", function()
                if vim.bo.filetype == 'oil' then
                    oil.close()
                else
                    oil.open()
                end
            end, { desc = "File navigation" })
        end
    end,
}
