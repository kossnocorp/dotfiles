-- VS Code-only plugins

if not vim.g.vscode then
  return {}
end

return {
  {
    name = "vscode-multi-cursor.nvim",
    src = "https://github.com/vscode-neovim/vscode-multi-cursor.nvim",
    lazy = "defer",
    setup = function()
      require("vscode-multi-cursor").setup({})
    end,
  }
}
