return {
  "nvim-tree/nvim-web-devicons",
  lazy = false,
  priority = 1001, -- Higher than your other plugins
  config = function()
    require("nvim-web-devicons").setup({
      default = true
    })
  end
}
