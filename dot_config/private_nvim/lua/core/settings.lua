-- General Settings
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.showmode = true

vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 50
vim.opt.timeoutlen = 300
vim.opt.scrolloff = 8

-- Editor Behavior
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.clipboard = 'unnamedplus'

-- File Management
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Appearance
vim.opt.guicursor = "n:block,i:ver25"
vim.opt.termguicolors = true
vim.opt.colorcolumn = "80"

-- Spelling
vim.opt.spelllang = 'en_us'
vim.opt.spell = true
vim.opt.spelloptions = "camel"
