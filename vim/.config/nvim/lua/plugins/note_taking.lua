-- Plugins for note taking. 
-- stylua: ignore
-- if true then return {} end

return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = false,
  -- ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    -- refer to `:h file-pattern` for more examples
    "BufReadPre "
      .. vim.fn.expand("~")
      .. "/Obsidian/PhD/*.md",
    "BufNewFile " .. vim.fn.expand("~") .. "/Obsidian/PhD/*.md",
    "BufReadPre " .. vim.fn.expand("~") .. "/Obsidian/Privat/*.md",
    "BufNewFile " .. vim.fn.expand("~") .. "/Obsidian/Privat/*.md",
  },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "Privat",
        path = vim.fn.expand("~") .. "/Obsidian/Privat",
      },
      {
        name = "PhD",
        path = vim.fn.expand("~") .. "/Obsidian/PhD",
      },
    },

    -- see below for full list of options 👇
  },
}
