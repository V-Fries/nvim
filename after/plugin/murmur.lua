require('murmur').setup {
    cursor_rgb = {
        guibg = '#344134',
    },
    -- cursor_rgb_always_use_config = false, -- if set to `true`, then always use `cursor_rgb`.
    -- yank_blink = {
        --   enabled = true,
        --   on_yank = nil, -- Can be customized. See `:h on_yank`.
    -- },
    max_len = 300,
    min_len = 1,
    exclude_filetypes = {},
    callbacks = {
        -- to trigger the close_events of vim.diagnostic.open_float.
        function ()
            -- Close floating diag. and make it triggerable again.
            vim.api.nvim_exec_autocmds("User", { pattern = "MurmurDiagnostics" })
            vim.w.diag_shown = false
        end,
    }
}

-- To create IDE-like no blinking diagnostic message with `cursor` scope. (should be paired with the callback above)
vim.api.nvim_create_autocmd('CursorHold', {
    group = FOO,
    pattern = '*',
    callback = function ()
        -- skip when a float-win already exists.
        if vim.w.diag_shown then return end

        -- open float-win when hovering on a cursor-word.
        if vim.w.cursor_word ~= "" then
            local buf = vim.diagnostic.open_float({
                scope = "cursor",
                -- Only close the window on InsertEnter and the explicit diagnostic close event
                close_events = { "InsertEnter", "User" }, -- MurmurDiagnostics" },
            })
            -- If the window closes for any reason *other* than it being closed by a callback,
            -- make it triggerable again
            vim.api.nvim_create_autocmd("WinClosed", {
                group = FOO,
                buffer = buf,
                once = true,
                callback = function() vim.w.diag_shown = false end,
            })
            vim.w.diag_shown = true
        else
            vim.w.diag_shown = false
        end
    end
})
