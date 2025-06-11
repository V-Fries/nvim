-- Used to commit, view changes, etc from neovim
return {
    'tpope/vim-fugitive',
    keys = {
        { "<leader>gg", "<cmd>Git<cr>" },
        { "<leader>gd", "<cmd>Gdiff<cr>" },
    },
}
