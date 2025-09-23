-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- vim.cmd("silent! Copilot disable")

-- vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
--   pattern = { "*" },
--   command = "checktime",
-- })

-- Terminal Options
local function set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
end

-- Some settings for terminals.
vim.api.nvim_create_autocmd({ "TermOpen" }, {
  pattern = { "*" },
  callback = function(_)
    vim.cmd.setlocal("nonumber")
    vim.wo.signcolumn = "no"
    set_terminal_keymaps()
  end,
})

-- Disable autoformat for certain filetypes.
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "sh" },
  callback = function()
    vim.b.autoformat = false
  end,
})

------------
-- Quarto --
------------

-- Disable treesitter-context for quarto files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "quarto" },
  callback = function(ev)
    require("treesitter-context").disable()
  end,
})

-- Disable color highlighting for quarto files.
-- Interferes with code background.
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "quarto" },
  callback = function(ev)
    require("mini.hipatterns").disable()
  end,
})

-----------
-- Latex --
-----------

-- Disable treesitter-context for Latex
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "tex", "latex" },
  callback = function()
    require("treesitter-context").disable()
  end,
})

-- Disable treesitter highlights.
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "tex", "latex" },
  callback = function()
    vim.defer_fn(function()
      vim.treesitter.stop()
    end, 10)
  end,
})

-- Save macro to split lines for md and latex.
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "tex", "latex" },
  callback = function()
    vim.fn.setreg("s", ")hr\r\27@s") -- split paragraph into sentences.
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "tex", "latex" },
  callback = function()
    vim.defer_fn(function()
      vim.lsp.inlay_hint.enable(false, { bufnr = 0 })
    end, 500)
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, { pattern = { "tex", "latex" }, command = "set wrap" })

-- Set colorscheme for Latex files
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "tex",
--   callback = function()
--     vim.cmd("colorscheme catppuccin")
--   end,
-- })
--
-- vim.api.nvim_create_autocmd("BufLeave", {
--   callback = function()
--     if vim.bo.filetype == "tex" then
--       vim.cmd("colorscheme " .. (vim.g.default_colorscheme or "default"))
--     end
--   end,
-- })

-- Turns off treesitter highlights for latex files.
-- vim.api.nvim_create_autocmd({ "FileType" }, { pattern = { "tex", "latex" }, command = "lua vim.treesitter.stop()" })

-- Solves vimtex and todo-comment both coloring the todos/notes...
-- Todo_hl_settings = vim.api.nvim_get_hl(0, { name = "Todo" })
-- vim.api.nvim_create_autocmd({ "FileType" }, { pattern = { "tex", "latex" }, command = "highlight clear Todo" })
-- Enable wrap for tex
