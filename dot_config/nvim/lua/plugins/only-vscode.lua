-- VS Code-only plugins
if not vim.g.vscode then
  return {}
end

return {
  {
    'vscode-neovim/vscode-multi-cursor.nvim',
    event = 'VeryLazy',
    cond = not not vim.g.vscode,
    opts = {},
  }
}
