require("satyamx55.core.options")
require("satyamx55.core.keymaps")
require("satyamx55.core.diagnostic")
require("satyamx55.core.autocmds")
-- require("satyamx55.core.scripts.terminal")

local terminal = require("satyamx55.core.scripts.terminal")

-- Setup with terminal toggle functionality
terminal.setup({
  toggle_key = "tt", -- Key to toggle terminal
  exit_key = "<C-x>", -- Optional: key to just exit terminal mode
})

vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})
