-- return {
--   {
--     "zbirenbaum/copilot.lua",
--     print_log_level = vim.log.levels.OFF,
--   },
-- }

return {
  -- Copilot setup
  -- The toggle is in `keys` so the keymap exists before the plugin loads.
  -- Pressing <leader>aT lazy-loads copilot.lua, runs setup, and enables it.
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    print_log_level = vim.log.levels.OFF,
    keys = {
      {
        "<leader>aT",
        function()
          if not _G._copilot_toggle then
            _G._copilot_toggle = Snacks.toggle({
              name = "Github Copilot",
              get = function()
                if not vim.g.copilot_enabled then
                  return false
                end
                return not require("copilot.client").is_disabled()
              end,
              set = function(state)
                if state then
                  require("copilot").setup()
                  require("copilot.command").enable()
                  vim.g.copilot_enabled = true
                else
                  require("copilot.command").disable()
                  vim.g.copilot_enabled = false
                end
              end,
            })
          end
          _G._copilot_toggle:toggle()
        end,
        desc = "Toggle Github Copilot",
      },
    },
  },

  -- Override sidekick's <tab> (NES) to ]n so our pane-switch <tab> survives.
  {
    "folke/sidekick.nvim",
    optional = true,
    keys = {
      { "<tab>", false }, -- disable sidekick's <tab> override
      { "]n", LazyVim.cmp.map({ "ai_nes" }, "]n"), mode = { "n" }, expr = true, desc = "NES: next edit" },
    },
  },

  -- Disable CopilotChat keymaps that conflict with sidekick.
  -- CopilotChat is accessed via <leader>aC* instead (see keymaps.lua).
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    optional = true,
    keys = {
      { "<leader>aa", false },
      { "<leader>ap", false },
      { "<leader>aq", false },
      { "<leader>ax", false },
    },
  },

  -- {
  --   "CopilotC-Nvim/CopilotChat.nvim",
  --   keys = {
  --     -- { "<c-s>", "<CR>", ft = "copilot-chat", desc = "Submit Prompt", remap = true },
  --     -- { "<leader>a", "", desc = "+ai", mode = { "n", "x" } },
  --     {
  --       "<leader>ac",
  --       function()
  --         return require("CopilotChat").toggle()
  --       end,
  --       desc = "Toggle (CopilotChat)",
  --       mode = { "n", "x" },
  --     },
  --     {
  --       "<leader>ax",
  --       function()
  --         return require("CopilotChat").reset()
  --       end,
  --       desc = "Clear (CopilotChat)",
  --       mode = { "n", "x" },
  --     },
  --     {
  --       "<leader>aq",
  --       function()
  --         vim.ui.input({
  --           prompt = "Quick Chat: ",
  --         }, function(input)
  --           if input ~= "" then
  --             require("CopilotChat").ask(input)
  --           end
  --         end)
  --       end,
  --       desc = "Quick Chat (CopilotChat)",
  --       mode = { "n", "x" },
  --     },
  --     {
  --       "<leader>aP",
  --       function()
  --         require("CopilotChat").select_prompt()
  --       end,
  --       desc = "Prompt Actions (CopilotChat)",
  --       mode = { "n", "x" },
  --     },
  --   },
  --   config = function(_, opts)
  --     local chat = require("CopilotChat")
  --
  --     vim.api.nvim_create_autocmd("BufEnter", {
  --       pattern = "copilot-chat",
  --       callback = function()
  --         vim.opt_local.relativenumber = false
  --         vim.opt_local.number = false
  --       end,
  --     })
  --
  --     chat.setup(opts)
  --   end,
  -- },
}
