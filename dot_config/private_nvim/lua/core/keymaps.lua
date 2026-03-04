-- Center search results
local mappings = { 'n', 'N', '*', '#', 'g*' }
for _, key in ipairs(mappings) do
    vim.keymap.set('n', key, key .. 'zz', { silent = true, desc = "Center search results for " .. key })
end

-- Move by line
vim.keymap.set('n', 'j', 'gj', { silent = true, desc = "Move by displayed line (down)" })
vim.keymap.set('n', 'k', 'gk', { silent = true, desc = "Move by displayed line (up)" })

-- Toggle between buffers
vim.keymap.set('n', '<leader><leader>', '<c-^>', { silent = true, desc = "Toggle with previous buffer" })

-- Map semicolon to colon
vim.keymap.set('n', ';', ':', { noremap = true, desc = "Map ; to :" })

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

local function get_filepath()
    if vim.bo.filetype == 'oil' then
        local oil = require('oil')
        local entry = oil.get_cursor_entry()
        if entry then
            local dir = oil.get_current_dir()
            return vim.fn.fnamemodify(dir .. entry.name, ':.')
        end
    else
        return vim.fn.expand('%:.')
    end
end

vim.keymap.set('n', '<leader>yp', function()
    local filepath = get_filepath()
    if filepath then
        vim.fn.setreg('+', filepath)
        vim.notify('Copied: ' .. filepath)
    end
end, { desc = "Copy path" })

vim.keymap.set('v', '<leader>yp', function()
    vim.cmd('noau normal! "vy')
    local selection = vim.fn.getreg('v')
    local filepath = get_filepath()
    if filepath then
        local result = filepath .. '\n' .. selection
        vim.fn.setreg('+', result)
        vim.notify('Copied path + selection')
    end
end, { desc = "Copy path + selection" })
