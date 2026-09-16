require("config.set")

-- Make sure to require config.keymaps before config.setup_lazy_nvim because we need to set
-- `mapleader` and `maplocalleader` before loading lazy.nvim
require("config.keymaps")

require("config.setup_lazy_nvim")
