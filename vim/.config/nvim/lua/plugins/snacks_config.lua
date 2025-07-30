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
        sources = {
          explorer = {
            auto_close = true,
            cycle = true,
            -- layout = { preset = "sidebar", preview = false},
            -- layout = { preset = "ivy_split" },
            -- layout = { preview = "main" },
          },
        },
      },
    },
  },
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      if LazyVim.has("trouble.nvim") then
        return vim.tbl_deep_extend("force", opts or {}, {
          picker = {
            actions = {
              trouble_open = function(...)
                return require("trouble.sources.snacks").actions.trouble_open.action(...)
              end,
            },
            win = {
              input = {
                keys = {
                  ["<c-t>"] = {
                    "trouble_open",
                    mode = { "n", "i" },
                  },
                },
              },
            },
          },
        })
      end
    end,
  },
}

-- ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
-- ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z
-- ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z
-- ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z
-- ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
--
--
--     |\__/,|   (`\
--   _.|o o  |_   ) )
-- -(((---(((--------
-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
--
-- ╔═══════════════════════════════════════════════════════════════════════╗
-- ║ The happiness of your life depends upon the quality of your thoughts. ║
-- ║                         -- Marcus Aurelius --                         ║
-- ╚═══════════════════════════════════════════════════════════════════════╝
--
--
-- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣶⣄⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
-- ⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣦⣄⣀⡀⣠⣾⡇⠀⠀⠀⠀
-- ⠀⠀⠀⠀⠀⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀
-- ⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⢿⣿⣿⡇⠀⠀⠀⠀
-- ⠀⣶⣿⣦⣜⣿⣿⣿⡟⠻⣿⣿⣿⣿⣿⣿⣿⡿⢿⡏⣴⣺⣦⣙⣿⣷⣄⠀⠀⠀
-- ⠀⣯⡇⣻⣿⣿⣿⣿⣷⣾⣿⣬⣥⣭⣽⣿⣿⣧⣼⡇⣯⣇⣹⣿⣿⣿⣿⣧⠀⠀
-- ⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠸⣿⣿⣿⣿⣿⣿⣿⣷⠀
