vim.g.mapleader = " "
vim.keymap.set("n", "<leader>E", vim.cmd.Ex)

-- When lines are selected they can be moved by pressed move keys in uppercase
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Jump half page with 
vim.keymap.set("n", "<C-k>", "<C-u>zz")
vim.keymap.set("n", "<C-j>", "<C-d>zz")

-- Jump end/start of line
vim.keymap.set("n", "<C-h>", "<S-^>")
vim.keymap.set("n", "<C-l>", "<S-$>")

-- Keep search terms in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Replace default p with <leader>p
vim.keymap.set("x", "<leader>p", "p")
-- Don't remove the copied string when pressing p
vim.keymap.set("x", "p", [["_dp]])

-- If copy with leader before, copies to os clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Replace all occurences of the word on cursor
vim.keymap.set("n", "<leader>d", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]])

-- Execute code
vim.keymap.set("n", "<leader>x", "<Cmd>make run<CR>")
