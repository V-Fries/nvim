vim.keymap.set("n", "<leader>g", vim.cmd.Git)

--local bufnr = vim.api.nvim_get_current_buf()
--local opts = {buffer = bufnr, remap = false}

vim.keymap.set("n", "<leader>p", function()
    vim.cmd.Git('push')
end)


vim.keymap.set("n", "<leader>l", function()
    vim.cmd.Git('pull --rebase')
end)
