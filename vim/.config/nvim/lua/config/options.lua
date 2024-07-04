-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Set gui font and size for GUI editors.
vim.o.guifont = "JetBrainsMono_NF,Noto_Color_Emoji:style=Regular:h10"
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
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2 -- insert x spaces for a tab
vim.opt.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.opt.softtabstop = 2 -- Number of spaces inserted instead of a TAB character

-- add German spellchecking
vim.opt.spelllang = { "en", "de" }

--Change default shell
vim.opt.shell = "zsh"

--Markdown settings:
vim.g.markdown_fenced_languages = { "html", "python", "bash=sh", "R=r" }
-- align function parameters
-- vim.cmd([[
--     :set cino+=(0,W2
-- ]])

-- Set LSP updates in insert mode
-- vim.diagnostic.config({
--   update_in_insert = false,
-- })

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

------------
-- Vimtex --
------------

-- vim.g.vimtex_view_method = "qpdfview"
-- vim.g.vimtex_quickfix_ignore_filters = { "Underfull", "Overfull" }
vim.g.vimtex_quickfix_open_on_warning = 0
----------------------
-- Custom functions --
----------------------

--Toggle ltex-ls
Toggle_ltex = function()
  local lsp_clients = vim.lsp.get_clients()

  for _, client in pairs(lsp_clients) do
    if client.name == "ltex" then
      vim.lsp.stop_client(client.id)
      return
    end
  end

  vim.lsp.start({
    name = "ltex",
    cmd = { "ltex-ls" },
  })
end

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

-- Quarto
-- vim.cmd([[highlight CodeBlock guibg=#252525]])
-- vim.cmd([[highlight Dash guibg=#FF0000 gui=bold]])

-- Require image.nvim setup first:
-- Example for configuring Neovim to load user-installed installed Lua rocks:
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"
