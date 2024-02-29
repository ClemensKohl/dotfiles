-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Set the colorscheme
vim.opt.termguicolors = true

-- General vim setup
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2 -- insert x spaces for a tab

-- align function parameters
vim.cmd([[
    :set cino+=(0,W2
]])

-- set diagnostic options

-- vim.diagnostic.config({
--   virtual_text = false,
--   -- signs = true,
--   underline = false,
--   float = {
--     show_header = false,
--     source = "if_many",
--     border = "rounded",
--     focusable = false,
--   },
--   update_in_insert = false,
-- })

-- Options for Nvim-R

-- StartRdevel = function()
--   vim.g.R_path = "~/bin"
--   vim.fn.StartR("Rdev")
-- end

-- vim.g.R_cmd = "R-4.2.2"

vim.g.R_assign_map = "<<"

vim.g.rout_follow_colorscheme = 1 -- highlight R commands in colorscheme
vim.g.Rout_more_colors = 1

-- allow correct continuation for R/Roxygen comments
-- vim.cmd([[
--     autocmd FileType r setlocal formatoptions+=r
-- ]])

-- add German spellchecking
vim.opt.spelllang = { "en", "de" }

-- Custom functions

-- Toggle colorcolumn
Colorcolumn_active = false
Toggle_colorcolumn = function()
  Colorcolumn_active = not Colorcolumn_active
  if Colorcolumn_active then
    vim.opt.colorcolumn = "80"
  else
    vim.opt.colorcolumn = ""
  end
end
