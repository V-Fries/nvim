
-- Relative line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- 4 spaces for tabulation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

-- Don't wrap lines
vim.opt.wrap = false

-- Dont make stupid swap files
vim.opt.swapfile = false
vim.opt.backup = false

-- Keep undos in memory
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Make search better
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

-- Never have the cursor at the edge of the screen
vim.opt.scrolloff = 8

-- Add a vertical column at n char
vim.opt.colorcolumn = "80"

