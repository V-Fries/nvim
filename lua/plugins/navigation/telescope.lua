-- File searcher

return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },

    opts = {
        pickers = {
            find_files = {
                hidden = true,
                file_ignore_patterns = { "^.git/", "^node_modules/", "^target/", "^_build/", "^deps/" },
                -- TODO make this work
                -- sorting_strategy = "ascending",
                layout_strategy = "vertical",
                layout_config = {
                    height = 0.9,
                    width = 0.9,
                    -- prompt_position = "top",
                }
            }
        }
    },

    keys = {
        { "<leader>o", function() require("telescope.builtin").find_files() end, mode = "n" },
        { "<leader>O", function() require("telescope.builtin").git_files() end, mode = "n" },
        {
            "<leader>f",
            function()
                require("telescope.builtin").grep_string({ search = vim.fn.input("Find > ") })
            end,
            mode = "n"
        }
    }
}
