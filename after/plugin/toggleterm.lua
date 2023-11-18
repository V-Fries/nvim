require("toggleterm").setup{}

vim.keymap.set("n", "<leader>t",
               "<Cmd>ToggleTerm size=10 dir=. direction=horizontal name=project<CR>")
