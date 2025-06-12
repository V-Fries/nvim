return {
    'folke/flash.nvim',
    opts = {
        modes = {
            char = {
                enabled = false
            },
        },
    },
    keys = {
         { 'm', function() require('flash').jump() end, mode = { 'n', 'x', 'o' } },

        -- {  'S', function() require('flash').treesitter() end, 'n' },
        -- {  'S', function() require('flash').treesitter() end, 'x' },
        -- {  'S', function() require('flash').treesitter() end, 'o' },

         { 'r', function() require('flash').remote() end, mode = 'o' },

         { 'R', function() require('flash').treesitter_search() end, mode = { 'o', 'x' } },

         { '<c-s>', function() require('flash').toggle() end, mode = 'c' },
    },
}
