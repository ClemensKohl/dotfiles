-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Set gui font and size for GUI editors.
vim.opt.guifont = { "JetBrainsMono NF,Noto Color Emoji:style=Regular:h10" }
vim.g.neovide_font_hinting = "none"
vim.g.neovide_font_edging = "antialias"
-- vim.g.neovide_font_edging = "subpixelantialias"

-- Controls Floating window blur in neovide
vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0

vim.g.neovide_floating_shadow = true
vim.g.neovide_floating_z_height = 10
vim.g.neovide_light_angle_degrees = 45
vim.g.neovide_light_radius = 5

-- Set the colorscheme
vim.opt.termguicolors = true

-- General vim setup
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2 -- insert x spaces for a tab
vim.opt.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.opt.softtabstop = 2 -- Number of spaces inserted instead of a TAB character

-- add German spellchecking
vim.opt.spelllang = { "en", "de" }

-- align function parameters
vim.cmd([[
    :set cino+=(0,W2
]])

-- LazyVim automatically configures lazygit:
--  * theme, based on the active colorscheme.
--  * editorPreset to nvim-remote
--  * enables nerd font icons
-- Set to false to disable.
vim.g.lazygit_config = true

------------
-- Nvim.R --
------------

-- doesnt seem to work anymore?
-- vim.g.assign_map = "<<"
--
vim.g.rout_follow_colorscheme = 1 -- highlight R commands in colorscheme
vim.g.Rout_more_colors = 1

-- This uses vims indentation plugin.
-- In the future neovim will replace it with treesitter and this might break!
-- vim.g.r_indent_align_args = 0

-- allow correct continuation for R/Roxygen comments
-- vim.cmd([[
--     autocmd FileType r setlocal formatoptions+=r
-- ]])

----------------------
-- Custom functions --
----------------------

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

-- -- function to toggle diagnostics on/off
-- Diagnostics_active = true
-- Toggle_diagnostics = function()
--   Diagnostics_active = not Diagnostics_active
--   if Diagnostics_active then
--     vim.diagnostic.config({
--       virtual_text = true,
--       signs = true,
--       underline = true,
--       float = {
--         show_header = false,
--         source = "if_many",
--         border = "rounded",
--         focusable = false,
--       },
--       update_in_insert = false,
--     })
--   else
--     vim.diagnostic.config({
--       virtual_text = false,
--       signs = true,
--       underline = false,
--       update_in_insert = false,
--     })
--   end
-- end
--
-- -- Turn diagnostics on/off. COMPLETELY OFF.
-- Turnoff_diagnostics = function()
--   Diagnostics_active = not Diagnostics_active
--   if Diagnostics_active then
--     vim.diagnostic.config({
--       virtual_text = false,
--       signs = true,
--       underline = true,
--       float = {
--         show_header = false,
--         source = "if_many",
--         border = "rounded",
--         focusable = false,
--       },
--       update_in_insert = false,
--     })
--   else
--     vim.diagnostic.config({
--       virtual_text = false,
--       signs = false,
--       underline = false,
--       update_in_insert = false,
--     })
--   end
-- end

-- Turn undercurl on/off. All else untouched.
Curl_active = true
Toggle_curl = function()
  Curl_active = not Curl_active
  if Curl_active then
    vim.diagnostic.config({
      underline = true,
    })
  else
    vim.diagnostic.config({
      underline = false,
    })
  end
end

-- Turn virtual text on/off. All else untouched.
Virt_active = false
Toggle_virt = function()
  Virt_active = not Virt_active
  if Virt_active then
    vim.diagnostic.config({
      virtual_text = true,
    })
  else
    vim.diagnostic.config({
      virtual_text = false,
    })
  end
end

-- Set up for molten-nvm

-- Require image.nvim setup first:
-- Example for configuring Neovim to load user-installed installed Lua rocks:
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"
