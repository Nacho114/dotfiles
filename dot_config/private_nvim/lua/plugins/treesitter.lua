return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            -- Add languages to be installed here that you want installed for treesitter
            ensure_installed = { 'c', 'lua', 'python', 'rust', 'typescript', 'vimdoc', 'vim', 'css', 'html' },

            -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
            auto_install = true,

            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
