-- Function to insert custom text with the current date
local function insert_custom_text()
  local current_date = os.date("%d %B %Y")
  local text_to_insert = "- [ ]  | " .. current_date

  -- Insert text at the current cursor position
  vim.api.nvim_put({text_to_insert}, "c", false, true)

  -- Move the cursor to the position after the closing bracket
  vim.cmd("normal! F]l")
end

-- Create a command to call the function
vim.api.nvim_create_user_command("SuperCA", insert_custom_text, {})

-- Create a keymap to trigger the command
vim.api.nvim_set_keymap("n", "<leader>ca", "<Esc>:SuperCA<CR>a", {noremap = true, silent = true})
