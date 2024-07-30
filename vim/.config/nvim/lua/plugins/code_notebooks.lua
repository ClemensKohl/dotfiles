-- all the modules can easily be turned off:
-- stylua: ignore
-- if true then return {} end

if vim.g.neovide then -- Put anything you want to happen only in Neovide here
  if true then return {} end
end

return {
  {
    "MeanderingProgrammer/markdown.nvim",
    opts = {
      file_types = { "markdown", "norg", "rmd", "org", "quarto" },
      code = {
        sign = false,
        width = "block",
        right_pad = 1,
      },
      heading = {
        sign = false,
        icons = {},
        -- icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
      },
    },
    ft = { "markdown", "norg", "rmd", "org", "quarto" },
  },

  -- Work in Jupyter Notebooks.
  {
    "benlubas/molten-nvim",
    -- version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
    dependencies = { "3rd/image.nvim" },
    build = ":UpdateRemotePlugins",
    init = function()
      -- these are examples, not defaults. Please see the readme
      vim.g.molten_image_provider = "image.nvim"
      vim.g.molten_output_win_max_height = 20
      -- I find auto open annoying, keep in mind setting this option will require setting
      -- a keybind for `:noautocmd MoltenEnterOutput` to open the output again
      vim.g.molten_auto_open_output = false

      -- optional, I like wrapping. works for virt text and the output window
      vim.g.molten_wrap_output = true

      -- Output as virtual text. Allows outputs to always be shown, works with images, but can
      -- be buggy with longer images
      vim.g.molten_virt_text_output = true

      -- this will make it so the output shows up below the \`\`\` cell delimiter
      vim.g.molten_virt_lines_off_by_1 = true
    end,
    keys = {
      { "<localleader><localleader>i", ":MoltenInit<CR>", mode = "n", desc = "Init Molten" },
      { "<localleader><localleader>e", ":MoltenEvaluateOperator<CR>", mode = "n", desc = "run operator selection" },
      { "<localleader><localleader>l", ":MoltenEvaluateLine<CR>", mode = "n", desc = "evaluate line" },
      { "<localleader><localleader>r", ":MoltenReevaluateCell<CR>", mode = "n", desc = "re-evaluate cell" },
      { "<localleader><localleader>s", ":noautocmd MoltenEnterOutput<CR>", mode = "n", desc = "open output window" },
      { "<localleader><localleader>h", ":MoltenHideOutput<CR>", mode = "n", desc = "close output window" },
      { "<localleader><localleader>d", ":MoltenDelete<CR>", mode = "n", desc = "delete Molten cell" },
      {
        "<localleader><localleader>r",
        ":<C-u>MoltenEvaluateVisual<CR>gv",
        mode = "v",
        desc = "evaluate visual selection",
      },
    },
  },

  -- image.nvim - required for image showing in molten.
  {
    "3rd/image.nvim",
    event = "VeryLazy",
    enabled = function()
      if vim.g.neovide then -- Disables plugin when starting neovide.
        return false
      else
        return true
      end
    end,
    opts = {
      backend = "kitty",
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
        },
        neorg = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          filetypes = { "norg" },
        },
      },
      kitty_method = "normal",
      max_width = 200, -- tweak to preference (was: 100)
      max_height = 24, -- ^ (was: 12)
      max_height_window_percentage = math.huge, -- this is necessary for a good experience
      max_width_window_percentage = math.huge,
      window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
      window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
      editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
      tmux_show_only_in_active_window = false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
      hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" }, -- render image files as images when opened
    },
  },

  -- Make Jupyter notebooks into text files
  {
    "GCBallesteros/jupytext.nvim",
    config = function()
      require("jupytext").setup({
        style = "quarto",
        output_extension = "qmd",
        force_ft = "quarto",
      })
    end,
    -- Depending on your nvim distro or config you may need to make the loading not lazy
    -- lazy=false,
  },

  ------------------------
  -- Quarto kickstarter --
  ------------------------
  -- Combination of the configs from the 2 links below.
  -- Remove if not using quarto
  -- https://github.com/jmbuhr/lazyvim-starter-for-quarto/blob/main/lua/plugins/quarto.lua
  -- https://github.com/benlubas/molten-nvim/blob/main/docs/Notebook-Setup.md

  -- NOTE:commented out by cle. Uncomment if there are problems!
  -- this taps into vim.ui.select and vim.ui.input
  -- and in doing so currently breaks renaming in otter.nvim
  -- { "stevearc/dressing.nvim", enabled = false },

  {
    "quarto-dev/quarto-nvim",
    dev = false,
    opts = {
      lspFeatures = {
        languages = { "r", "R", "python", "bash" },
        chunks = "all",
        diagnostics = {
          enabled = true,
          triggers = { "BufWritePost" },
        },
        completion = {
          enabled = true,
        },
      },
      -- keymap = {
      -- NOTE: setup your own keymaps:
      --   hover = "H",
      --   definition = "gd",
      --   rename = "<localleader>rn",
      --   references = "gr",
      --   format = "<localleader>gf",
      -- },
      codeRunner = {
        enabled = true,
        default_method = "molten",
      },
    },
    ft = { "quarto", "markdown", "ipython" },
    keys = {
      { "<localleader>qi", "<cmd>QuartoActivate<cr>", mode = "n", desc = "quarto activate" },
      { "<localleader>qc", "<cmd>lua require('quarto.runner').run_cell()<cr>", mode = "n", desc = "run cell" },
      {
        "<localleader>qa",
        "<cmd>lua require('quarto.runner').run_above()<cr>",
        mode = "n",
        desc = "run cell and above",
      },
      { "<localleader>qA", "<cmd>lua require('quarto.runner').run_all()<cr>", mode = "n", desc = "run all cells" },
      { "<localleader>ql", "<cmd>lua require('quarto.runner').run_line()<cr>", mode = "n", desc = "run line" },
      {
        "<localleader>qR",
        function()
          require("quarto.runner").run_all(true)
        end,
        mode = "n",
        desc = "run all cells of all languages",
      },
      { "<localleader>qr", "<cmd>lua require('quarto.runner').run_range()<cr>", mode = "v", desc = "run visual range" },
    },
    -- keys = {
    --   { "<leader>qa", ":QuartoActivate<cr>", desc = "quarto activate" },
    --   { "<leader>qp", ":lua require'quarto'.quartoPreview()<cr>", desc = "quarto preview" },
    --   { "<leader>qq", ":lua require'quarto'.quartoClosePreview()<cr>", desc = "quarto close" },
    --   { "<leader>qh", ":QuartoHelp ", desc = "quarto help" },
    --   { "<leader>qe", ":lua require'otter'.export()<cr>", desc = "quarto export" },
    --   { "<leader>qE", ":lua require'otter'.export(true)<cr>", desc = "quarto export overwrite" },
    --   { "<leader>qrr", ":QuartoSendAbove<cr>", desc = "quarto run to cursor" },
    --   { "<leader>qra", ":QuartoSendAll<cr>", desc = "quarto run all" },
    --   { "<leader><cr>", ":SlimeSend<cr>", desc = "send code chunk" },
    --   { "<c-cr>", ":SlimeSend<cr>", desc = "send code chunk" },
    --   { "<c-cr>", "<esc>:SlimeSend<cr>i", mode = "i", desc = "send code chunk" },
    --   { "<c-cr>", "<Plug>SlimeRegionSend<cr>", mode = "v", desc = "send code chunk" },
    --   { "<cr>", "<Plug>SlimeRegionSend<cr>", mode = "v", desc = "send code chunk" },
    --   { "<leader>ctr", ":split term://R<cr>", desc = "terminal: R" },
    --   { "<leader>cti", ":split term://ipython<cr>", desc = "terminal: ipython" },
    --   { "<leader>ctp", ":split term://python<cr>", desc = "terminal: python" },
    --   { "<leader>ctj", ":split term://julia<cr>", desc = "terminal: julia" },
    -- },
  },

  --provides lsp features and a code completion source for code embedded in other documents
  {
    "jmbuhr/otter.nvim",
    opts = {
      buffers = {
        set_filetype = true,
      },
    },
  },

  -- change nvim-cmpt settings
  -- {
  --   "hrsh7th/nvim-cmp",
  --   dependencies = { "jmbuhr/otter.nvim" },
  --   opts = function(_, opts)
  --     ---@param opts cmp.ConfigSchema
  --     local cmp = require("cmp")
  --     opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "otter" } }))
  --   end,
  -- },

  {
    "hrsh7th/nvim-cmp",
    optional = true,
    dependencies = { "jmbuhr/otter.nvim" },
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources, { name = "otter" })
    end,
  },

  -- not sure what we need to configure for.
  -- {
  --   "neovim/nvim-lspconfig",
  --   ---@class PluginLspOpts
  --   opts = {
  --     ---@type lspconfig.options
  --     servers = {
  --       pyright = {},
  --       r_language_server = {},
  --       marksman = {
  --         -- also needs:
  --         -- $home/.config/marksman/config.toml :
  --         -- [core]
  --         -- markdown.file_extensions = ["md", "markdown", "qmd"]
  --         filetypes = { "markdown", "quarto" },
  --         root_dir = require("lspconfig.util").root_pattern(".git", ".marksman.toml", "_quarto.yml"),
  --       },
  --     },
  --   },
  -- },

  ----------------
  -- Quarto END --
  ----------------
}
