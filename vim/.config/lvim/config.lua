--falsfalsee Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- vim.opt.relativenumber = true -- relative line numbers
vim.opt.wrap = true -- wrap lines
vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4 -- insert 2 spaces for a tab

-- basic aesthetics
vim.opt.background="dark"
vim.g.gruvbox_material_background = 'medium' -- alternatives: 'soft', 'medium', 'hard'
vim.g.gruvbox_material_better_performance = 1
lvim.colorscheme = "gruvbox-material" -- set "gruvbox for original gruvbox theme "
vim.o.termguicolors = true

-- Remapped keys
-- remove trailing white space
lvim.keys.normal_mode["<F5>"] = ":let _s=@/<Bar>:%s/\\s\\+$//e<Bar>:let @/=_s<Bar><CR>"
-- find buffers
lvim.keys.normal_mode["<leader>bu"] = ":Telescope buffers show_all_buffers=true<CR>" 

-- always forward search
-- vim.keymap.set('n', '<expr> n', '(v:searchforward ? 'n' : 'N')' )

-------------
-- Plugins --
-------------
lvim.plugins = {
    {"Vigemus/iron.nvim" },
    -- {"ellisonleao/gruvbox.nvim"}, -- old gruvbox
    -- {"jpalardy/vim-slime"},
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
    {"jalvesaq/Nvim-R"},   -- Allows integration of R terminal, object browser, ..., -- gruvbox material (softer contrast)
    {"goerz/jupytext.vim"}, -- Opens jupyter notebooks as textfiles, -- gruvbox material (softer contrast)
    {"sainnhe/gruvbox-material"}, -- gruvbox material (softer contrast)
    {"rebelot/kanagawa.nvim"}, -- kanagawa color scheme
    { -- Hints while typing
        "ray-x/lsp_signature.nvim",
        event = "BufRead",
        config = function() require"lsp_signature".on_attach() end,
    },
    -- { -- Github Copilot
    --     "zbirenbaum/copilot-cmp",
    --     event = "InsertEnter",
    --     dependencies = { "zbirenbaum/copilot.lua" },
    --     config = function()
    --         vim.defer_fn(function()
    --             require("copilot").setup() -- https://github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
    --             require("copilot_cmp").setup() -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
    --         end, 100)
    --     end,
    -- },
    { -- Better navigation with diagnostics
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
    },
    { -- popup for goto definition etc previews.
        "rmagatti/goto-preview",
        config = function()
            require('goto-preview').setup {
                width = 120; -- Width of the floating window
                height = 25; -- Height of the floating window
                default_mappings = true; -- Bind default mappings
                debug = false; -- Print debug information
                opacity = nil; -- 0-100 opacity level of the floating window where 100 is fully transparent.
                post_open_hook = nil -- A function taking two arguments, a buffer and a window to be ran as a hook.
                -- You can use "default_mappings = true" setup option
                -- Or explicitly set keybindings
                -- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
                -- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
                -- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
            }
        end
    },
}


-- -- tmux like zoom
vim.api.nvim_exec([[
    function! ZoomLikeTmux()
        let cpos = getpos(".")
        tabnew %
        redraw
        call cursor(cpos[1], cpos[2])
        normal! zz
    endfunction
    nmap gz :call ZoomLikeTmux()<CR>
]], false)


-- TMUX clipboard
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


------------
-- Nvim-R --
------------

vim.g.R_assign_map = "--"

-- R output is highlighted with current colorscheme
vim.g.rout_follow_colorscheme = 1 -- R commands in R output are highlighted
vim.g.Rout_more_colors = 1

-- vim.keymap.set('n', '<Leader>ss', '<Plug>RSendSelection')
-- vim.keymap.set('n', '<Leader><Leader>l', '<Plug>RSendLine')


-- -- make Nvim-R keybinds like Iron-nvim
-- vim.api.nvim_exec([[

--     function! s:customNvimRMappings()
--        nmap <buffer> <Leader>sr <Plug>RStart
--        imap <buffer> <Leader>sr <Plug>RStart
--        vmap <buffer> <Leader>sr <Plug>RStart

--        vmap <buffer> <Leader>ss <Plug>RSendSelection
--        vmap <buffer> <Leader>sr <Plug>RSendLine
--        nmap <buffer> <Leader>sr <Plug>RSendLine
--     endfunction
--     augroup myNvimR
--        au!
--        autocmd filetype r call s:customNvimRMappings()
--     augroup end

-- ]], false)



-- LSP diagnostic messages config

-- lvim.lsp.diagnostics.virtual_text = false
vim.diagnostic.config({virtual_text = false})

-- toggle diagnostics on/off

-- vim.g.diagnostics_visible = true

function _G.toggle_diagnostics()
  if vim.g.diagnostics_visible then
    vim.g.diagnostics_visible = false
    vim.diagnostic.hide()
    vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end
    print('Diagnostics are hidden')
  else
    vim.g.diagnostics_visible = true
    vim.diagnostic.show()
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
      }
    )
    print('Diagnostics are visible')
  end
end

vim.api.nvim_buf_set_keymap(0, 'n', '<Space>D', ':call v:lua.toggle_diagnostics()<CR>', {silent=true, noremap=true})

--
-- ToggleTerm
--
local trim_spaces = true
vim.keymap.set("v", "<space>s", function()
    require("toggleterm").send_lines_to_terminal("single_line", trim_spaces, { args = vim.v.count })
end)
    -- Replace with these for the other two options
    -- require("toggleterm").send_lines_to_terminal("visual_lines", trim_spaces, { args = vim.v.count })
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

iron.setup {
  config = {
    -- Whether a repl should be discarded or not
    scratch_repl = true,
    -- Your repl definitions come here
    repl_definition = {
        python = {
            command = { "ipython" }
        },
        sh = {
            -- Can be a table or a function that
            -- returns a table (see below)
            command = {"bash"}
        }
    },
    -- How the repl window will be displayed
    -- See below for more information
    repl_open_cmd = view.split.vertical.botright("30%")
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
-- iron also has a list of commands, see :h iron-commands for all available commands
vim.keymap.set('n', '<space>rs', '<cmd>IronRepl<cr>')
vim.keymap.set('n', '<space>rr', '<cmd>IronRestart<cr>')
vim.keymap.set('n', '<space>rf', '<cmd>IronFocus<cr>')
vim.keymap.set('n', '<space>rh', '<cmd>IronHide<cr>')


---------------------
-- Trouble Toggle ---
---------------------

lvim.builtin.which_key.mappings["t"] = {
  name = "Diagnostics",
  t = { "<cmd>TroubleToggle<cr>", "trouble" },
  w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
  d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}

