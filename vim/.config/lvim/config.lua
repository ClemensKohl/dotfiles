-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- vim.opt.relativenumber = true -- relative line numbers
vim.opt.wrap = true -- wrap lines
vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4 -- insert 2 spaces for a tab

lvim.plugins = {
  {"Vigemus/iron.nvim" },
  {"ellisonleao/gruvbox.nvim"},
  {"jpalardy/vim-slime"},
  {"casonadams/simple-diagnostics.nvim",
  config = function()
    require("simple-diagnostics").setup({
      virtual_text = true,
      message_area = true,
      signs = true,
    })
  end,
  },
 {"folke/zen-mode.nvim"},
 {"jalvesaq/Nvim-R"},
}

vim.opt.background="dark"
lvim.colorscheme = "gruvbox"

if vim.env.TMUX then
    vim.g.clipboard = {
        name = 'tmux',
        copy = {
            ["+"] = {'tmux', 'load-buffer', '-w', '-'},
            ["*"] = {'tmux', 'load-buffer', '-w', '-'},
        },
        paste = {
            ["+"] = {'bash', '-c', 'tmux refresh-client -l && sleep 0.2 && tmux save-buffer -'},
            ["*"] = {'bash', '-c', 'tmux refresh-client -l && sleep 0.2 && tmux save-buffer -'},
        },
        cache_enabled = false,
    }
end

-- lvim.lsp.diagnostics.virtual_text = false
vim.diagnostic.config({virtual_text = false})

--
-- ToggleTerm
--
local trim_spaces = true
vim.keymap.set("v", "<space>s", function()
    require("toggleterm").send_lines_to_terminal("single_line", trim_spaces, { args = vim.v.count })
end)
    -- Replace with these for the other two options
    -- require("toggleterm").send_lines_to_terminal("visual_line", trim_spaces, { args = vim.v.count })
    -- require("toggleterm").send_lines_to_terminal("visual_selection", trim_spaces, { args = vim.v.count })

-- For use as an operator map:
-- Send motion to terminal
vim.keymap.set("n", [[<leader><c-\>]], function()
  set_opfunc(function(motion_type)
    require("toggleterm").send_lines_to_terminal(motion_type, false, { args = vim.v.count })
  end)
  vim.api.nvim_feedkeys("g@", "n", false)
end)
-- Double the command to send line to terminal
vim.keymap.set("n", [[<leader><c-\><c-\>]], function()
  set_opfunc(function(motion_type)
    require("toggleterm").send_lines_to_terminal(motion_type, false, { args = vim.v.count })
  end)
  vim.api.nvim_feedkeys("g@_", "n", false)
end)
-- Send whole file
vim.keymap.set("n", [[<leader><leader><c-\>]], function()
  set_opfunc(function(motion_type)
    require("toggleterm").send_lines_to_terminal(motion_type, false, { args = vim.v.count })
  end)
  vim.api.nvim_feedkeys("ggg@G''", "n", false)
end)


-- Iron Vim

local iron = require("iron.core")
local view = require("iron.view")

-- iron.setup {...

iron.setup {
  config = {
    -- Whether a repl should be discarded or not
    scratch_repl = true,
    -- Your repl definitions come here
    repl_definition = {
      sh = {
        -- Can be a table or a function that
        -- returns a table (see below)
        command = {"bash"}
      }
    },
    -- How the repl window will be displayed
    -- See below for more information
    -- repl_open_cmd = require('iron.view').bottom(40),
    repl_open_cmd = require('iron.view').right("40%"),
  },
  -- Iron doesn't set keymaps by default anymore.
  -- You can set them here or manually add keymaps to the functions in iron.core
  keymaps = {
    send_motion = "<space>sc",
    visual_send = "<space>sc",
    send_file = "<space>sf",
    send_line = "<space>sl",
    send_until_cursor = "<space>su",
    send_mark = "<space>sm",
    mark_motion = "<space>mc",
    mark_visual = "<space>mc",
    remove_mark = "<space>md",
    cr = "<space>s<cr>",
    interrupt = "<space>s<space>",
    exit = "<space>sq",
    clear = "<space>cl",
  },
  -- If the highlight is on, you can change how it looks
  -- For the available options, check nvim_set_hl
  highlight = {
    italic = true
  },
  ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
}


-- One can always use the default commands from vim directly
-- repl_open_cmd = "vertical botright 80 split"

-- But iron provides some utility functions to allow you to declare that dynamically,
-- based on editor size or custom logic, for example.

-- Vertical 50 columns split
-- Split has a metatable that allows you to set up the arguments in a "fluent" API
-- you can write as you would write a vim command.
-- It accepts:
--   - vertical
--   - leftabove/aboveleft
--   - rightbelow/belowright
--   - topleft
--   - botright
-- They'll return a metatable that allows you to set up the next argument
-- or call it with a size parameter
-- repl_open_cmd = view.split.vertical.botright(50)
-- repl_open_cmd = view.split.rightbelow("40%")

-- If the supplied number is a fraction between 1 and 0,
-- it will be used as a proportion
-- repl_open_cmd = view.split.vertical.botright(0.61903398875)

-- The size parameter can be a number, a string or a function.
-- When it's a *number*, it will be the size in rows/columns
-- If it's a *string*, it requires a "%" sign at the end and is calculated
-- as a percentage of the editor size
-- If it's a *function*, it should return a number for the size of rows/columns

-- repl_open_cmd = view.split("40%")

-- You can supply custom logic
-- to determine the size of your
-- repl's window
-- repl_open_cmd = view.split.topleft(function()
--   if some_check then
--     return vim.o.lines * 0.4
--   end
--   return 20
-- end)

-- An optional set of options can be given to the split function if one
-- wants to configure the window behavior.
-- Note that, by default `winfixwidth` and `winfixheight` are set
-- to `true`. If you want to overwrite those values,
-- you need to specify the keys in the option map as the example below

-- repl_open_cmd = view.split("40%", {
--   winfixwidth = false,
--   winfixheight = false,
--   -- any window-local configuration can be used here
--   number = true
-- })


-- iron also has a list of commands, see :h iron-commands for all available commands
vim.keymap.set('n', '<space>rs', '<cmd>IronRepl<cr>')
vim.keymap.set('n', '<space>rr', '<cmd>IronRestart<cr>')
vim.keymap.set('n', '<space>rf', '<cmd>IronFocus<cr>')
vim.keymap.set('n', '<space>rh', '<cmd>IronHide<cr>')
