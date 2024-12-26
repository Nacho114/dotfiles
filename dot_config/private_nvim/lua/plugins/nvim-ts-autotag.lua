return {
    'windwp/nvim-ts-autotag',
    event = "InsertEnter",
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact", "html", "svelte" }, -- Include Svelte
    config = true
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
}
