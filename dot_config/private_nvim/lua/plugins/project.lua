return {
    "ahmedkhalf/project.nvim",
    lazy = false,
    config = function()
        require("project_nvim").setup({
            -- Detection methods: lsp uses the native neovim lsp, pattern uses glob pattern matching
            -- Order matters - if one isn't detected, the other is used as fallback
            detection_methods = { "lsp", "pattern" },

            -- Patterns used to detect root directory when "pattern" is in detection_methods
            patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },

            -- Don't automatically change directory in these cases
            -- manual_mode = false,

            -- LSP clients to ignore by name (e.g., {"efm", ...})
            -- ignore_lsp = {},

            -- Directories to exclude from detection
            -- exclude_dirs = {},

            -- Show hidden files in telescope
            show_hidden = true,

            -- Silent directory changes
            silent_chdir = true,

            -- Scope for directory changes: 'global', 'tab', or 'win'
            scope_chdir = 'global',

            -- Path where project history is stored for telescope
            datapath = vim.fn.stdpath("data"),
        })

        -- Load telescope extension
        require('telescope').load_extension('projects')
    end,
    dependencies = { "nvim-telescope/telescope.nvim" },
    keys = {
        { "<leader>fp", "<cmd>Telescope projects<cr>", desc = "Find projects" },
    },
}
