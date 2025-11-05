-- return {
--   {
--     "zbirenbaum/copilot.lua",
--     print_log_level = vim.log.levels.OFF,
--   },
-- }

return {
  -- Copilot setup
  -- TODO: Copilot Chat?
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    print_log_level = vim.log.levels.OFF,
    config = function()
      Snacks.toggle({
        name = "Github Copilot",
        get = function()
          if not vim.g.copilot_enabled then -- HACK: since it's disabled by default the below will throw error
            return false
          end
          return not require("copilot.client").is_disabled()
        end,
        set = function(state)
          if state then
            require("copilot").setup() -- setting up for the very first time
            require("copilot.command").enable()
            vim.g.copilot_enabled = true
          else
            require("copilot.command").disable()
            vim.g.copilot_enabled = false
          end
        end,
      }):map("<leader>at")
    end,
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
