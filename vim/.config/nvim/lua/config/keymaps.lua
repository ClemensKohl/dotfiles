-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

--TODO: Add as many as possible directly to plugin config.
--This way you can easily disable both the plugin and the keymaps.

-- Switch splits with tab.
vim.keymap.set("n", "<tab>", "<C-w><C-w>")
-- Set Q instead of <leader>cd to open floating diagnostic window.
vim.keymap.set("n", "Q", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
-- Goto definition in new split.
vim.keymap.set("n", "<leader>zv", ":vsplit | lua vim.lsp.buf.definition()<CR>")
-- Toggle Color highlighting of Hex codes
vim.keymap.set("n", "<leader>zh", "<cmd>lua MiniHipatterns.toggle()<cr>", { desc = "Toggle Colors Highlighting" })
-- Buffers/tabs with telescope
vim.keymap.set("n", "<leader>bf", ":Telescope buffers show_all_buffers=true<CR>", { desc = "Show All Buffers" })
vim.keymap.set("n", "<leader><Tab>t", ":Telescope telescope-tabs list_tabs<CR>", { desc = "Show All Tabs" })

-- vim.keymap.set("n", "<leader>cB", ":s/, /,\\r/g<cr>", { desc = "Break line" })
vim.keymap.set(
  "n",
  "gob",
  ":s/\\((\\zs\\|,\\ *\\zs\\|)\\)/\\r&/g<CR><Bar>:'[,']normal ==<CR>",
  { desc = "Break Line and align" }
)

vim.keymap.set(
  "n",
  "<F5>",
  ":let _s=@/<Bar>:%s/\\s\\+$//e<Bar>:let @/=_s<Bar><CR>",
  { desc = "Trim trailing whitespace" }
)
-- Function to format function arguments
local function format_arguments()
  -- Get the current line
  local line = vim.api.nvim_get_current_line()

  -- Find the start and end of the argument list
  local start_pos = line:find("%(")
  local end_pos = line:find("%)")

  if not start_pos or not end_pos then
    print("No function arguments found on the current line.")
    return
  end

  -- Extract the arguments
  local args = line:sub(start_pos + 1, end_pos - 1)

  -- Split the arguments by comma
  local formatted_args = {}
  for arg in args:gmatch("[^,]+") do
    table.insert(formatted_args, arg:match("^%s*(.-)%s*$")) -- Trim whitespace
  end

  -- Create the new formatted line
  local new_lines = {}
  table.insert(new_lines, line:sub(1, start_pos) .. "(")
  for _, arg in ipairs(formatted_args) do
    table.insert(new_lines, "  " .. arg .. ",")
  end
  new_lines[#new_lines] = new_lines[#new_lines]:gsub(",$", "") -- Remove trailing comma
  table.insert(new_lines, ")" .. line:sub(end_pos + 1))

  -- Set the new lines
  vim.api.nvim_buf_set_lines(0, vim.fn.line(".") - 1, vim.fn.line("."), false, new_lines)
end

-- Create a command to call the function
vim.api.nvim_create_user_command("FormatArgs", format_arguments, {})

-- Keymap to format function arguments
vim.api.nvim_set_keymap("n", "<leader>c,", ":FormatArgs<CR>", { noremap = true, silent = true })

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

-- Todo_hl = vim.api.nvim_get_hl_id_by_name("Todo")
-- TODO: Doesnt work yet.
vim.keymap.set(
  "n",
  "<localleader>lh",
  "<cmd>lua vim.api.nvim_set_hl(0, 'Todo', Todo_hl_settings)<cr>",
  { desc = "Todo highlights" }
)

---------------
-- Thesaurus --
---------------
vim.keymap.set("n", "<localleader>k", "<cmd>Telescope thesaurus lookup<CR>")

-----------
-- Utils --
-----------

wk.add({
  { "<leader>z", group = "Util" },
  { "<leader>zC", "<cmd>Copilot disable<cr>", desc = "stop Copilot" },
  { "<leader>zE", "<cmd>Copilot enable<cr>", desc = "start Copilot" },
  { "<leader>zt", "<cmd>Twilight<cr>", desc = "Toggle Twilight" },
  { "<leader>zz", "<cmd>ZenMode<cr>", desc = "Toggle ZenMode" },
})

wk.add({
  { "<leader>k", group = "keymaps" },
  { "<leader>km", require("treesj").toggle, desc = "TreeSJ Toggle" },
  {
    "<leader>kM",
    function()
      require("treesj").toggle({ split = { recursive = true } })
    end,
    desc = "TreeSJ Recursive Toggle",
  },
  { "<leader>ks", require("treesj").split, desc = "TreeSJ Split" },
  { "<leader>kj", require("treesj").join, desc = "TreeSJ Join" },
})

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

wk.add({
  { "<leader>zd", group = "Upload / Download" },
  { "<leader>zdd", "<cmd>TransferDownload<cr>", desc = "Download from remote server (scp)" },
  { "<leader>zdf", "<cmd>DiffRemote<cr>", desc = "Diff file with remote server (scp)" },
  { "<leader>zdi", "<cmd>TransferInit<cr>", desc = "Init/Edit Deployment config" },
  { "<leader>zdr", "<cmd>TransferRepeat<cr>", desc = "Repeat transfer command" },
  { "<leader>zdu", "<cmd>TransferUpload<cr>", desc = "Upload to remote server (scp)" },
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
