return {
  -- Prevent the Copilot LSP from auto-starting.
  -- The sidekick extra sets opts.servers.copilot = {} which would auto-start it.
  -- We override that here so nothing Copilot-related runs until <leader>aT.
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        copilot = { enabled = false },
      },
    },
  },

  -- Sidekick overrides:
  -- 1. NES disabled on startup (requires Copilot LSP which we prevent above).
  -- 2. <tab> rebound to ]n so our pane-switch <tab> survives.
  -- 3. <leader>aT toggles the Copilot LSP + NES together.
  {
    "folke/sidekick.nvim",
    optional = true,
    opts = {
      nes = { enabled = false },
      cli = {
        win = {
          keys = {
            files = { "<c-g>", "files", mode = "nt", desc = "open file picker" },
          },
        },
      },
    },
    keys = {
      { "<tab>", false }, -- disable sidekick's <tab> override
      { "]n", LazyVim.cmp.map({ "ai_nes" }, "]n"), mode = { "n" }, expr = true, desc = "NES: next edit" },
      {
        "<leader>aT",
        function()
          local clients = vim.lsp.get_clients({ name = "copilot" })
          if #clients > 0 then
            -- Copilot is running — stop it
            require("sidekick.nes").enable(false)
            for _, client in ipairs(clients) do
              client:stop()
            end
            vim.notify("Copilot LSP stopped", vim.log.levels.INFO)
          else
            -- Copilot is not running — start it
            vim.lsp.enable("copilot")
            require("sidekick.nes").enable(true)
            vim.notify("Copilot LSP started", vim.log.levels.INFO)
          end
        end,
        desc = "Toggle Copilot LSP + NES",
      },
    },
  },

  -- Disable CopilotChat keymaps that conflict with sidekick.
  -- NOTE: Disabled — copilot-chat extra removed from lazyvim.json.
  -- Re-enable the extra and uncomment below to restore.
  -- CopilotChat is accessed via <leader>aC* instead (see keymaps.lua).
  -- {
  --   "CopilotC-Nvim/CopilotChat.nvim",
  --   optional = true,
  --   keys = {
  --     { "<leader>aa", false },
  --     { "<leader>ap", false },
  --     { "<leader>aq", false },
  --     { "<leader>ax", false },
  --   },
  -- },
}
