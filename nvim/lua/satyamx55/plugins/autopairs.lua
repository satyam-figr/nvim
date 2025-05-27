return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/nvim-cmp",
  },
  config = function()
    -- import nvim-autopairs
    local autopairs = require("nvim-autopairs")
    local Rule = require("nvim-autopairs.rule")
    local cond = require("nvim-autopairs.conds")

    -- configure autopairs
    autopairs.setup({
      check_ts = true, -- enable treesitter
      ts_config = {
        lua = { "string" }, -- don't add pairs in lua string treesitter nodes
        javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
        java = false, -- don't check treesitter on java
        html = { "string", "comment" }, -- don't add pairs in HTML strings and comments
        xml = { "string", "comment" }, -- don't add pairs in XML strings and comments
      },
      disable_filetype = { "TelescopePrompt", "spectre_panel" },
      disable_in_macro = false, -- disable when recording or executing a macro
      disable_in_visualblock = false, -- disable when insert after visual block mode
      disable_in_replace_mode = true,
      ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
      enable_moveright = true,
      enable_afterquote = true, -- add bracket pairs after quote
      enable_check_bracket_line = true, --- check bracket in same line
      enable_bracket_in_quote = true, --
      enable_abbr = false, -- trigger abbreviation
      break_undo = true, -- switch for basic rule break undo sequence
      check_comma = true,
      map_cr = true,
      map_bs = true, -- map the <BS> key
      map_c_h = false, -- Map the <C-h> key to delete a pair
      map_c_w = false, -- map <c-w> to delete a pair if possible
    })

    -- Add custom rules for HTML
    local html_rule = Rule("<", ">", { "html", "xml", "javascriptreact", "typescriptreact" })
      :with_pair(cond.before_regex("%a+")) -- only pair after word characters (tag names)
      :with_move(cond.none())

    autopairs.add_rules({
      html_rule,
      -- Rule for matching quotes in HTML attributes
      Rule('"', '"', { "html", "xml", "javascriptreact", "typescriptreact" }):with_pair(cond.not_inside_quote()),
      Rule("'", "'", { "html", "xml", "javascriptreact", "typescriptreact" }):with_pair(cond.not_inside_quote()),
    })

    -- Make sure nvim-cmp is loaded before setting up the integration
    local cmp_ok, cmp = pcall(require, "cmp")
    if cmp_ok then
      -- import nvim-autopairs completion functionality
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      -- make autopairs and completion work together
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    else
      vim.notify("nvim-cmp not loaded, autopairs integration skipped", vim.log.levels.WARN)
    end
  end,
}
