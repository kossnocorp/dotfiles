-- Native editor plugins (not VS Code)
if vim.g.vscode then
  return {}
end

return {
  --#region Languages ----------------------------------------------------------

  -- LSP

  "neovim/nvim-lspconfig",

  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate'
  },

  {
    "mason-org/mason.nvim",
    opts = {}
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      "neovim/nvim-lspconfig",
      {
        "mason-org/mason.nvim", opts = {}
      },
    },
  },

  -- Rust

  {
    'mrcjkb/rustaceanvim',
    version = '^8',
    lazy = false, -- This plugin is already lazy
  },

  --#endregion

  --#region Navigation ---------------------------------------------------------

  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make'
      },
    }
  },

  --#endregion

  --#region Tests --------------------------------------------------------------

  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter"
    }
  },

  --#endregion
}
