-- Plugins loaded by clemens.

-- ===========================================
--  Add user dictionary for ltex-ls
--  * en.utf-8.add must be created using `zg` when set spell is on
-- ===========================================
-- local path = vim.fn.stdpath("config") .. "/spell/en.utf-8.add"
-- DICT_words = {}
--
-- for word in io.open(path, "r"):lines() do
--   table.insert(DICT_words, word)
-- end

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
        -- virtual_text = {
        --   spacing = 4,
        --   source = "if_many",
        --   prefix = "●",
        --   -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
        --   -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
        --   -- prefix = "icons",
        -- },
        float = {
          show_header = true,
          source = "if_many",
          border = "rounded",
          focusable = false,
        },
        severity_sort = true,
      },
      servers = {
        ltex = {
          use_spellfile = false,
          on_attach = on_attach,
          capabilities = capabilities,
          filetypes = { "latex", "tex" },
          settings = {
            ltex = {
              disabledRules = {
                ["en"] = { "MORFOLOGIK_RULE_EN" },
                ["en-AU"] = { "MORFOLOGIK_RULE_EN_AU" },
                ["en-CA"] = { "MORFOLOGIK_RULE_EN_CA" },
                ["en-GB"] = { "MORFOLOGIK_RULE_EN_GB" },
                ["en-NZ"] = { "MORFOLOGIK_RULE_EN_NZ" },
                ["en-US"] = { "MORFOLOGIK_RULE_EN_US" },
                ["en-ZA"] = { "MORFOLOGIK_RULE_EN_ZA" },
                ["es"] = { "MORFOLOGIK_RULE_ES" },
                ["it"] = { "MORFOLOGIK_RULE_IT_IT" },
                ["de"] = { "MORFOLOGIK_RULE_DE_DE" },
              },
              -- dictionary = {
              --   ["en-US"] = DICT_words,
              --   ["en-GB"] = DICT_words,
              -- },
              language = "en-US",
              -- language = "de-DE",
              additionalRules = {
                languageModel = "~/.local/share/ngrams/",
              },
              dictionary = (function()
                -- For dictionary, search for files in the runtime to have
                -- and include them as externals the format for them is
                -- dict/{LANG}.txt
                --
                -- Also add dict/default.txt to all of them
                local files = {}
                for _, file in ipairs(vim.api.nvim_get_runtime_file("dict/*", true)) do
                  local lang = vim.fn.fnamemodify(file, ":t:r")
                  local fullpath = vim.fs.normalize(file, ":p")
                  files[lang] = { ":" .. fullpath }
                end

                if files.default then
                  for lang, _ in pairs(files) do
                    if lang ~= "default" then
                      vim.list_extend(files[lang], files.default)
                    end
                  end
                  files.default = nil
                end
                return files
              end)(),
            },
          },
        },
      },
    },
  },

  -- Configure treesitter
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   opts = {
  --     indent = {
  --       enable = true,
  --       disable = { "r" },
  --     },
  --   },
  -- },

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
      })
    end,
  },

  -- Configure Mason
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "r-languageserver",
        "bash-language-server",
        "pyright",
        "clangd",
        "rust-analyzer",
        "texlab",
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

  -- Install window picker for neo-tree
  {
    "s1n7ax/nvim-window-picker",
    version = "2.*",
    config = function()
      require("window-picker").setup({
        filter_rules = {
          include_current_win = false,
          autoselect_one = true,
          -- filter using buffer options
          bo = {
            -- if the file type is one of following, the window will be ignored
            filetype = { "neo-tree", "neo-tree-popup", "notify" },
            -- if the buffer type is one of following, the window will be ignored
            buftype = { "terminal", "quickfix" },
          },
        },
      })
    end,
  },

  -- Configure neo-tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    requires = {
      "s1n7ax/nvim-window-picker",
      -- "nvim-lua/plenary.nvim",
      -- "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      -- "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    mappings = {
      -- ["<cr>"] = "open",
      ["<cr>"] = "open_with_window_picker",
      -- ["S"] = "open_split",
      -- ["s"] = "open_vsplit",
      ["S"] = "split_with_window_picker",
      ["w"] = "open_with_window_picker",
      ["s"] = "vsplit_with_window_picker",
      ["Z"] = function(state)
        local node = state.tree:get_node()
        require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
      end,
    },
  },

  -- Use telescope to switch tabs
  {
    "LukasPietzschmann/telescope-tabs",
    config = function()
      require("telescope").load_extension("telescope-tabs")
      require("telescope-tabs").setup({
        -- Your custom config :^)
      })
    end,
    dependencies = { "nvim-telescope/telescope.nvim" },
  },

  -- {
  --   "folke/flash.nvim",
  --   keys = {
  --     {
  --       "m",
  --       mode = "o",
  --       function()
  --         require("flash").jump({
  --           remote_op = {
  --             motion = true,
  --             restore = false,
  --           },
  --         })
  --       end,
  --       desc = "Magnetic",
  --     },
  --   },
  -- },
}
