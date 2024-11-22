-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Switch splits with tab.

vim.keymap.set("n", "<tab>", "<C-w><C-w>", { desc = "Switch pane." })

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

if not vim.g.vscode then
  local wk = require("which-key")
  local mi = require("mini.icons") -- needs to be loaded.

  ----------------------
  -- custom functions --
  ----------------------

  vim.keymap.set("n", "<leader>uu", "<cmd>lua Toggle_colorcolumn()<cr>", { desc = "Toggle colorcolumn" })
  -- vim.keymap.set("n", "<leader>zo", "<cmd>lua Toggle_diagnostics()<cr>", { desc = "Toggle diagnostics (custom)" })
  -- vim.keymap.set("n", "<leader>zf", "<cmd>lua Turnoff_diagnostics()<cr>", { desc = "Turn off diagnostics (custom)" })
  vim.keymap.set("n", "<leader>ux", "<cmd>lua Toggle_curl()<cr>", { desc = "Toggle diagnostic curl" })
  vim.keymap.set("n", "<leader>uv", "<cmd>lua Toggle_virt()<cr>", { desc = "Toggle virtual text" })
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
    { "<leader>z", group = "Util", icon = MiniIcons.get("os", "linux") },
    -- { "<leader>zC", "<cmd>Copilot disable<cr>", desc = "stop Copilot" },
    -- { "<leader>zE", "<cmd>Copilot enable<cr>", desc = "start Copilot" },
    { "<leader>zt", "<cmd>Twilight<cr>", desc = "Toggle Twilight" },
    { "<leader>zz", "<cmd>ZenMode<cr>", desc = "Toggle ZenMode" },
  })

  ------------
  -- TreeSJ --
  ------------
  wk.add({
    { "<leader>k", group = "keymaps", icon = MiniIcons.get("lsp", "key") },
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
end

-------------
-- NEOVIDE --
-------------

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
