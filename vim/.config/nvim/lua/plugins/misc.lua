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
  -- Typing training. Thats all.
  -- {
  --   "NStefan002/speedtyper.nvim",
  --   cmd = "Speedtyper",
  --   lazy = true,
  --   opts = {
  --     -- your config
  --   },
  -- },
}
