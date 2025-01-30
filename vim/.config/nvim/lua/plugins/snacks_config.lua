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
    },
  },
  -- {
  --   "folke/snacks.nvim",
  --   optional = true,
  --   opts = function(_, opts)
  --     table.insert(opts.dashboard.preset.keys, 3, {
  --       action = pick,
  --       desc = "Projects",
  --       icon = " ",
  --       key = "p",
  --     })
  --   end,
  -- },
}

-- ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
-- ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z
-- ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z
-- ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z
-- ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
