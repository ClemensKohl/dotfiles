-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- vim.cmd("silent! Copilot disable")

-- Disable autoformat for certain filetypes.
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "sh" },
  callback = function()
    vim.b.autoformat = false
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "quarto" },
  callback = function(ev)
    require("treesitter-context").disable()
    require("mini.hipatterns").disable()
  end,
})

-- Latex
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "tex", "latex" },
  callback = function()
    vim.fn.setreg("s", ")hr\r\27@s") -- split paragraph into sentences.
    require("treesitter-context").disable()
  end,
})

-- Turns off treesitter highlights for latex files.
vim.api.nvim_create_autocmd({ "FileType" }, { pattern = { "tex", "latex" }, command = "TSBufDisable highlight" })

-- Solves vimtex and todo-comment both coloring the todos/notes...
Todo_hl_settings = vim.api.nvim_get_hl(0, { name = "Todo" })
vim.api.nvim_create_autocmd({ "FileType" }, { pattern = { "tex", "latex" }, command = "highlight clear Todo" })
-- Enable wrap for tex
vim.api.nvim_create_autocmd({ "FileType" }, { pattern = { "tex", "latex" }, command = "set wrap" })

-- Set Light colorscheme for Latex.
-- vim.api.nvim_create_autocmd({ "FileType" }, { pattern = { "tex", "latex" }, command = "set bg=light" })
-- vim.api.nvim_create_autocmd({ "FileType" }, { pattern = { "tex", "latex" }, command = "colorscheme rose-pine-dawn" })

-- vim.api.nvim_create_autocmd(
--   { "FileType" },
--   { pattern = { "tex", "latex" }, command = "lua vim.api.nvim_set_hl(0, 'Todo', {})" }
-- )
