require('flash').setup()

vim.keymap.set('n', '<leader>s', function() require('flash').jump() end)
vim.keymap.set('x', '<leader>s', function() require('flash').jump() end)
vim.keymap.set('o', '<leader>s', function() require('flash').jump() end)

-- vim.keymap.set('n', 'S', function() require('flash').treesitter() end)
-- vim.keymap.set('x', 'S', function() require('flash').treesitter() end)
-- vim.keymap.set('o', 'S', function() require('flash').treesitter() end)

vim.keymap.set('o', 'r', function() require('flash').remote() end)

vim.keymap.set('o', 'R', function() require('flash').treesitter_search() end)
vim.keymap.set('x', 'R', function() require('flash').treesitter_search() end)

vim.keymap.set('c', '<c-s>', function() require('flash').toggle() end)
