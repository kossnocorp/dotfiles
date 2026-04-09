-- Disable built-in Neovim plugins
local disabled = {
    "editorconfig",
    "ft_shada",
    "man",
    "matchit",
    "matchparen",
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "paren",
    "spec",
    "tar",
    "tutor",
    "zip",
    "spellfile_plugin",
    "tohtml",
}
for _, plugin in ipairs(disabled) do
    vim.g["loaded_" .. plugin] = 1
end

vim.opt.colorcolumn = "80"

-- -- Map <leader> to <space>
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
-- vim.g.mapleader = "<Space>"
-- vim.g.maplocalleader = "<Space>"

require("config.lazy")

if vim.g.vscode then
    -- VS Code Neovim extension configuration
    -- See: https://github.com/vscode-neovim/vscode-neovim
else
    -- Ordinary Neovim configuration
end
