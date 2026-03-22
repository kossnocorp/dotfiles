-- Shared (native + VS Code plugins)

return {
  {
    "kylechui/nvim-surround",
    version = "^4.0.0",
    event = "VeryLazy",
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      label = {
        after = { 0, 0 },
      },
      highlight = {
        backdrop = false
      },
      modes = {
        char = {
          multi_line = false,
          jump_labels = true,
          highlight = {
            backdrop = false
          }
        },
      },
    },
    keys = {
      {
        "<Space>",
        mode = { "n", "x", "o" },
        function() require("flash").jump() end,
        desc = "Flash"
      },
    },
  }
}
