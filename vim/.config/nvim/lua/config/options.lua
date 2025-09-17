-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-------------
-- GENERAL --
-------------
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
vim.opt.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
vim.opt.thesaurus = vim.fn.expand("$HOME") .. "/.config/nvim/spell/thesaurus_pkg/thesaurus.txt"

-- add German spellchecking
vim.opt.spelllang = { "en", "de" }

--Change default shell
vim.opt.shell = "zsh"

--Markdown settings:
vim.g.markdown_fenced_languages = { "html", "python", "bash=sh", "R=r" }

-- Copilot
-- vim.g.ai_cmp = false
vim.g.copilot_enabled = false
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

-- LazyVim completion engine to use.
-- Can be one of: nvim-cmp, blink.cmp
-- Leave it to "auto" to automatically use the completion engine
-- enabled with `:LazyExtras`
vim.g.lazyvim_cmp = "auto"

-- Set to `false` to prevent "non-lsp snippets"" from appearing inside completion windows
-- Motivation: Less clutter in completion windows and a more direct usage of snippits
vim.g.lazyvim_mini_snippets_in_completion = true

-------------
-- NEOVIDE --
-------------
-- Set gui font and size for GUI editors.
vim.o.guifont = "JetBrainsMono_NF,Noto_Color_Emoji:style=Regular:h13"
vim.g.neovide_font_hinting = "none"
-- vim.g.neovide_font_edging = "antialias"
-- vim.g.neovide_font_edging = "subpixelantialias"
vim.g.neovide_remember_window_size = true

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

------------
-- Nvim.R --
------------

vim.g.rout_follow_colorscheme = 1 -- highlight R commands in colorscheme
vim.g.Rout_more_colors = 1

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

--Move aux files into subdirectory
vim.g.vimtex_compiler_latexmk = {
  aux_dir = "aux", -- create a directory called aux that will contain all the auxiliary files
}
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

-------------
-- Copilot --
-------------

-- Function that toggles Copilot on/off.
-- function Toggle_Copilot()
--   local c = require("copilot.client")
--   local copilot_status = c.buf_is_attached()
--   if copilot_status then
--     vim.cmd("Copilot disable")
--     vim.notify("Copilot disabled", vim.log.levels.INFO)
--   else
--     vim.cmd("Copilot enable")
--     vim.notify("Copilot enabled", vim.log.levels.INFO)
--   end
-- end

---
--- Thesaurus ChatGPT
---

local curl = require("plenary.curl")

-- Fetch synonyms **and** their definitions
local function thesaurus_source(word)
  local resp = curl.get("https://api.datamuse.com/words", {
    query = { rel_syn = word, max = 20 }, -- ← _rel_syn_ is the correct Datamuse parameter
  })
  local results = {}
  if resp.status == 200 then
    local ok, decoded = pcall(vim.json.decode, resp.body)
    if ok then
      for _, entry in ipairs(decoded) do
        -- get_definition can be expensive, but we're capping at 20 items
        local def_resp = curl.get("https://api.datamuse.com/words", {
          query = { sp = entry.word, md = "d", max = 1 },
        })
        local definition = "No definition found."
        if def_resp.status == 200 then
          local ok2, dec2 = pcall(vim.json.decode, def_resp.body)
          if ok2 and dec2[1] and dec2[1].defs then
            definition = table.concat(dec2[1].defs, "\n\n")
          end
        end

        table.insert(results, {
          label = entry.word,
          word = entry.word,
          -- attach to the item the preview data that the "preview" previewer will use
          preview = {
            text = definition,
            ft = "markdown", -- highlight nicely
          },
        })
      end
    end
  end
  return results
end

-- The picker
local function open_thesaurus_picker_under_cursor()
  local word = vim.fn.expand("<cword>")
  if word == "" then
    return vim.notify("No word under cursor.", vim.log.levels.WARN)
  end

  local items = thesaurus_source(word)
  if vim.tbl_isempty(items) then
    return vim.notify("No synonyms found for “" .. word .. "”.", vim.log.levels.INFO)
  end

  Snacks.picker.pick({
    title = "Synonyms for “" .. word .. "”",
    items = items,
    -- format = "text",
    -- preview = word_defintion(Snacks.picker.Item),
    preview = "preview",
    confirm = function(picker, item)
      picker:close()
      vim.cmd("normal! ciw" .. item.word)
    end,
  })
end

-- optional mapping
vim.keymap.set("n", "<leader>t", open_thesaurus_picker_under_cursor, {
  desc = "Thesaurus: pick synonym for word under cursor",
})

-- Quarto
-- vim.cmd([[highlight CodeBlock guibg=#252525]])
-- vim.cmd([[highlight Dash guibg=#FF0000 gui=bold]])

-- Require image.nvim setup first:
-- Example for configuring Neovim to load user-installed installed Lua rocks:
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"
