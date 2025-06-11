return {
    "akinsho/toggleterm.nvim",
    opts = {
        start_in_insert = false,
    },
    keys = {
        { "<leader>tj", "<Cmd>ToggleTerm size=20 dir=. direction=horizontal name=project<CR>" },
        { "<leader>tl", "<Cmd>ToggleTerm size=80 dir=. direction=vertical name=project<CR>" },
        { "<leader>tk", "<Cmd>ToggleTerm dir=. direction=float name=project<CR>" },
    },
}
