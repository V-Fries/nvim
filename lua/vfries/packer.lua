-- Alias:
---- vi () {
---- 	(
---- 		cd $1 &> /dev/null && nvim . || nvim $1
---- 	)
---- }

-- Update:
---- :so
---- :PackerSync
---- :checkhealth

-- Install LSPs
---- :Mason

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- File opener
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Syntax highlighting
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    -- File modification history
    use('mbbill/undotree')

    -- git
    use('tpope/vim-fugitive')
    use('lewis6991/gitsigns.nvim')

    -- Autocompletion
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v4.x',
        requires = {
            --- Uncomment these if you want to manage LSP servers from neovim
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- LSP Support
            {'neovim/nvim-lspconfig'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        }
    }

    -- File tree
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    }

    -- Terminal
    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end}

    -- Auto saver
    use {"pocco81/auto-save.nvim"}

    -- status line
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- Cursor line
    use { 'nyngwang/murmur.lua' }

    -- zen mode
    -- Lua
    use {
        'folke/zen-mode.nvim',
    }

    -- -- Auto close blocks
    -- use {'jiangmiao/auto-pairs'}
    --
end)
