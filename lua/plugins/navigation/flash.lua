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
         { 'm', function() require('flash').jump() end, 'n' },
         { 'm', function() require('flash').jump() end, 'x' },
         { 'm', function() require('flash').jump() end, 'o' },

        -- {  'S', function() require('flash').treesitter() end, 'n' },
        -- {  'S', function() require('flash').treesitter() end, 'x' },
        -- {  'S', function() require('flash').treesitter() end, 'o' },

         { 'r', function() require('flash').remote() end, 'o' },

         { 'R', function() require('flash').treesitter_search() end, 'o' },
         { 'R', function() require('flash').treesitter_search() end, 'x' },

         { '<c-s>', function() require('flash').toggle() end, 'c' },
    },
}
