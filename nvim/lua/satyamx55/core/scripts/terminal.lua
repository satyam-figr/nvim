-- terminal.lua
-- A module for toggling terminal in Neovim

local M = {}

-- State variables for tracking terminal
M.term_buf = nil
M.term_win = nil

-- Toggle terminal function
function M.toggle()
  -- If we have a valid terminal window, focus or hide it
  if M.term_win and vim.api.nvim_win_is_valid(M.term_win) then
    local current_win = vim.api.nvim_get_current_win()

    -- If we're already in the terminal window, hide it
    if current_win == M.term_win then
      vim.cmd("hide")
      return
    else
      -- Focus the terminal window
      vim.api.nvim_set_current_win(M.term_win)
      vim.cmd("startinsert")
      return
    end
  end

  -- If we have a valid terminal buffer but no window, create a window
  if M.term_buf and vim.api.nvim_buf_is_valid(M.term_buf) then
    vim.cmd("botright split")
    vim.cmd("resize 15") -- Adjust height as needed
    vim.cmd("buffer " .. M.term_buf)
    M.term_win = vim.api.nvim_get_current_win()
    vim.cmd("startinsert")
    return
  end

  -- No terminal exists yet, create one
  vim.cmd("botright split")
  vim.cmd("resize 15") -- Adjust height as needed
  vim.cmd("terminal")
  M.term_buf = vim.api.nvim_get_current_buf()
  M.term_win = vim.api.nvim_get_current_win()

  -- Set buffer options
  vim.api.nvim_buf_set_option(M.term_buf, "buflisted", false)
  vim.api.nvim_buf_set_option(M.term_buf, "filetype", "terminal")

  vim.cmd("startinsert")
end

-- Exit terminal mode
function M.exit_terminal_mode()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, true, true), "n", true)
end

-- Setup function to define keymaps
function M.setup(opts)
  opts = opts or {}
  local toggle_key = opts.toggle_key or "tt"

  -- Normal mode: toggle terminal
  vim.keymap.set("n", toggle_key, function()
    M.toggle()
  end, { noremap = true, silent = true })

  -- Terminal mode: first exit terminal mode, then toggle
  vim.keymap.set("t", toggle_key, function()
    M.exit_terminal_mode()
    -- Small delay to ensure we exit terminal mode first
    vim.defer_fn(function()
      M.toggle()
    end, 5)
  end, { noremap = true, silent = true })

  -- Optional: Add an easier way to exit terminal mode
  if opts.exit_key then
    vim.keymap.set("t", opts.exit_key, function()
      M.exit_terminal_mode()
    end, { noremap = true, silent = true })
  end
end

return M
