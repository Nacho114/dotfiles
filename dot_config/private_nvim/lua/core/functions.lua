vim.api.nvim_set_keymap("n", "<leader>ta", "<Esc>:SuperCA<CR>a", {noremap = true, silent = true})

local function insert_custom_text()
  local current_date = os.date("%d %B %Y")
  local current_filename = vim.fn.expand("%:t:r")
  local text_to_insert = "- [ ] " .. vim.fn.getline('.') .. " | " .. current_date .. " | #" .. current_filename

  -- Replace the current line with the new text
  vim.api.nvim_set_current_line(text_to_insert)

  -- Move the cursor to the position after the closing bracket
  vim.cmd("normal! F]l")
end

-- Create a command to call the function
vim.api.nvim_create_user_command("SuperCA", insert_custom_text, {})

-- Create a keymap to trigger the command
vim.api.nvim_set_keymap("n", "<leader>ta", ":SuperCA<CR>", {noremap = true, silent = true})
