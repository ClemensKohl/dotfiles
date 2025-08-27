-- Plugins for writing.
-- stylua: ignore
-- if true then return {} end

return {
  -- Ltex Language Server. Ltex-ls does not seem to be maintained.
  {
    "ltex-plus/ltex-ls-plus",
    dependencies = "neovim/nvim-lspconfig",
  },

  -- Enable Code Actions for Ltex-LS
  {
    "barreiroleo/ltex_extra.nvim",
    branch = "dev",
    ft = { "markdown", "tex" },
    dependencies = { "neovim/nvim-lspconfig" },
    -- yes, you can use the opts field, just I'm showing the setup explicitly
    opts = {
      load_langs = { "en-US" }, -- en-US as default
      log_level = "none",
      path = vim.fn.expand("~") .. "/.config/nvim/spell/ltex", -- project root or current working directory
    },
  },
}
