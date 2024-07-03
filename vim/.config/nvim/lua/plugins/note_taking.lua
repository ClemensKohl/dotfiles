-- Plugins for note taking. 
-- stylua: ignore
if true then return {} end

return {
  -- {
  --   'yujinyuz/gitpad.nvim',
  --   config = function()
  --     require('gitpad').setup({
  --       border = 'single', -- The border style of the floating window. Possible values are `'single'`, `'double'`, `'shadow'`, `'rounded'`, and `''` (no border).
  --       style = '', -- The style of the floating window. Possible values are `'minimal'` (no line numbers, statusline, or sign column. See :help nvim_open_win() '), and `''` (default Neovim style).
  --       dir = vim.fn.stdpath('data') .. '/gitpad', -- The directory where the notes are stored. Possible value is a valid path ie '~/notes'
  --       -- dir = vim.fn.getcwd() .. '/.nvim/notes', -- The directory where the notes are stored. Possible value is a valid path ie '~/notes'
  --       default_text = nil, -- Leave this nil if you want to use the default text
  --       on_attach = function(bufnr)
  --         -- You can also define a function to be called when the gitpad window is opened, by setting the `on_attach` option:
  --         -- This is just an example
  --         vim.api.nvim_buf_set_keymap(bufnr, 'n', 'q', '<Cmd>wq<CR>', { noremap = true, silent = true })
  --       end,
  --     })
  --   end,
  --   keys = {
  --     {
  --       '<leader>pp',
  --       function()
  --         require('gitpad').toggle_gitpad()
  --       end,
  --       desc = 'gitpad project',
  --     },
  --     {
  --       '<leader>pb',
  --       function()
  --         require('gitpad').toggle_gitpad_branch()
  --       end,
  --       desc = 'gitpad branch',
  --     },
  --     -- Daily notes
  --     {
  --       '<leader>pd',
  --       function()
  --         local date_filename = 'daily-' .. os.date('%Y-%m-%d.md')
  --         require('gitpad').toggle_gitpad({ filename = date_filename })
  --       end,
  --       desc = 'gitpad daily notes',
  --     },
  --     -- Per file notes
  --     {
  --       '<leader>pf',
  --       function()
  --         local filename = vim.fn.expand('%:p') -- or just use vim.fn.bufname()
  --         if filename == '' then
  --           vim.notify('empty bufname')
  --           return
  --         end
  --         filename = vim.fn.pathshorten(filename, 2) .. '.md'
  --         require('gitpad').toggle_gitpad({ filename = filename })
  --       end,
  --       desc = 'gitpad per file notes',
  --     },
  --   },
  -- }
  -- Obsidian integration
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    --   "BufReadPre path/to/my-vault/**.md",
    --   "BufNewFile path/to/my-vault/**.md",
    -- },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "PhD",
          path = "~/Obsidian/PhD",
        },
        {
          name = "work",
          path = "~/Obsidian/Privat",
        },
      },
    },
  },
}
