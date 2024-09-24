require('github-theme').setup({
    options = {
        transparent = true,
        -- backgroud should be #1e1e1e
    },
})

vim.cmd.colorscheme('github_dark_default')

vim.cmd('highlight CursorLine guibg=#303030')
