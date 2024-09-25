local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({buffer = bufnr})

    -- put custom keymaps here
    local opts = {buffer = bufnr, remap = false}
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)

end)

require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        "clangd",
        "rust_analyzer",
        "lua_ls",
        "glsl_analyzer",
    },
    automatic_installation = true,
    handlers = {
        lsp_zero.default_setup,
    },
})

require'lspconfig'.rust_analyzer.setup{
    settings = {
        ['rust-analyzer'] = {
            check = {
                command = "clippy"
            }
        }
    }
}
