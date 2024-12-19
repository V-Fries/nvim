local dap = require("dap")

-- keymaps
vim.keymap.set("n", "<leader>dc", function()
    dap.continue()
end)

vim.keymap.set("n", "<leader>di", function()
    dap.step_into()
end)

vim.keymap.set("n", "<leader>do", function()
    dap.step_over()
end)

vim.keymap.set("n", "<leader>dO", function()
    dap.step_out()
end)

vim.keymap.set("n", "<leader>db", function()
    dap.toggle_breakpoint()
end)
