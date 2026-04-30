-- Native editor plugins (not VS Code)

if vim.g.vscode then
  return {}
end

return {
  --#region Languages ----------------------------------------------------------

  -- LSP

  {
    name = "nvim-lspconfig",
    src = "https://github.com/neovim/nvim-lspconfig",
    lazy = "manual",
  },

  {
    name = "nvim-treesitter",
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
    lazy = false,
  },

  {
    name = "mason.nvim",
    src = "https://github.com/mason-org/mason.nvim",
    lazy = "manual",
    setup = function()
      require("mason").setup({})
    end,
  },

  {
    name = "mason-lspconfig.nvim",
    src = "https://github.com/mason-org/mason-lspconfig.nvim",
    lazy = "manual",
    deps = { "mason.nvim", "nvim-lspconfig" },
    setup = function()
      require("mason-lspconfig").setup({})
    end,
  },

  -- Rust

  {
    name = "rustaceanvim",
    src = "https://github.com/mrcjkb/rustaceanvim",
    version = vim.version.range("8"),
    lazy = false,
  },

  --#endregion

  --#region Navigation ---------------------------------------------------------

  {
    name = "telescope.nvim",
    src = "https://github.com/nvim-telescope/telescope.nvim",
    lazy = "manual",
    deps = { "plenary.nvim", "telescope-fzf-native.nvim" },
  },

  {
    name = "plenary.nvim",
    src = "https://github.com/nvim-lua/plenary.nvim",
    lazy = "manual",
  },

  {
    name = "telescope-fzf-native.nvim",
    src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
    lazy = "manual",
  },

  --#endregion

  --#region Tests --------------------------------------------------------------

  {
    name = "neotest",
    src = "https://github.com/nvim-neotest/neotest",
    lazy = "manual",
    deps = {
      "nvim-nio",
      "plenary.nvim",
      "FixCursorHold.nvim",
      "nvim-treesitter",
    },
  },

  {
    name = "nvim-nio",
    src = "https://github.com/nvim-neotest/nvim-nio",
    lazy = "manual",
  },

  {
    name = "FixCursorHold.nvim",
    src = "https://github.com/antoinemadec/FixCursorHold.nvim",
    lazy = "manual",
  },

  --#endregion
}
