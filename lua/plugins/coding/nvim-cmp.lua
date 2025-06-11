return {
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            -- icons
            'onsails/lspkind.nvim',
        },
        config = function()
            local cmp = require('cmp')

            cmp.setup({
                sources = {
                    { name = "copilot",  group_index = 2 },
                    { name = 'nvim_lsp', group_index = 2 },
                    { name = 'path',     group_index = 2 }
                },
                formatting = {
                    format = require('lspkind').cmp_format({
                        mode = "symbol",
                        max_width = 50,
                        symbol_map = { Copilot = "" }
                    })
                },
                snippet = {
                    expand = function(args)
                        -- You need Neovim v0.10 to use vim.snippet
                        vim.snippet.expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    --['<Tab>'] = cmp.mapping.confirm({ select = true }),
                    ['<C-l>'] = cmp.mapping.confirm({ select = true }),
                    ['<C-k>'] = cmp.mapping.select_prev_item({
                        behavior = cmp.SelectBehavior.Insert
                    }),
                    ['<C-j>'] = cmp.mapping.select_next_item({
                        behavior = cmp.SelectBehavior.Insert
                    }),
                }),
            })
        end
    },
    { 'hrsh7th/cmp-nvim-lsp' },
}
