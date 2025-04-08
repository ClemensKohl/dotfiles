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
╔══════════════════════════════════════════════════════════════════════════════════╗
║ The most merciful thing in the world, I think, is the inability of the human     ║
║ mind to correlate all its contents. We live on a placid island of ignorance in   ║
║ the midst of black seas of the infinity, and it was not meant that we should     ║
║ voyage far. The sciences, each straining in its own direction, have harmed us    ║
║ little; but some day the piecing together of dissociated knowledge will open up  ║
║ such terrifying vistas of reality, and of our frightful position therein, that   ║
║ we shall either go mad from the revelation or flee from the light into the       ║
║ peace and safety of a new dark age.                                              ║
║                            -- H.P. Lovecraft --                                  ║
╚══════════════════════════════════════════════════════════════════════════════════╝
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
    },
  },
}

-- ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
-- ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z
-- ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z
-- ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z
-- ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
