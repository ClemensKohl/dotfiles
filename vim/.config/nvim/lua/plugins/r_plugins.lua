-- all the modules can easily be turned off:
-- stylua: ignore
-- if true then return {} end

--NOTE: Superseded by lazyvim r.lang extra!

-- R plugins and configs
return {

  -- New Version of Nvim-R
  {
    "R-nvim/R.nvim",
    lazy = false,
    opts = {
      R_args = { "--no-save" }, -- add --quiet if you dont want the startup message.
      R_app = "R",
      R_cmd = "R",
      hook = {
        vim.keymap.set("i", "<<", "<Plug>RInsertAssign" ),
        -- vim.keymap.set("i", "<M-b>", "<Plug>RmdInsertChunk", { buffer = true })
      },
      quarto_chunk_hl = {
        highlight = false,               -- Highlight code blocks?
        yaml_hl = false,                 -- Highlight YAML comments?
        virtual_title = false,           -- Add language as virtual text?
        bg = "#003010",                  -- Use a different background color
        events = "BufEnter,TextChanged", -- Update the highlighting more often
      },
      -- R_hl_term = 0,
      -- R_bracketed_paste = 1,
    },
  },

  -- Needs cmp-r
  -- {
  --   "R-nvim/cmp-r",
  --   opts = {}, -- calls setup!
  -- },

  -- Adding cmp-r acccording to lazyvim doc.
  -- {
  --   "hrsh7th/nvim-cmp",
  --   dependencies = { "R-nvim/cmp-r" },
  --   ---@param opts cmp.ConfigSchema
  --   opts = function(_, opts)
  --     table.insert(opts.sources, { name = "cmp_r" })
  --   end,
  -- },

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
