return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    dependencies = {
      "windwp/nvim-ts-autotag"
    },
    config = function()
      -- Set up autopairs
      local autopairs = require("nvim-autopairs")
      autopairs.setup({
        check_ts = true, -- Enable treesitter
        ts_config = {
          lua = {'string'},  -- Don't add pairs in lua string treesitter nodes
          javascript = {'template_string'},  -- Don't add pairs in javascript template_string
        },
        enable_check_bracket_line = true,  -- Don't add pairs if there's a close bracket in the same line
        fast_wrap = {
          map = '<M-e>',  -- Alt+e to wrap current pair
          chars = { '{', '[', '(', '"', "'" },
          pattern = [=[[%'%"%>%]%)%}%,]]=],
          end_key = '$',
          keys = 'qwertyuiopzxcvbnmasdfghjkl',
          check_comma = true,
          highlight = 'Search',
          highlight_grey='Comment'
        },
      })
      
      -- Set up nvim-ts-autotag
      require('nvim-ts-autotag').setup({
        filetypes = { 
          'html', 'xml', 'javascript', 'javascriptreact', 'typescriptreact', 
          'svelte', 'vue', 'tsx', 'jsx', 'rescript', 'php'
        },
      })
    end
  }
}
