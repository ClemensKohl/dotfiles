-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Set gui font and size for GUI editors.
vim.opt.guifont = { "JetBrainsMono NFM:style=Regular:h10" }
vim.g.neovide_font_hinting = "none"
vim.g.neovide_font_edging = "antialias"
-- vim.g.neovide_font_edging = "subpixelantialias"

-- Set the colorscheme
vim.opt.termguicolors = true

-- General vim setup
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2 -- insert x spaces for a tab
vim.opt.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.opt.softtabstop = 2 -- Number of spaces inserted instead of a TAB character

-- align function parameters
vim.cmd([[
    :set cino+=(0,W2
]])

-- Options for Nvim-R

-- doesnt seem to work anymore?
-- vim.g.assign_map = "<<"
--
vim.g.rout_follow_colorscheme = 1 -- highlight R commands in colorscheme
vim.g.Rout_more_colors = 1

-- This uses vims indentation plugin.
-- In the future neovim will replace it with treesitter and this might break!
vim.g.r_indent_align_args = 0

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

-- Set up for molten-nvm

-- Require image.nvim setup first:
-- Example for configuring Neovim to load user-installed installed Lua rocks:
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"
