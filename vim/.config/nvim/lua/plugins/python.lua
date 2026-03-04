return {
  {
    "Vigemus/iron.nvim",
    ft = { "python" },
    config = function()
      local iron = require("iron.core")

      iron.setup({
        config = {
          -- Whether a repl should be discarded or not
          scratch_repl = true,
          -- Your repl definitions come here
          repl_definition = {
            sh = {
              -- Can be a table or a function that
              -- returns a table (see below)
              command = { "bash" },
            },
            -- python = {
            --   command = { "ipython", "--no-autoindent", "--nosep" },
            --   format = require("iron.fts.common").bracketed_paste_python,
            --   block_dividers = { "# %%", "#%%" },
            --   env = { PYTHON_BASIC_REPL = "1" }, --this is needed for python3.13 and up.
            -- },
            python = {
              command = { "ipython" , "--no-autoindent", "--nosep" }, -- or { "python3", "--no-autoindent" }
              format = require("iron.fts.common").bracketed_paste_python,
              block_deviders = { "# %%", "#%%", "```" },
            },
          },
          -- set the file type of the newly created repl to ft
          -- bufnr is the buffer id of the REPL and ft is the filetype of the
          -- language being used for the REPL.
          repl_filetype = function(bufnr, ft)
            return ft
            -- or return a string name such as the following
            -- return "iron"
          end,
          -- Send selections to the DAP repl if an nvim-dap session is running.
          dap_integration = true,
          -- How the repl window will be displayed
          -- See below for more information
          repl_open_cmd = require("iron.view").split.vertical.botright("30%"),
          -- repl_open_cmd = require("iron.view").right("30%"),
        },
        -- Iron doesn't set keymaps by default anymore.
        -- You can set them here or manually add keymaps to the functions in iron.core
        keymaps = {
          send_motion = "<localleader>sc",
          visual_send = "<localleader>ss",
          send_file = "<localleader>sf",
          -- send_line = "<localleader>sl",
          send_line = "<Enter>",
          send_paragraph = "<localleader>sp",
          send_code_block = "<localleader>sb",
          send_code_block_and_move = "<localleader>sn",
          send_mark = "<localleader>sm",
          send_until_cursor = "<localleader>su",
          mark_motion = "<localleader>mc",
          mark_visual = "<localleader>mc",
          remove_mark = "<localleader>md",
          cr = "<localleader>s<cr>",
          interrupt = "<localleader>s<space>",
          exit = "<localleader>cq",
          clear = "<localleader>cl",
        },
        -- If the highlight is on, you can change how it looks
        -- For the available options, check nvim_set_hl
        highlight = {
          italic = true,
        },
        ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
      })

      -- iron also has a list of commands, see :h iron-commands for all available commands
      -- vim.keymap.set("n", "<localleader>is", "<cmd>IronRepl<cr>")
      -- vim.keymap.set("n", "<localleader>ir", "<cmd>IronRestart<cr>")
      -- vim.keymap.set("n", "<localleader>if", "<cmd>IronFocus<cr>")
      -- vim.keymap.set("n", "<localleader>ih", "<cmd>IronHide<cr>")
    end,
  },
}
