-- Keymaps to remember
-- <Key>ap   Apply <Key> to all paragraph, example dap to delete paragraph
--
-- Shift+o   Create new line above cursor and enter insert mode
--
-- gd           Go to definition
--
-- gcc      comment/uncomment line
--
-- dt<char> delete all text till char is met
--
-- D        delete till end of line
-- C        delete till end of line and enter insert mode
--
-- f<char>  go to next occurence of char
-- t<char>  go before next occurence of char


vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- Escape insert mode
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("v", "jk", "<Esc>")

-- When lines are selected they can be moved by pressed move keys in uppercase
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Jump half page with
vim.keymap.set("n", "<C-k>", "<C-u>zz")
vim.keymap.set("v", "<C-k>", "<C-u>zz")
vim.keymap.set("n", "<C-j>", "<C-d>zz")
vim.keymap.set("v", "<C-j>", "<C-d>zz")

-- Keep search terms in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Don't remove the copied string when pressing p
vim.keymap.set("x", "p", [["_dp]])

-- If copy with leader before, copies to os clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set("v", "<leader>Y", "\"+Y")

-- Replace all occurences of the word on cursor
-- vim.keymap.set("n", "<leader>d", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]])

-- Execute code
vim.keymap.set("n", "<leader>xt", "<Cmd>!cargo test<CR>")

-- Go to previous error
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
-- Go to next error
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

-- split right
vim.keymap.set('n', "<leader>L", "<C-w>v<C-w>l")
-- split bottom
vim.keymap.set('n', "<leader>J", "<C-w>s<C-w>j")
-- split left
vim.keymap.set('n', "<leader>H", "<C-w>v")
-- split top
vim.keymap.set('n', "<leader>K", "<C-w>s")

vim.keymap.set('n', "<C-+>", ":resize +1<CR>")
vim.keymap.set('n', "<C-)>", ":resize -1<CR>")
vim.keymap.set('n', "<C-=>", ":vertical resize +1<CR>")
vim.keymap.set('n', "<C-0>", ":vertical resize -1<CR>")

-- go to right split
vim.keymap.set('n', "<leader>l", "<C-w>l")
-- go to bottom split
vim.keymap.set('n', "<leader>j", "<C-w>j")
-- go to left split
vim.keymap.set('n', "<leader>h", "<C-w>h")
-- go to top split
vim.keymap.set('n', "<leader>k", "<C-w>k")

-- close tab
vim.keymap.set('n', "<leader>w", "<Cmd>q<CR>")
-- close vim
vim.keymap.set('n', "<leader>q", "<Cmd>qa<CR>")

-- Highlight when copying text
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- open last closed tab
vim.keymap.set('n', "<leader>b", "<C-6>")

-- open code action
vim.keymap.set('n', "<leader>a", function()
    vim.lsp.buf.code_action()
end)

vim.keymap.set('n', '<leader>rf', function()
    if vim.bo.filetype ~= "rust" then
        return
    end
    vim.cmd("write")
    vim.fn.system("cargo fmt")
    vim.cmd("edit")
end)

vim.keymap.set('n', '<leader>rc', function()
    vim.cmd('!cargo clippy')
end)
