-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

--TODO: Add as many as possible directly to plugin config.
--This way you can easily disable both the plugin and the keymaps.

-- Set Q instead of <leader>cd to open floating diagnostic window.
vim.keymap.set("n", "Q", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

-- Toggle Color highlighting of Hex codes
vim.keymap.set("n", "<leader>zh", "<cmd>lua MiniHipatterns.toggle()<cr>", { desc = "Toggle Colors Highlighting" })
-- Buffers/tabs with telescope
vim.keymap.set("n", "<leader>bf", ":Telescope buffers show_all_buffers=true<CR>", { desc = "Show All Buffers" })
vim.keymap.set("n", "<leader>bt", ":Telescope telescope-tabs list_tabs<CR>", { desc = "Show All Tabs" })

-- vim.keymap.set("n", "<leader>cB", ":s/, /,\\r/g<cr>", { desc = "Break line" })
vim.keymap.set(
  "n",
  "gob",
  ":s/\\((\\zs\\|,\\ *\\zs\\|)\\)/\\r&/g<CR><Bar>:'[,']normal ==<CR>",
  { desc = "Break Line and align" }
)

local wk = require("which-key")

----------------------
-- custom functions --
----------------------

vim.keymap.set("n", "<leader>uu", "<cmd>lua Toggle_colorcolumn()<cr>", { desc = "Toggle colorcolumn" })
-- vim.keymap.set("n", "<leader>zo", "<cmd>lua Toggle_diagnostics()<cr>", { desc = "Toggle diagnostics (custom)" })
-- vim.keymap.set("n", "<leader>zf", "<cmd>lua Turnoff_diagnostics()<cr>", { desc = "Turn off diagnostics (custom)" })
vim.keymap.set("n", "<leader>zc", "<cmd>lua Toggle_curl()<cr>", { desc = "Toggle diagnostic curl" })
vim.keymap.set("n", "<leader>zv", "<cmd>lua Toggle_virt()<cr>", { desc = "Toggle virtual text" })

vim.keymap.set("n", "<leader>uS", "<cmd>lua Toggle_ltex()<cr>", { desc = "Toggle ltex-ls" })

------------
-- Notify --
------------

-- wk.register({
--   uN = {
--     name = "Noice",
--     l = { "<cmd>lua require('noice').cmd('last')<cr>", "Noice Last Message" },
--     h = { "<cmd>lua require('noice').cmd('history')<cr>", "Noice History" },
--     a = { "<cmd>lua require('noice').cmd('all')<cr>", "Noice All" },
--     d = { "<cmd>lua require('noice').cmd('dismiss')<cr>", "Dismiss All" },
--     H = { "<cmd>:Telescope notify<cr>", "Notify History" },
--   },
-- }, { prefix = "<leader>" })

------------
-- Nvim-R --
------------

-- wk.register({
--   r = {
--     name = "Nvim-R", -- optional group name
--     f = { "<Plug>RStart", "Start R" },
--     q = { "<Plug>RClose", "Close R" },
--     l = { "<Plug>RSendLine", "Send Line to R" },
--     s = { "<Plug>RSendSelection", "Send Selection to R" },
--     h = { "<Plug>RHelp", "Open R Help" },
--     o = { "<Plug>RUpdateObjBrowser", "Open Object Browser" },
--     c = { "<Plug>RSendChunk", "Send Rmd Chunk" },
--     d = { "<Plug>RDSendChunk", "Send Rmd Chunk (DOWN)" },
--   },
-- }, { prefix = "<leader>" })
--
-- wk.register({
--   r = {
--     name = "Nvim-R", -- optional group name
--     s = { "<Plug>RSendSelection", "Send Selection to R" },
--   },
-- }, { prefix = "<leader>", mode = "v" })

--------------
-- Zen Mode --
--------------

wk.register({
  z = {
    name = "Util", -- optional group name
    z = { "<cmd>ZenMode<cr>", "Toggle ZenMode" },
    t = { "<cmd>Twilight<cr>", "Toggle Twilight" },
    E = { "<cmd>Copilot enable<cr>", "start Copilot" },
    D = { "<cmd>Copilot disable<cr>", "stop Copilot" },
  },
}, { prefix = "<leader>" })

----------------
-- ToggleTerm --
----------------
-- ... we dont have it installed.
-- wk.register({
--   t = {
--     name = "ToggleTerm", -- optional group name
--     f = {
--       "lua function() set_opfunc(function(motion_type) require('toggleterm').send_lines_to_terminal(motion_type, false, { args = vim.v.count }) end) vim.api.nvim_feedkeys('g@', 'n', false) end)<cr>",
--       "Send Line",
--     },
--   },
-- }, { prefix = "<leader>", mode = "n" })
--
-- wk.register({
--   t = {
--     name = "ToggleTerm", -- optional group name
--     l = {
--       "<cmd>lua require('toggleterm').send_lines_to_terminal('single_line', trim_spaces, { args = vim.v.count })<cr>",
--       "Send Line",
--     },
--   },
-- }, { prefix = "<leader>", mode = "v" })

-- local trim_spaces = true
-- vim.keymap.set("v", "<leader>t", function()
--   require("toggleterm").send_lines_to_terminal("single_line", trim_spaces, { args = vim.v.count })
-- end)
-- Replace with these for the other two options
-- require("toggleterm").send_lines_to_terminal("visual_lines", trim_spaces, { args = vim.v.count })
-- require("toggleterm").send_lines_to_terminal("visual_selection", trim_spaces, { args = vim.v.count })

-- For use as an operator map:
-- Send motion to terminal
-- vim.keymap.set("n", [[<leader><c-\>]], function()
--   set_opfunc(function(motion_type)
--     require("toggleterm").send_lines_to_terminal(motion_type, false, { args = vim.v.count })
--   end)
--   vim.api.nvim_feedkeys("g@", "n", false)
-- end)

-- Double the command to send line to terminal
-- vim.keymap.set("n", [[<leader><c-\><c-\>]], function()
--   set_opfunc(function(motion_type)
--     require("toggleterm").send_lines_to_terminal(motion_type, false, { args = vim.v.count })
--   end)
--   vim.api.nvim_feedkeys("g@_", "n", false)
-- end)
--
-- Send whole file
-- vim.keymap.set("n", [[<leader><leader><c-\>]], function()
--   set_opfunc(function(motion_type)
--     require("toggleterm").send_lines_to_terminal(motion_type, false, { args = vim.v.count })
--   end)
--   vim.api.nvim_feedkeys("ggg@G''", "n", false)
-- end)

--------------
-- Transfer --
--------------

wk.register({
  ["<leader>"] = {
    zd = {
      name = "Upload / Download",
      d = { "<cmd>TransferDownload<cr>", "Download from remote server (scp)" },
      u = { "<cmd>TransferUpload<cr>", "Upload to remote server (scp)" },
      f = { "<cmd>DiffRemote<cr>", "Diff file with remote server (scp)" },
      i = { "<cmd>TransferInit<cr>", "Init/Edit Deployment config" },
      r = { "<cmd>TransferRepeat<cr>", "Repeat transfer command" },
    },
  },
})

-- Molten -> Added to lazy plugin load.
-- wk.register({
--   ["<localleader>"] = {
--     M = {
--       name = "Molten",
--       i = { ":MoltenInit<CR>", "Init Molten" },
--       e = { ":MoltenEvaluateOperator<CR>", "run operator selection" },
--       l = { ":MoltenEvaluateLine<CR>", "evaluate line" },
--       r = { ":MoltenReevaluateCell<CR>", "re-evaluate cell" },
--       s = { ":noautocmd MoltenEnterOutput<CR>", "open output window" },
--       h = { ":MoltenHideOutput<CR>", "close output window" },
--       d = { ":MoltenDelete<CR>", "delete Molten cell" },
--     },
--   },
-- }, { mode = "n" })
--
-- wk.register({
--   ["<localleader>"] = {
--     M = {
--       name = "Molten",
--       r = { ":<C-u>MoltenEvaluateVisual<CR>gv", "evaluate visual selection" },
--     },
--   },
-- }, { mode = "v" })
--
-- Quarto -> Integrated into lazy load.
-- runner = require("quarto.runner")
--
-- wk.register({
--   ["<localleader>"] = {
--     q = {
--       name = "Quarto",
--       i = { ":QuartoActivate<cr>", "quarto activate" },
--       c = { runner.run_cell, "run cell" },
--       a = { runner.run_above, "run cell and above" },
--       A = { runner.run_all, "run all cells" },
--       l = { runner.run_line, "run line" },
--       R = {
--         function()
--           runner.run_all(true)
--         end,
--         "run all cells of all languages",
--       },
--     },
--   },
-- }, { mode = "n" })
--
-- wk.register({
--   ["<localleader>"] = {
--     q = {
--       name = "Quarto",
--       r = { runner.run_range, "run visual range" },
--     },
--   },
-- }, { mode = "v" })
--
-- vim.keymap.set("n", "<localleader>rc", runner.run_cell,  { desc = "run cell", silent = true })
-- vim.keymap.set("n", "<localleader>ra", runner.run_above, { desc = "run cell and above", silent = true })
-- vim.keymap.set("n", "<localleader>rA", runner.run_all,   { desc = "run all cells", silent = true })
-- vim.keymap.set("n", "<localleader>rl", runner.run_line,  { desc = "run line", silent = true })
-- vim.keymap.set("v", "<localleader>r",  runner.run_range, { desc = "run visual range", silent = true })
-- vim.keymap.set("n", "<localleader>RA", function()
--   runner.run_all(true)
-- end, { desc = "run all cells of all languages", silent = true })
--

-------------
-- NEOVIDE --
-------------

-- vim.g.neovide_scale_factor = 1.0
-- local change_scale_factor = function(delta)
--   vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
-- end
-- vim.keymap.set("n", "<C-=>", function()
--   change_scale_factor(1.25)
-- end)
--
-- vim.keymap.set("n", "<C-->", function()
--   change_scale_factor(1 / 1.25)
-- end)

if vim.g.neovide == true then
  vim.api.nvim_set_keymap(
    "n",
    "<C-+>",
    ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>",
    { silent = true }
  )
  vim.api.nvim_set_keymap(
    "n",
    "<C-->",
    ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>",
    { silent = true }
  )
  vim.api.nvim_set_keymap("n", "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>", { silent = true })
end
