return {
    {
        "mason-org/mason.nvim",
        opts = {},
    },
    {
        "mason-org/mason-lspconfig.nvim",
        event = { "BufReadPre", "BufNewFile" },
        cmd = { "Mason" },
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
            { 'hrsh7th/cmp-nvim-lsp' }, -- Installed in nvim-cmp.lua
        },
        opts = {
            ensure_installed = {
                "clangd",
                "rust_analyzer",
                "lua_ls",
                "glsl_analyzer",
                "zls",
                "elixirls",
            },
            automatic_installation = true,

            handlers = {
                function(server_name)
                    require('lspconfig')[server_name].setup({
                        capabilities = require('cmp_nvim_lsp').default_capabilities(),
                    })
                end,

                rust_analyzer = function()
                    require('lspconfig').rust_analyzer.setup({
                        capabilities = require('cmp_nvim_lsp').default_capabilities(),

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
                    require('lspconfig').zls.setup({
                        capabilities = require('cmp_nvim_lsp').default_capabilities(),
                    })
                    vim.g.zig_fmt_autosave = 0
                end,

                elixirls = function()
                    require('lspconfig').elixirls.setup({
                        capabilities = require('cmp_nvim_lsp').default_capabilities(),

                        settings = {
                            elixirLS = {
                                incrementalDialyzer = true,
                                dialyzerEnabled = true,
                                dialyzerWarnOpts = {
                                    "unmatched_returns",
                                    "missing_return"
                                },
                                fetchDeps = false,
                                enableTestLenses = false,
                                suggestSpecs = true,
                            }
                        }
                    })
                end,
            },
        },
    },
}
