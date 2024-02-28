-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Set Q instead of <leader>cd to open floating diagnostic window.
vim.keymap.set("n", "Q", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

-- Buffers/tabs with telescope
vim.keymap.set("n", "<leader>bf", ":Telescope buffers show_all_buffers=true<CR>", { desc = "Show All Buffers" })
vim.keymap.set("n", "<leader>bt", ":Telescope telescope-tabs list_tabs<CR>", { desc = "Show All Tabs" })

local wk = require("which-key")

------------
-- Notify --
------------

wk.register({
  u = {
    M = { "<cmd>lua require('noice').cmd('last')<cr>", "Noice Last Message" },
    H = { "<cmd>lua require('noice').cmd('history')<cr>", "Noice History" },
    A = { "<cmd>lua require('noice').cmd('dismiss')<cr>", "Noice All" },
    D = { "<cmd>lua require('noice').cmd('dismiss')<cr>", "Dismiss All" },
    N = { "<cmd>:Telescope notify<cr>", "Notify History" },
  },
}, { prefix = "<leader>" })

------------
-- Nvim-R --
------------

wk.register({
  r = {
    name = "Nvim-R", -- optional group name
    f = { "<Plug>RStart", "Start R" },
    q = { "<Plug>RClose", "Close R" },
    l = { "<Plug>RSendLine", "Send Line to R" },
    s = { "<Plug>RSendSelection", "Send Selection to R" },
    h = { "<Plug>RHelp", "Open R Help" },
    o = { "<Plug>RUpdateObjBrowser", "Open Object Browser" },
    c = { "<Plug>RSendChunk", "Send Rmd Chunk" },
    d = { "<Plug>RDSendChunk", "Send Rmd Chunk (DOWN)" },
  },
}, { prefix = "<leader>" })

wk.register({
  r = {
    name = "Nvim-R", -- optional group name
    s = { "<Plug>RSendSelection", "Send Selection to R" },
  },
}, { prefix = "<leader>", mode = "v" })

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

wk.register({
  t = {
    name = "ToggleTerm", -- optional group name
    f = {
      "lua function() set_opfunc(function(motion_type) require('toggleterm').send_lines_to_terminal(motion_type, false, { args = vim.v.count }) end) vim.api.nvim_feedkeys('g@', 'n', false) end)<cr>",
      "Send Line",
    },
  },
}, { prefix = "<leader>", mode = "n" })

wk.register({
  t = {
    name = "ToggleTerm", -- optional group name
    l = {
      "<cmd>lua require('toggleterm').send_lines_to_terminal('single_line', trim_spaces, { args = vim.v.count })<cr>",
      "Send Line",
    },
  },
}, { prefix = "<leader>", mode = "v" })

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

-- custom functions
vim.keymap.set("n", "<leader>uu", "<cmd>lua Toggle_colorcolumn()<cr>", { desc = "Toggle colorcolumn" })

--------------
-- Transfer --
--------------

wk.register({
  ["<leader>"] = {
    z = {
      name = "Upload / Download",
      d = { "<cmd>TransferDownload<cr>", "Download from remote server (scp)" },
      u = { "<cmd>TransferUpload<cr>", "Upload to remote server (scp)" },
      f = { "<cmd>DiffRemote<cr>", "Diff file with remote server (scp)" },
      i = { "<cmd>TransferInit<cr>", "Init/Edit Deployment config" },
      r = { "<cmd>TransferRepeat<cr>", "Repeat transfer command" },
    },
  },
})
