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
      R_args = {"--no-save"},
      assignment_keymap = "<<",
    },
  },

  -- Needs cmp-r
  { "R-nvim/cmp-r",
    opts={} -- calls setup!
  },

  -- Adding cmp-r acccording to lazyvim doc.
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "R-nvim/cmp-r" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      table.insert(opts.sources, { name = "cmp_r" })
    end,
  },

  -- This is the config for cmp from the github page.
  -- Overwrites cmp sources!
  -- {
  --   "hrsh7th/nvim-cmp",
  --   config = function()
  --     require("cmp").setup({ sources = { { name = "cmp_r" } } })
  --     require("cmp_r").setup({})
  --   end,
  -- },
}
