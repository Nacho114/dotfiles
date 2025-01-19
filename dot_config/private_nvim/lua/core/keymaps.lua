-- Center search results
local mappings = { 'n', 'N', '*', '#', 'g*' }
for _, key in ipairs(mappings) do
    vim.api.nvim_set_keymap('n', key, key .. 'zz', { silent = true, desc = "Center search results for " .. key })
end

-- Move by line
vim.api.nvim_set_keymap('n', 'j', 'gj', { silent = true, desc = "Move by displayed line (down)" })
vim.api.nvim_set_keymap('n', 'k', 'gk', { silent = true, desc = "Move by displayed line (up)" })

-- Toggle between buffers
vim.api.nvim_set_keymap('n', '<leader><leader>', '<c-^>', { silent = true, desc = "Toggle with previous buffer" })

-- Map semicolon to colon
vim.api.nvim_set_keymap('n', ';', ':', { noremap = true, desc = "Map ; to :" })

-- Save All or Prettier
vim.keymap.set("n", "<leader>w", function()
    -- Get the file extension of the current buffer
    local file_ext = vim.fn.expand("%:e")
    -- Define a list of file extensions you want to target
    local web_extensions = { "tsx", "ts", "js", "jsx", "svelte", "html", "css" }

    -- Save all files
    vim.cmd("wa!")
    -- Check if the file extension matches any in the list
    if vim.tbl_contains(web_extensions, file_ext) then
        -- Run Prettier for the current file
        vim.cmd("silent !npx prettier --write %")
    end
    -- Save all files again
    vim.cmd("wa!")
end, { desc = "Save all or run Prettier on web files" })

-- Show diagnostics in floating window
vim.keymap.set('n', '<leader>cv', vim.diagnostic.open_float, { desc = "Show diagnostics in floating window" })
