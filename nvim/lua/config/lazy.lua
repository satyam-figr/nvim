local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
-- Setup lazy.nvim

local opts = {}

require('lazy').setup("plugins", opts)

vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', {})

local config = require("nvim-treesitter.configs")
config.setup({
    ensure_installed = {
        "lua", "javascript", "html", "vim", "c", "vimdoc", "query"
    },
    highlight = { enable = true },
    indent = { enable = true },
})



