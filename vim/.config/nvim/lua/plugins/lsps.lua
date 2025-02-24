return {

  -- Linters
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        markdown = { "markdownlint" },
      },
      linters = {
        markdownlint = {
          args = { "--disable", "MD013", "--" },
        },
      },
    },
  },

  -- Enable Codeactions etc. for ltex-ls
  {
    "barreiroleo/ltex_extra.nvim",
    ft = {},
    dependencies = { "neovim/nvim-lspconfig" },
    -- yes, you can use the opts field, just I'm showing the setup explicitly
    config = function()
      require("ltex_extra").setup({
        load_langs = { "en-US" }, -- en-US as default
        -- boolean : whether to load dictionaries on startup
        init_check = true,
        -- string : relative or absolute path to store dictionaries
        -- e.g. subfolder in the project root or the current working directory: ".ltex"
        -- e.g. shared files for all projects:  vim.fn.expand("~") .. "/.local/share/ltex"
        path = vim.fn.expand("~") .. "/.local/share/ltex", -- project root or current working directory
        -- string : "none", "trace", "debug", "info", "warn", "error", "fatal"
        log_level = "none",
        -- table : configurations of the ltex language server.
        -- Only if you are calling the server from ltex_extra
        server_opts = {
          -- capabilities = your_capabilities,
          on_attach = function(client, bufnr)
            -- your on_attach process
          end,
          settings = {
            ltex = {
              -- use_spellfile = true,
              autostart = false,
              -- on_attach = on_attach,
              -- capabilities = capabilities,
              filetypes = {},
              settings = {
                ltex = {
                  checkFrequency = "save",
                  -- language = { "en-US", "de-DE" },
                  -- language = "de-DE",
                  additionalRules = {
                    languageModel = "~/.local/share/ngrams/",
                    enablePickyRules = true,
                    motherTongue = "de",
                  },
                  -- disabledRules = {
                  --   ["en"] = { "MORFOLOGIK_RULE_EN" },
                  --   -- ["en-AU"] = { "MORFOLOGIK_RULE_EN_AU" },
                  --   -- ["en-CA"] = { "MORFOLOGIK_RULE_EN_CA" },
                  --   ["en-GB"] = { "MORFOLOGIK_RULE_EN_GB" },
                  --   -- ["en-NZ"] = { "MORFOLOGIK_RULE_EN_NZ" },
                  --   ["en-US"] = { "MORFOLOGIK_RULE_EN_US" },
                  --   -- ["en-ZA"] = { "MORFOLOGIK_RULE_EN_ZA" },
                  --   -- ["es"] = { "MORFOLOGIK_RULE_ES" },
                  --   ["it"] = { "MORFOLOGIK_RULE_IT_IT" },
                  --   ["de"] = { "MORFOLOGIK_RULE_DE_DE" },
                  -- },
                },
              },
            },
          },
        },
      })
    end,
  },
}
