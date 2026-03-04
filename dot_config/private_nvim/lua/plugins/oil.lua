return {
    {
        'stevearc/oil.nvim',
        -- Optional dependencies
        -- dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
        --cmd = "Oil", -- This makes it load-lazy, needed to have netrw running at
        -- first, note that this is needed for spelllang to download missing dict!
        config = function()
            require("oil").setup({
                columns = {
                    -- "icon",
                    -- "permissions",
                    -- "size",
                    -- "mtime",
                },
                win_options = {
                    signcolumn = "yes:2",
                },
                skip_confirm_for_simple_edits = true,
                delete_to_trash = true,
                view_options = {
                    show_hidden = true,
                    is_always_hidden = function(name, _)
                        return name == "node_modules" or name == ".git" or name == 'DS_Store'
                    end,
                },
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
    },
    {
        "refractalize/oil-git-status.nvim",
        dependencies = { "stevearc/oil.nvim" },
        config = function()
            require("oil-git-status").setup({
                show_ignored = false,
            })
        end,
    },
}
