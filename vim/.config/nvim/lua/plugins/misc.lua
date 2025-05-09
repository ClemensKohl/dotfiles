-- Miscanellous and fun plugins
-- stylua: ignore
-- if true then return {} end

return {
  -- A neovim plugin to practice typing with a very beautiful dashboard
  {
    "nvzone/typr",
    dependencies = "nvzone/volt",
    opts = {},
    cmd = { "Typr", "TyprStats" },
  },
  -- { "nvzone/timerly",
  --   dependencies = "nvzone/volt",
  --   config = {
  --     minutes = { 30, 5 },
  --     position = "top-right",
  --   }
  -- },

  {
    'cbrgm/countdown.nvim', 
    config = {

      default_minutes = 25, -- The default minutes to use when a countdown is started without minutes specified
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)

      table.insert(opts.sections.lualine_x, {
      function()
        return require("countdown").get_time()
      end
      })
    end,
  },
}
