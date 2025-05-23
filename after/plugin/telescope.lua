local telescope = require('telescope')

telescope.setup {
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
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>o', builtin.find_files, {})
vim.keymap.set('n', '<leader>O', builtin.git_files, {})

vim.keymap.set('n', '<leader>f', function()
    builtin.grep_string({ search = vim.fn.input("Find > ") })
end)
