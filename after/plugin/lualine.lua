local my_colors = { bg = '#1e1e1e', fg = '#ffffff', gui = 'bold' }

local my_theme = {
    normal = {
        a = my_colors,
        b = my_colors,
        c = my_colors,
        x = my_colors,
        y = my_colors,
        z = my_colors,
    }
}

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = my_theme,
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = {'filename'},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
    inactive_sections = {
        lualine_a = {'filename'},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}
