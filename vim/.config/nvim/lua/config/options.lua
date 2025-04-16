-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Set gui font and size for GUI editors.
vim.o.guifont = "JetBrainsMono_NF,Noto_Color_Emoji:style=Regular:h12"
vim.g.neovide_font_hinting = "none"
-- vim.g.neovide_font_edging = "antialias"
-- vim.g.neovide_font_edging = "subpixelantialias"

-- Controls Floating window blur in neovide
vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0

vim.g.neovide_floating_shadow = true
vim.g.neovide_floating_z_height = 10
vim.g.neovide_light_angle_degrees = 45
vim.g.neovide_light_radius = 5

-- disable animations when using neovide.
if vim.g.neovide == true then
  vim.g.snacks_animate = false
end

-- Set the colorscheme
vim.opt.termguicolors = true

-- General vim setup
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2 -- insert x spaces for a tab
vim.opt.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.opt.softtabstop = 2 -- Number of spaces inserted instead of a TAB character
vim.opt.breakindent = true

vim.opt.thesaurus = vim.fn.expand("$HOME") .. "/.config/nvim/spell/thesaurus_pkg/thesaurus.txt"

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

-------------
-- LazyVim --
-------------
-- In case you don't want to use `:LazyExtras`,
-- then you need to set the option below.
-- vim.g.lazyvim_picker = "fzf"
vim.g.lazyvim_picker = "snacks"

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

if vim.fn.executable("sioyek") == 1 then
  vim.g.vimtex_view_method = "sioyek"
elseif vim.fn.executable("zathura") == 1 then
  vim.g.vimtex_view_method = "zathura"
end

-- vim.g.vimtex_quickfix_ignore_filters = { "Underfull", "Overfull" }
vim.g.vimtex_quickfix_open_on_warning = 0

---------------
-- Thesaurus --
---------------
vim.g.dictionary_api_key = "00681251-6c67-4cd5-979c-3d58d11caf77"

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

---
--- Thesaurus ChatGPT
---

local curl = require("plenary.curl")

-- Fetch synonyms
local function thesaurus_source(word)
  local response = curl.get("https://api.datamuse.com/words", {
    query = { rel_syn = word },
  })

  local results = {}

  if response.status == 200 then
    local ok, decoded = pcall(vim.json.decode, response.body)
    if ok then
      for _, entry in ipairs(decoded) do
        table.insert(results, {
          label = entry.word,
          word = entry.word,
        })
      end
    end
  end

  return results
end

-- Get definition for preview
local function get_definition(word)
  local response = curl.get("https://api.datamuse.com/words", {
    query = {
      sp = word,
      md = "d", -- metadata: d = definitions
      max = 1,
    },
  })

  if response.status == 200 then
    local ok, decoded = pcall(vim.json.decode, response.body)
    if ok and decoded[1] and decoded[1].defs then
      return table.concat(decoded[1].defs, "\n\n")
    end
  end

  return "No definition found."
end

-- Picker
local function open_thesaurus_picker_under_cursor()
  local word = vim.fn.expand("<cword>")
  if not word or word == "" then
    print("No word under cursor.")
    return
  end

  local items = thesaurus_source(word)

  Snacks.picker({
    title = "Synonyms for: " .. word,
    items = items,
    on_select = function(selection)
      vim.fn.setreg('"', selection.label)
      print("Copied to clipboard: " .. selection.label)
    end,
    -- preview = function(selection, buf)
    --   local word = type(selection) == "table" and selection.word or selection
    --   if type(word) ~= "string" then
    --     word = tostring(word or "")
    --   end
    --
    --   local definition = get_definition(word)
    --   vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(definition, "\n"))
    -- end,
  })
end

-- Optional keybinding
vim.keymap.set("n", "<leader>t", open_thesaurus_picker_under_cursor, {
  desc = "Thesaurus: Synonyms for word under cursor",
})
-- Quarto
-- vim.cmd([[highlight CodeBlock guibg=#252525]])
-- vim.cmd([[highlight Dash guibg=#FF0000 gui=bold]])

-- Require image.nvim setup first:
-- Example for configuring Neovim to load user-installed installed Lua rocks:
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"
