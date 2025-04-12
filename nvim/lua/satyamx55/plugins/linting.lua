return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      svelte = { "eslint_d" },
      python = { "pylint" },
    }

    -- Configure eslint_d for better error messages
    lint.linters.eslint_d.args = {
      "--format",
      "json",
      "--stdin",
      "--stdin-filename",
      function()
        return vim.api.nvim_buf_get_name(0)
      end,
    }

    -- Create an autocommand group for linting
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    -- Real-time linting (as you type)
    vim.api.nvim_create_autocmd({
      "BufEnter",
      "BufWritePost",
      "TextChangedI", -- Trigger during insert mode text changes
      "TextChanged", -- Trigger during normal mode text changes
    }, {
      group = lint_augroup,
      callback = function()
        -- Debounce the linting to avoid performance issues
        -- This cancels any existing delayed execution and sets a new one
        local timer = vim.loop.new_timer()
        if timer then
          timer:start(
            300,
            0,
            vim.schedule_wrap(function()
              lint.try_lint()
            end)
          )
        else
          -- Fallback if timer creation fails
          lint.try_lint()
        end
      end,
    })

    -- Also enable diagnostic updates in insert mode
    vim.diagnostic.config({
      update_in_insert = true, -- Show diagnostics even in insert mode
    })

    -- Keymapping to manually trigger linting
    vim.keymap.set("n", "<leader>l", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
  end,
}
