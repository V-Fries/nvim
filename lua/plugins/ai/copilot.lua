return {
    -- github copilot
    {
        'zbirenbaum/copilot.lua',
        lazy = true,
        opts = {},
    },
    {
        'zbirenbaum/copilot-cmp',
        dependencies = {
            { "zbirenbaum/copilot.lua" },
            { 'hrsh7th/nvim-cmp' },
        },
        cmd = "Copilot",
        event = "InsertEnter",
        opts = {},
    },
}
