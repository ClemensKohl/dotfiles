-- all the modules can easily be turned off:
-- stylua: ignore
-- if true then return {} end

-- R plugins and configs
return {

  --  Integration with R.
  -- {
  --   "jalvesaq/Nvim-R",
  -- },

  -- New Version of Nvim-R
  {
    "R-nvim/R.nvim",
    lazy = false,
    opts = {
      assign_map = "<<",
    },
  },

  -- Needs cmp-r
  { "R-nvim/cmp-r" },

  -- Below is necessary for cmp-r
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "R-nvim/cmp-r" },
    opts = function(_, opts)
      ---@param opts cmp.ConfigSchema
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "cmp-r" } }))
      require("cmp_r").setup({})
    end,
  },

  -- This is a test, remove if it doesnt work.
  -- {
  --   "hrsh7th/nvim-cmp",
  --   dependencies = { "R-nvim/cmp-r" },
  --   ---@param opts cmp.ConfigSchema
  --   opts = function(_, opts)
  --     table.insert(opts.sources, { name = "cmp_r" })
  --   end,
  -- },


  -- This is the config for cmp from the github page:
  -- {
  --   "hrsh7th/nvim-cmp",
  --   config = function()
  --     require("cmp").setup({ sources = { { name = "cmp_r" } } })
  --     require("cmp_r").setup({})
  --   end,
  -- },

}
