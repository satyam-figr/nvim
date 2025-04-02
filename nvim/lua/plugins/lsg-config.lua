return {
  {
    "williamboman/mason.nvim",
    config = function()
      require('mason').setup()
    end
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = {
          "lua_ls",
          "css_variables",
          "tailwindcss",
          "docker_compose_language_service",
          "ast_grep",
          "graphql",
          "helm_ls",
          "biome",
          "mdx_analyzer"
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require('lspconfig')
      
      -- Basic setup for other servers
      lspconfig.lua_ls.setup({})
      lspconfig.ts_ls.setup({}) -- Correct name is tsserver, not ts_ls
      lspconfig.css_variables.setup({})
      lspconfig.helm_ls.setup({})
      lspconfig.graphql.setup({})
      lspconfig.biome.setup({})
      
      -- Configure Tailwind with intellisense options
     lspconfig.tailwindcss.setup({
        capabilities = {
          textDocument = {
            completion = {
              completionItem = {
                snippetSupport = true,
                resolveSupport = {
                  properties = { "additionalTextEdits" }
                }
              }
            }
          }
        },
        init_options = {
          userLanguages = {
            javascript = "javascriptreact",
            typescript = "typescriptreact"
          }
        }
      })    

      -- Key mappings
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({ 'n' }, '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}
