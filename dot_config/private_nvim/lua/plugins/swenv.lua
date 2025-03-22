return {
    "AckslD/swenv.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufEnter *.py" },
    cmd = { "SwenvPick", "SwenvAuto" },
    config = function()
        local swenv = require("swenv")
        local swenv_api = require("swenv.api")

        -- Setup with configuration
        swenv.setup({
            -- Path to your virtual environments
            venvs_path = vim.fn.expand("~/venvs"),

            -- Action to perform after setting a virtual environment
            post_set_venv = function()
                -- Restart LSP clients if needed
                -- Example for pyright/basedpyright:
                local client = vim.lsp.get_clients({ name = "pyright" })[1] or
                    vim.lsp.get_clients({ name = "basedpyright" })[1]
                if client then
                    local venv = swenv_api.get_current_venv()
                    if venv then
                        local venv_python = venv.path .. "/bin/python"
                        if client.settings then
                            client.settings = vim.tbl_deep_extend("force", client.settings,
                                { python = { pythonPath = venv_python } })
                        else
                            client.config.settings = vim.tbl_deep_extend("force", client.config.settings,
                                { python = { pythonPath = venv_python } })
                        end
                        client.notify("workspace/didChangeConfiguration", { settings = nil })
                    end
                end
            end,

            -- Attempt to auto create and set a venv from dependencies
            auto_create_venv = true,

            -- Name of venv directory to create if using pip
            auto_create_venv_dir = ".venv",
        })

        -- Create commands for easier usage
        vim.api.nvim_create_user_command("SwenvPick", function()
            swenv_api.pick_venv()
        end, { desc = "Pick python virtual environment" })

        vim.api.nvim_create_user_command("SwenvAuto", function()
            swenv_api.auto_venv()
        end, { desc = "Automatically set python virtual environment" })

        -- Set up autocmd to auto-detect venv for Python files
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "python" },
            callback = function()
                swenv_api.auto_venv()
            end
        })
    end,
    keys = {
        { "<leader>ve", function() require("swenv.api").pick_venv() end, desc = "Pick virtual environment" },
        { "<leader>va", function() require("swenv.api").auto_venv() end, desc = "Auto-detect virtual environment" },
    },
}
