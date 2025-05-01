-- changing file appearance
--
vim.cmd("let g:netrw_liststyle = 3")
local opt = vim.opt
-- this will show relative number in our current buffer
opt.relativenumber = true
opt.number = true
-- tabs and indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one
-- line wraping
opt.wrap = true
-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
-- highlight current cursor line
opt.cursorline = true
-- turn on termguicolors for tokyonight colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift
-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start positio

-- clipboard
opt.clipboard:append("unnamedplus")

-- Only use system clipboard in insert mode
-- vim.api.nvim_create_autocmd({ "InsertEnter" }, {
--   callback = function()
--     vim.opt.clipboard:append("unnamedplus") -- enable clipboard in insert mode
--   end,
-- })
--
-- vim.api.nvim_create_autocmd({ "InsertLeave" }, {
--   callback = function()
--     vim.opt.clipboard:remove("unnamedplus") -- disable clipboard outside insert mode
--   end,
-- })
--
-- -- Configure delete behavior to not affect clipboard
-- vim.keymap.set({ "n", "v" }, "d", '"_d', { noremap = true }) -- delete without yanking
-- vim.keymap.set({ "n", "v" }, "D", '"_D', { noremap = true }) -- delete without yanking
-- vim.keymap.set({ "n", "v" }, "x", '"_x', { noremap = true }) -- delete without yanking
-- vim.keymap.set({ "n", "v" }, "X", '"_X', { noremap = true }) -- delete without yanking

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom
-- turn off swapfile
opt.swapfile = false
-- Set updatetime for CursorHold
-- 200ms of no cursor movement to trigger CursorHold (reduced from 300ms)
opt.updatetime = 200
-- Configure diagnostics display
vim.diagnostic.config({
  virtual_text = {
    prefix = "●", -- Could be '■', '▎', 'x', '●', etc
    source = "if_many",
    severity = {
      min = vim.diagnostic.severity.HINT,
    },
  },
  float = {
    source = true,
    border = "rounded",
    header = "",
    prefix = "",
  },
  signs = true,
  underline = true,
  update_in_insert = true, -- Show diagnostics even in insert mode
  severity_sort = true,
})
-- Create an autocommand to show diagnostics in a floating window when cursor hovers
vim.cmd([[
  augroup DiagnosticHover
    autocmd!
    autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})
  augroup END
]])
-- Define keymap for floating diagnostic
local keymap = vim.keymap
keymap.set("n", "<leader>df", vim.diagnostic.open_float, { desc = "Show diagnostic float" })
