return {
    {
        'mfussenegger/nvim-lint',
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local lint = require('lint')
            lint.linters_by_ft = {
                python = { 'ruff' }
            }
            
            -- Set up autocommand for running linter
            vim.api.nvim_create_autocmd({ "BufWritePost" }, {
                callback = function()
                    lint.try_lint()
                end,
            })
        end
    },
    {
        'stevearc/conform.nvim',
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local conform = require("conform")
            
            conform.setup({
                formatters_by_ft = {
                    python = { "ruff_format" },
                },
                format_on_save = {
                    timeout_ms = 500,
                    lsp_fallback = true,
                },
            })
        end
    },
}