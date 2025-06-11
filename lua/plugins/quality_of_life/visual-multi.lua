return {
    'mg979/vim-visual-multi',
    branch = 'master',
    lazy = false,
    keys = {
        { "<C-S-j>", "<Plug>(VM-Add-Cursor-Down)" },
        { "<C-S-k>", "<Plug>(VM-Add-Cursor-Up)" },
    },
    init = function()
        -- Hide warnings
        vim.g.VM_show_warnings = 0

        -- Don't show exited visual multi message
        vim.g.VM_silent_exit = 1

        -- Don't change the status line
        vim.g.VM_set_statusline = 0
    end
}
