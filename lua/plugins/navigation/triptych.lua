-- File explorer

return {
    'simonmclean/triptych.nvim',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',       -- required
        'nvim-tree/nvim-web-devicons', -- optional for icons
        {
            -- optional LSP integration
            'antosha417/nvim-lsp-file-operations',
            opts =
            {
                -- used to see debug logs in file `vim.fn.stdpath("cache") .. lsp-file-operations.log`
                debug = false,
                -- select which file operations to enable
                operations = {
                    willRenameFiles = true,
                    didRenameFiles = true,
                    willCreateFiles = true,
                    didCreateFiles = true,
                    willDeleteFiles = true,
                    didDeleteFiles = true,
                },
                -- how long to wait (in milliseconds) for file rename information before cancelling
                timeout_ms = 10000,
            }
        }
    },

    opts = {
        options = {
            show_hidden = true,
            line_numbers = {
                enabled = true,
                relative = true,
            },
        }
    },

    keys = {
        { '<leader>e', ':Triptych<CR>' },
    },

    -- init = function()
    --     vim.api.nvim_create_autocmd("VimEnter", {
    --         callback = function()
    --             local argv = vim.fn.argv()
    --             if #argv == 1 then
    --                 local stat = vim.loop.fs_stat(argv[1])
    --                 if stat and stat.type == "directory" then
    --                     vim.cmd("Triptych")
    --                 end
    --                 return
    --             end
    --             if #argv == 0 and vim.fn.isdirectory(vim.fn.getcwd()) == 1 then
    --                 vim.cmd("Triptych")
    --             end
    --         end
    --     })
    -- end,
}
