-- Plugins loaded by clemens.

return {

  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  { "sainnhe/gruvbox-material" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material", -- alternative: gruvbox-material
      gruvbox_material_background = "medium",
      gruvbox_material_better_performance = 1,
    },
  },

  -- Configure LSP
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- options for vim.diagnostic.config()
      diagnostics = {
        underline = false,
        update_in_insert = false,
        virtual_text = false,
        -- virtual_text = {
        --   spacing = 4,
        --   source = "if_many",
        --   prefix = "●",
        --   -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
        --   -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
        --   -- prefix = "icons",
        -- },
        severity_sort = true,
      },
    },
  },

  -- Configure treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "regex",
        "vim",
        "r",
      },
      indent = {
        enable = true,
        disable = { "r" },
      },
    },
  },

  -- Configure Mason
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "r-languageserver",
        "bash-language-server",
        "pyright",
      },
    },
  },

  -- popup for goto definition etc previews.
  {
    "rmagatti/goto-preview",
    config = function()
      require("goto-preview").setup({
        width = 120, -- Width of the floating window
        height = 25, -- Height of the floating window
        default_mappings = true, -- Bind default mappings
        debug = false, -- Print debug information
        opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
        post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
      })
    end,
  },

  -- Integration with R.
  {
    "jalvesaq/Nvim-R",
  },
}
