-- leetcode.nvim config
-- Call via:
-- $ nvim leetcode.nvim
-- F12 or inspect -> Network -> filter for graphql -> post -> Cookie -> Copy Value
local leet_arg = "leetcode.nvim"
return {
  {
    "kawre/leetcode.nvim",
    lazy = leet_arg ~= vim.fn.argv()[1], -- lazy loading
    build = ":TSUpdate html",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim", -- required by telescope
      "MunifTanjim/nui.nvim",

      -- optional
      "nvim-treesitter/nvim-treesitter",
      "rcarriga/nvim-notify",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      -- configuration goes here
      ---@type string
      arg = leet_arg,
      ---@type lc.lang
      -- lang = "cpp"
    },
  },
}
