return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<C-j>",
            accept_word = "<C-l>",
            accept_line = "<C-k>",
            next = "<C-n>",
            prev = "<C-p>",
            dismiss = "<C-o>",
          },
        },
        panel = {
          enabled = true,
          auto_refresh = true,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>"
          },
        },
        filetypes = {
          markdown = true,
          help = false,
          gitcommit = false,
          TelescopePrompt = false,
        },
      })
    end,
  }
}
