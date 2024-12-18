vim.keymap.set('n', '<leader>e', ':Triptych<CR>', { silent = true, desc = 'Toggle Triptych' })

require('triptych').setup()

require('triptych').setup({
    options = {
        show_hidden = true
    }
})

require("lsp-file-operations").setup {
  -- used to see debug logs in file `vim.fn.stdpath("cache") .. lsp-file-operations.log`
  debug = false,
  -- select which file operations to enable
  operations = {
    willRenameFiles = true,
    didRenameFiles = true,
    willCreateFiles = true,
    didCreateFiles = true,
    willDeleteFiles = true,
    didDeleteFiles = true,
  },
  -- how long to wait (in milliseconds) for file rename information before cancelling
  timeout_ms = 10000,
}
