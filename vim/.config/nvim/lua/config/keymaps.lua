-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Set Q instead of <leader>cd to open floating diagnostic window.
vim.keymap.set("n", "Q", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

-- Buffers/tabs with telescope
vim.keymap.set("n", "<leader>bf", ":Telescope buffers show_all_buffers=true<CR>", { desc = "Show All Buffers" })
vim.keymap.set("n", "<leader>bt", ":Telescope telescope-tabs list_tabs<CR>", { desc = "Show All Tabs" })

-- configure Nvim-R keymaps
-- vim.keymap.set("n", "<leader>rf", "<Plug>RStart", { desc = "Start R" })
-- vim.keymap.set("n", "<leader>rq", "<Plug>RClose", { desc = "Close R" })
-- vim.keymap.set({ "n", "v" }, "<leader>rl", "<Plug>RSendLine", { desc = "Send Line to R" })
-- vim.keymap.set("v", "<leader>rs", "<Plug>RSendSelection", { desc = "Send Selection to R" })
-- vim.keymap.set("n", "<leader>rh", "<Plug>RHelp", { desc = "Open R help" })
-- vim.keymap.set("n", "<leader>ro", "<Plug>RUpdateObjBrowser", { desc = "Open Object Browser" })

local wk = require("which-key")

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
----------------
-- ToggleTerm --
----------------

wk.register({
  t = {
    name = "ToggleTerm", -- optional group name
    f = {
      "function() set_opfunc(function(motion_type) require('toggleterm').send_lines_to_terminal(motion_type, false, { args = vim.v.count }) end) vim.api.nvim_feedkeys('g@', 'n', false) end)<cr>",
      "Send Line",
    },
  },
}, { prefix = "<leader>", mode = "n" })

wk.register({
  t = {
    name = "ToggleTerm", -- optional group name
    l = {
      "<cmd>require('toggleterm').send_lines_to_terminal('single_line', trim_spaces, { args = vim.v.count })<cr>",
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
vim.keymap.set("n", [[<leader><c-\>]], function()
  set_opfunc(function(motion_type)
    require("toggleterm").send_lines_to_terminal(motion_type, false, { args = vim.v.count })
  end)
  vim.api.nvim_feedkeys("g@", "n", false)
end)

-- Double the command to send line to terminal
-- vim.keymap.set("n", [[<leader><c-\><c-\>]], function()
--   set_opfunc(function(motion_type)
--     require("toggleterm").send_lines_to_terminal(motion_type, false, { args = vim.v.count })
--   end)
--   vim.api.nvim_feedkeys("g@_", "n", false)
-- end)
--
-- Send whole file
vim.keymap.set("n", [[<leader><leader><c-\>]], function()
  set_opfunc(function(motion_type)
    require("toggleterm").send_lines_to_terminal(motion_type, false, { args = vim.v.count })
  end)
  vim.api.nvim_feedkeys("ggg@G''", "n", false)
end)

-- custom functions
vim.keymap.set("n", "<leader>uu", "<cmd>lua Toggle_colorcolumn()<cr>", { desc = "Toggle colorcolumn" })
