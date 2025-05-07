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
                    -- Only run if ruff is available
                    if vim.fn.executable('ruff') == 1 then
                        lint.try_lint()
                    end
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
                    -- Custom formatter that checks if ruff exists first
                    async = function(bufnr)
                        if vim.fn.executable('ruff') == 1 then
                            return conform.format({ bufnr = bufnr, timeout_ms = 500, lsp_fallback = true })
                        end
                        return false
                    end,
                },
            })
        end
    },
    {
        'nvimtools/none-ls.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local null_ls = require("null-ls")
            
            null_ls.setup({
                sources = {
                    null_ls.builtins.code_actions.ruff,
                },
            })
        end
    },
}