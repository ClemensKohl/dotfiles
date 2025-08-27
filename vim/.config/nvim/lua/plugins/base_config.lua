-- Plugins loaded by clemens.

return {
  -- disable mini.surround
  -- I don't like it.
  -- { "echasnovski/mini.pairs", enabled = false },

  -- Configure LSP
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- inlay_hints = { enabled = true }, -- not necessary in new lazyvim
      -- options for vim.diagnostic.config()
      diagnostics = {
        -- signs = true,
        underline = true,
        update_in_insert = false,
        virtual_text = false,
        inlay_hints = {
          enabled = true,
          exclude = { "tex", "latex" }, -- filetypes for which you don't want to enable inlay hints
        },
        float = {
          show_header = true,
          source = "if_many",
          border = "rounded",
          focusable = false,
        },
        severity_sort = true,
      },
      servers = {
        air = {
          on_attach = function(_, bufnr)
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format()
              end,
            })
          end,
        },
        r_language_server = {
          on_attach = function(client, _)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          end,
        },
        texlab = {
          inlayHints = {
            maxLength = 10,
          },
        },
        ltex = {
          --   use_spellfile = false,
          autostart = true,
          --   -- on_attach = on_attach,
          --   -- capabilities = capabilities,
          filetypes = { "tex", "md" },
          settings = {
            ltex = {
              checkFrequency = "save",
              language = "en-US",
              -- language = "de-DE",
              additionalRules = {
                languageModel = "~/.local/share/ngrams/",
                -- enablePickyRules = true,
                motherTongue = "de",
              },
              disabledRules = {
                ["en"] = { "MORFOLOGIK_RULE_EN" },
                -- ["en-AU"] = { "MORFOLOGIK_RULE_EN_AU" },
                -- ["en-CA"] = { "MORFOLOGIK_RULE_EN_CA" },
                ["en-GB"] = { "MORFOLOGIK_RULE_EN_GB" },
                -- ["en-NZ"] = { "MORFOLOGIK_RULE_EN_NZ" },
                ["en-US"] = { "MORFOLOGIK_RULE_EN_US" },
                -- ["en-ZA"] = { "MORFOLOGIK_RULE_EN_ZA" },
                -- ["es"] = { "MORFOLOGIK_RULE_ES" },
                ["it"] = { "MORFOLOGIK_RULE_IT_IT" },
                ["de"] = { "MORFOLOGIK_RULE_DE_DE" },
              },
            },
          },
        },
      },
    },
  },

  -- Very basic conform setup
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        quarto = { "injected" },
        rmd = { "injected" },
        r = { "air" },
      },
    },
  },

  -- Extends default treesitter config.
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "bash",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "regex",
        "vim",
        "r",
        "rnoweb",
        "julia",
        "vim",
        "vimdoc",
        "luadoc",
        "json",
        "html",
        "yaml",
        "c",
        "cpp",
        "rust",
        "bibtex",
        "latex",
        "query",
      })
    end,
  },

  -- Configure treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
      },
    },
    opts = {
      indent = {
        enable = true,
        disable = { "r" },
      },
      highlight = {
        enable = true, -- false will disable the whole extension
        disable = { "latex", "tex" }, -- list of language that will be disabled
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]]"] = "@class.inner",
          },
          goto_next_end = {
            ["]M"] = "@function.outer",
            ["]["] = "@class.outer",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[["] = "@class.inner",
          },
          goto_previous_end = {
            ["[M"] = "@function.outer",
            ["[]"] = "@class.outer",
          },
        },
      },
    },
  },

  -- Configure Mason
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "r-languageserver",
        "bash-language-server",
        "clangd",
        "rust-analyzer",
        "ltex-ls",
        "markdownlint",
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

  -- -- Install window picker for neo-tree
  -- {
  --   "s1n7ax/nvim-window-picker",
  --   version = "2.*",
  --   config = function()
  --     require("window-picker").setup({
  --       filter_rules = {
  --         include_current_win = false,
  --         autoselect_one = true,
  --         -- filter using buffer options
  --         bo = {
  --           -- if the file type is one of following, the window will be ignored
  --           filetype = { "neo-tree", "neo-tree-popup", "notify" },
  --           -- if the buffer type is one of following, the window will be ignored
  --           buftype = { "terminal", "quickfix" },
  --         },
  --       },
  --     })
  --   end,
  -- },

  -- -- Configure neo-tree
  -- {
  --   "nvim-neo-tree/neo-tree.nvim",
  --   requires = {
  --     "s1n7ax/nvim-window-picker",
  --     -- "nvim-lua/plenary.nvim",
  --     -- "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
  --     -- "MunifTanjim/nui.nvim",
  --     -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  --   },
  --   mappings = {
  --     -- ["<cr>"] = "open",
  --     ["<cr>"] = "open_with_window_picker",
  --     -- ["S"] = "open_split",
  --     -- ["s"] = "open_vsplit",
  --     ["S"] = "split_with_window_picker",
  --     ["w"] = "open_with_window_picker",
  --     ["s"] = "vsplit_with_window_picker",
  --     ["Z"] = function(state)
  --       local node = state.tree:get_node()
  --       require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
  --     end,
  --   },
  -- },

  -- Use telescope to switch tabs
  -- {
  --   "LukasPietzschmann/telescope-tabs",
  --   config = function()
  --     require("telescope").load_extension("telescope-tabs")
  --     require("telescope-tabs").setup({
  --       -- Your custom config :^)
  --     })
  --   end,
  --   dependencies = { "nvim-telescope/telescope.nvim" },
  -- },

  {
    "Wansmer/treesj",
    keys = { "gom", "goj", "gos" },
    dependencies = { "nvim-treesitter/nvim-treesitter" }, -- if you install parsers with `nvim-treesitter`
    config = function()
      require("treesj").setup({
        use_default_keymaps = false,
      })
    end,
  },
  { "echasnovski/mini.align", version = "*", opts = {} },
}
