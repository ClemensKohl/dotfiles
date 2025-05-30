return {
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      dashboard = {
        preset = {
          header = [[
    |\__/,|   (`\
  _.|o o  |_   ) )
-(((---(((--------
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝

╔═══════════════════════════════════════════════════════════════════════╗
║ The happiness of your life depends upon the quality of your thoughts. ║
║                         -- Marcus Aurelius --                         ║
╚═══════════════════════════════════════════════════════════════════════╝
 ]],
        },
      },
      zen = {
        toggles = {
          dim = false,
          git_signs = false,
          mini_diff_signs = false,
        },
        win = {
          backdrop = { transparent = false, blend = 99 }, -- This needs to be 99, 100 results in same behaviour as default setup
        },
      },
      image = { enabled = false },
      terminal = { enabled = true },
      picker = {
        -- layout = { preset = "ivy" },
        sources = {
          explorer = {
            auto_close = false,
            cycle = true,
            layout = { preview = "main" },
            -- layout = {
            -- { preview = true },
            -- layout = {
            --   box = "horizontal",
            --   width = 0.8,
            --   height = 0.8,
            --   {
            --     box = "vertical",
            --     border = "rounded",
            --     title = "{source} {live} {flags}",
            --     title_pos = "center",
            --     { win = "input", height = 1, border = "bottom" },
            --     { win = "list", border = "none" },
            --   },
            --   { win = "preview", border = "rounded", width = 0.7, title = "{preview}" },
            -- },
            -- },
          },
        },
      },
    },
  },
}

-- ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
-- ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z
-- ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z
-- ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z
-- ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
