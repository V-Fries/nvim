-- K: Displays hover information about the symbol under the cursor in a floating window
--
-- gd: Jumps to the definition of the symbol under the cursor

-- gD: Jumps to the declaration of the symbol under the cursor

-- gi: Lists all the implementations for the symbol under the cursor in the quickfix window

-- go: Jumps to the definition of the type of the symbol under the cursor

-- gr: Lists all the references to the symbol under the cursor in the quickfix window

-- gs: Displays signature information about the symbol under the cursor in a floating window

-- <leader>lr: Renames all references to the symbol under the cursor

-- <leader>lf: Format code in current buffer

-- <leader>a: Selects a code action available at the current cursor position

-- LSP
local lsp_zero = require('lsp-zero')

local lsp_attach = function(client, bufnr)
    local opts = { buffer = bufnr }

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({ 'n', 'x' }, '<leader>lf', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

    -- Autoformat
    -- lsp_zero.buffer_autoformat()
end

lsp_zero.extend_lspconfig({
    sign_text = true,
    lsp_attach = lsp_attach,
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
})


-- Autocomplete
local cmp = require('cmp')

cmp.setup({
    sources = {
        { name = "copilot", group_index = 2 },
        { name = 'nvim_lsp', group_index = 2 },
        { name = 'path', group_index = 2 }
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
        ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    }),
})


-- LSP manager
require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        "clangd",
        "rust_analyzer",
        "lua_ls",
        "glsl_analyzer",
        "zls"
    },
    automatic_installation = false,

    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,

        rust_analyzer = function()
            require('lspconfig').rust_analyzer.setup({
                settings = {
                    ['rust-analyzer'] = {
                        check = {
                            command = "clippy"
                        },
                        cargo = {
                            allFeatures = true, -- Enable all features
                            -- features = { "your-feature" }, -- Enable specific features
                        },
                    }
                }
            })
        end,
        zls = function()
            require('lspconfig').zls.setup({})
            vim.g.zig_fmt_autosave = 0
        end
    },
})
require('mason-nvim-dap').setup({
    ensure_installed = {
        "codelldb",
        "cpptools",
    },

    handlers = {
        function(config)
            require('mason-nvim-dap').default_setup(config)
        end,
    }
})

-- Disable messages at the end of lines
vim.diagnostic.config({ virtual_text = false })
