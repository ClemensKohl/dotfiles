-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Disable autoformat for certain filetypes.
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "r", "sh" },
  callback = function()
    vim.b.autoformat = false
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "quarto", "latex" },
  callback = function(ev)
    require("treesitter-context").disable()
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, { pattern = { "tex", "latex" }, command = "TSBufDisable highlight" })

Todo_hl_settings = vim.api.nvim_get_hl(0, { name = "Todo" })
vim.api.nvim_create_autocmd({ "FileType" }, { pattern = { "tex", "latex" }, command = "highlight clear Todo" })
-- vim.api.nvim_create_autocmd(
--   { "FileType" },
--   { pattern = { "tex", "latex" }, command = "lua vim.api.nvim_set_hl(0, 'Todo', {})" }
-- )
