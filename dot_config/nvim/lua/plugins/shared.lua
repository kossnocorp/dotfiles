-- Shared (native + VS Code plugins)

return {
  {
    name = "nvim-surround",
    src = "https://github.com/kylechui/nvim-surround",
    lazy = "defer",
    setup = function()
      require("nvim-surround").setup({})
    end,
  },
  {
    name = "flash.nvim",
    src = "https://github.com/folke/flash.nvim",
    lazy = "manual",
    setup = function()
      require("flash").setup({
        label = {
          after = { 0, 0 },
        },
        highlight = {
          backdrop = false,
        },
        modes = {
          char = {
            multi_line = false,
            jump_labels = true,
            highlight = {
              backdrop = false,
            },
          },
        },
      })
    end,
  },
}
