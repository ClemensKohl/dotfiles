-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Set Q instead of <leader>cd to open floating diagnostic window.
-- doesnt work!
vim.keymap.set("n", "Q", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
-- vim.keymap.set("n", "Q", "<cmd>lua vim.diagnostic.open_float()<CR>")

-- configure Nvim-R keymaps
vim.keymap.set("n", "<leader>rf", "<Plug>RStart", { desc = "Start R" })
vim.keymap.set("n", "<leader>rq", "<Plug>RClose", { desc = "Close R" })
vim.keymap.set({ "n", "v" }, "<leader>rl", "<Plug>RSendLine", { desc = "Send Line to R" })
vim.keymap.set("v", "<leader>rs", "<Plug>RSendSelection", { desc = "Send Selection to R" })
vim.keymap.set("n", "<leader>rh", "<Plug>RHelp", { desc = "Open R help" })
vim.keymap.set("n", "<leader>ro", "<Plug>RUpdateObjBrowser", { desc = "Open Object Browser" })
