local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>o', builtin.find_files, {})
vim.keymap.set('n', '<leader>O', builtin.git_files, {})

vim.keymap.set('n', '<leader>F', function()
    builtin.grep_string({ search = vim.fn.input("Find > ") })
end) -- TODO fix this

