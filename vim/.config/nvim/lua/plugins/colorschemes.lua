-- Colorscheme plugins and settings.

return {
  -- add gruvbox
  -- { "ellisonleao/gruvbox.nvim" },
  {
    "webhooked/kanso.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "moon",
      -- plugins = { markdown = true },
      -- on_highlights = function(hl, c)
      --   hl.RCodeBlock = {
      --     bg = c.bg_dark,
      --   }
      -- hl.RenderMarkdownCodeBorder = {
      --   bg = c.none,
      -- }
      -- end,
    },
  },
  -- gruvbox but with softer contrast.
  {
    "sainnhe/gruvbox-material",
    lazy = false,
  },
  -- NOW INCLUDED IN LAZYVIM
  -- Catpuccino Theme - Miau!

  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "frappe", -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = "latte",
        dark = "frappe",
      },
      term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
      compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
      custom_highlights = function(colors)
        return {
          RenderMarkdownCode = { bg = colors.mantle },
        }
      end,
    },
  },

  -- Nightfox
  { "EdenEast/nightfox.nvim" },

  -- Rose pine theme
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    opts = {
      variant = "auto", -- auto, main, moon, or dawn
      dark_variant = "main", -- main, moon, or dawn
      dim_inactive_windows = false,
      extend_background_behind_borders = true,

      enable = {
        terminal = true,
        legacy_highlights = false, -- Improve compatibility for previous versions of Neovim
        migrations = true, -- Handle deprecated options automatically
      },

      styles = {
        bold = true,
        italic = false, -- default true
        transparency = false,
      },

      groups = {
        border = "muted",
        link = "iris",
        panel = "surface",

        -- error = "love",
        -- hint = "iris",
        -- info = "foam",
        -- note = "pine",
        -- todo = "rose",
        -- warn = "gold",

        git_add = "foam",
        git_change = "rose",
        git_delete = "love",
        git_dirty = "rose",
        git_ignore = "muted",
        git_merge = "iris",
        git_rename = "pine",
        git_stage = "iris",
        git_text = "rose",
        git_untracked = "subtle",

        h1 = "iris",
        h2 = "foam",
        h3 = "rose",
        h4 = "gold",
        h5 = "pine",
        h6 = "foam",
      },

      highlight_groups = {
        -- Comment = { fg = "foam" },
        -- VertSplit = { fg = "muted", bg = "muted" },
      },

      before_highlight = function(group, highlight, palette)
        -- Disable all undercurls
        -- if highlight.undercurl then
        --     highlight.undercurl = false
        -- end
        --
        -- Change palette colour
        -- if highlight.fg == palette.pine then
        --     highlight.fg = palette.foam
        -- end
      end,
    },
  },

  -- Configure LazyVim to load colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-moon",
      -- colorscheme = "gruvbox-material",
      -- colorscheme = "catppuccin-frappe",
      -- colorscheme = "rose-pine-dawn",
      gruvbox_material_background = "medium",
      gruvbox_material_better_performance = 1,
    },
  },
}
