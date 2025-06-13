return {
    "AndrewRadev/switch.vim",
    keys = {
        { "<leader>s", "<cmd>Switch<cr>" },
    },
    config = function()
        vim.g.switch_mapping               = ""

        local camel_case                   = [=[\<\(\l\)\(\l\+\(\u\l\+\)\+\)\>]=]
        local pascal_case                  = [=[\<\(\u\l\+\)\(\u\l\+\)\+\>]=]
        local snake_case                   = [=[\<\(\l\+\)\(_\l\+\)\+\>]=]
        local upper_case                   = [=[\<\(\u\+\)\(_\u\+\)\+\>]=]

        vim.g['switch_custom_definitions'] = {
            vim.fn['switch#NormalizedCase'] { 'yes', 'no' },
            vim.fn['switch#NormalizedCase'] { 'on', 'off' },
            vim.fn['switch#NormalizedCase'] { 'left', 'right' },
            vim.fn['switch#NormalizedCase'] { 'up', 'down' },
            vim.fn['switch#NormalizedCase'] { 'enable', 'disable' },
            vim.fn['switch#NormalizedCase'] { 'Always', 'Never' },
            { '==', '!=' },
            {
                -- camelCase → PascalCase
                [camel_case]  = [=[\=toupper(submatch(1)) . submatch(2)]=],
                -- PascalCase → snake_case
                [pascal_case] = [=[\=tolower(substitute(submatch(0), '\(\l\)\(\u\)', '\1_\2', 'g'))]=],
                -- snake_case → UPPER_CASE
                [snake_case]  = [=[\U\0]=],
                -- UPPER_CASE → camelCase
                [upper_case]  = [=[\=substitute(tolower(submatch(0)), '_\(\l\)', '\u\1', 'g')]=],
            },
        }
    end,
}
