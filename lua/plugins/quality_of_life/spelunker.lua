return {
    'kamykn/spelunker.vim',
    init = function ()
        -- Zg: Add to dictionary
        -- Zl: Correct work under cursor

        -- Enable spelunker.vim. (default: 1)
        -- 1: enable
        -- 0: disable
        vim.cmd'let g:enable_spelunker_vim = 1'

        -- Enable spelunker.vim on readonly files or buffer. (default: 0)
        -- 1: enable
        -- 0: disable
        vim.cmd'let g:enable_spelunker_vim_on_readonly = 0'

        -- Check spelling for words longer than set characters. (default: 4)
        vim.cmd'let g:spelunker_target_min_char_len = 1'

        -- Max amount of word suggestions. (default: 15)
        vim.cmd'let g:spelunker_max_suggest_words = 100'

        -- Max amount of highlighted words in buffer. (default: 100)
        vim.cmd'let g:spelunker_max_hi_words_each_buf = 1000'

        -- Spellcheck type: (default: 1)
        -- 1: File is checked for spelling mistakes when opening and saving. This
        -- may take a bit of time on large files.
        -- 2: Spellcheck displayed words in buffer. Fast and dynamic. The waiting time
        -- depends on the setting of CursorHold `set updatetime=1000`.
        vim.cmd'let g:spelunker_check_type = 2'

        -- Highlight type: (default: 1)
        -- 1: Highlight all types (SpellBad, SpellCap, SpellRare, SpellLocal).
        -- 2: Highlight only SpellBad.
        -- FYI: https://vim-jp.org/vimdoc-en/spell.html#spell-quickstart
        vim.cmd'let g:spelunker_highlight_type = 1'

        -- Option to disable word checking.
        -- Disable URI checking. (default: 0)
        vim.cmd'let g:spelunker_disable_uri_checking = 1'

        -- Disable email-like words checking. (default: 0)
        vim.cmd'let g:spelunker_disable_email_checking = 1'

        -- TODO look into this, it doesn't seem to work
        -- Override highlight setting.
        vim.cmd'hi! SpelunkerSpellBad cterm=undercurl gui=undercurl guisp=#659c6b guifg=None guibg=None'
        vim.cmd'hi! link SpelunkerComplexOrCompoundWord SpelunkerSpellBad'
    end,
}
