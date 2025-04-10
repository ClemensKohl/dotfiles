-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- vim.keymap.set("n", "<M-/>", function()
--   Snacks.terminal.toggle()
-- end, { desc = "Terminal Toggle" })

-- Switch splits with tab.
vim.keymap.set("n", "<tab>", "<C-w><C-w>", { desc = "Switch pane." })
-- Exit terminal mode with Esc.
vim.keymap.set("t", "<Esc>", "<C-\\><C-N>", { noremap = true, desc = "Leave terminal mode" })
--TODO: Add as many as possible directly to plugin config.
--This way you can easily disable both the plugin and the keymaps.

-- Set Q instead of <leader>cd to open floating diagnostic window.
vim.keymap.set("n", "Q", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

-- allow movement to the right in insert mode
vim.keymap.set("i", "<C-l>", "<Esc>la")

-- Buffers/tabs with telescope
-- vim.keymap.set("n", "<leader>bf", ":Telescope buffers show_all_buffers=true<CR>", { desc = "Show All Buffers" })
-- vim.keymap.set("n", "<leader><Tab>t", ":Telescope telescope-tabs list_tabs<CR>", { desc = "Show All Tabs" })

vim.keymap.set(
  "n",
  "<F5>",
  ":let _s=@/<Bar>:%s/\\s\\+$//e<Bar>:let @/=_s<Bar><CR>",
  { desc = "Trim trailing whitespace" }
)

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
  -- vim.keymap.set("n", "<localleader>k", "<cmd>Telescope thesaurus lookup<CR>")

  -----------
  -- Utils --
  -----------

  wk.add({
    { "<leader>z", group = "Util", icon = MiniIcons.get("os", "linux") },
    -- { "<leader>zC", "<cmd>Copilot disable<cr>", desc = "stop Copilot" },
    -- { "<leader>zE", "<cmd>Copilot enable<cr>", desc = "start Copilot" },
    -- { "<leader>zt", "<cmd>Twilight<cr>", desc = "Toggle Twilight" },
    -- { "<leader>zz", "<cmd>ZenMode<cr>", desc = "Toggle ZenMode" },
    { "<leader>zv", ":vsplit | lua vim.lsp.buf.definition()<CR>", desc = "Goto definition in split" },
    { "<leader>zh", "<cmd>lua MiniHipatterns.toggle()<cr>", desc = "Toggle Colors Highlighting" },
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
