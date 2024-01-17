-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- align function parameters
vim.cmd([[
    :set cino+=(0
]])

vim.opt.cindent = true
vim.opt.cinoptions = {':0','l1','t0','g0','(0'}

-- vim.opt.relativenumber = true -- relative line numbers
vim.opt.wrap = true -- wrap lines
vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4 -- insert 2 spaces for a tab
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.expandtab = true -- Use spaces instead of tabs

-- basic aesthetics
vim.opt.background="dark"

-- gruvbox-material
lvim.colorscheme = "catppuccin-frappe" -- set "gruvbox", "gruvbox-material", "catppuccin-frappe"
vim.g.gruvbox_material_background = 'medium' -- alternatives: 'soft', 'medium', 'hard'
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_float_style = 'bright' -- sets the color of floating windows. 'dim' or 'bright'
vim.opt.termguicolors = true

-- Markdown
vim.opt.conceallevel = 3 -- Hide * markup for bold and italic


-- Remapped keys
-- remove trailing white space
lvim.keys.normal_mode["<F5>"] = ":let _s=@/<Bar>:%s/\\s\\+$//e<Bar>:let @/=_s<Bar><CR>"
-- find buffers
lvim.keys.normal_mode["<leader>bu"] = ":Telescope buffers show_all_buffers=true<CR>"


-------------
-- Plugins --
-------------
lvim.plugins = {
   
    -- classical gruvbox
    {"ellisonleao/gruvbox.nvim"},
    
    -- gruvbox material (softer contrast)
    {"sainnhe/gruvbox-material"},

    -- kanagawa color scheme
    {"rebelot/kanagawa.nvim"},

    -- Catpuccino Theme - Miau!
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {
            flavour = "frappe", -- latte, frappe, macchiato, mocha
            background = { -- :h background
                light = "latte",
                dark = "mocha",
            },
            transparent_background = false, -- disables setting the background color.
            integrations = {
                aerial = true,
                alpha = true,
                cmp = true,
                dashboard = true,
                flash = true,
                gitsigns = true,
                headlines = true,
                illuminate = true,
                indent_blankline = { enabled = true },
                leap = true,
                lsp_trouble = true,
                mason = true,
                markdown = true,
                mini = true,
                native_lsp = {
                    enabled = true,
                    underlines = {
                        errors = { "undercurl" },
                        hints = { "undercurl" },
                        warnings = { "undercurl" },
                        information = { "undercurl" },
                    },
                },
                navic = { enabled = true, custom_bg = "lualine" },
                neotest = true,
                neotree = true,
                noice = true,
                notify = true,
                semantic_tokens = true,
                telescope = true,
                treesitter = true,
                treesitter_context = true,
                which_key = true,
            },
        },
    },

    -- Centers Code window 
    {"folke/zen-mode.nvim"},

    -- Allows integration of R terminal, object browser, ... 
    {"jalvesaq/Nvim-R"},

    -- General purpose REPL Iron
    {"Vigemus/iron.nvim" },

    -- Opens jupyter notebooks as textfiles
    {"goerz/jupytext.vim"},

    -- Hints while typing
    {
        "ray-x/lsp_signature.nvim",
        event = "BufRead",
        config = function() require"lsp_signature".on_attach() end,
    },

    -- Github Copilot
    {
        "zbirenbaum/copilot-cmp",
        event = "InsertEnter",
        dependencies = { "zbirenbaum/copilot.lua" },
        config = function()
            vim.defer_fn(function()
                require("copilot").setup() -- https://github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
                require("copilot_cmp").setup() -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
            end, 100)
        end,
    },

    -- Better navigation with diagnostics
    {
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
    },

    -- popup for goto definition etc previews.
    {
        "rmagatti/goto-preview",
        config = function()
            require('goto-preview').setup {
                width = 120; -- Width of the floating window
                height = 25; -- Height of the floating window
                default_mappings = true; -- Bind default mappings
                debug = false; -- Print debug information
                opacity = nil; -- 0-100 opacity level of the floating window where 100 is fully transparent.
                post_open_hook = nil -- A function taking two arguments, a buffer and a window to be ran as a hook.
            }
        end
    },
  
    -- Configure treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "regex",
        "vim",
        "r",
      },
      indent = {
        enable = true,
        disable = { "r" },
      },
    },
  },
}

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

-- allow correct continuation for R/Roxygen comments
vim.cmd([[
    autocmd FileType r setlocal formatoptions+=r
]])


vim.g.R_assign_map = "--"

-- R output is highlighted with current colorscheme
vim.g.rout_follow_colorscheme = 1 -- R commands in R output are highlighted
vim.g.Rout_more_colors = 1

-- configure Nvim-R keymaps
lvim.builtin.which_key.mappings["r"] = {
    name = "Nvim-R",
    f = { "<Plug>RStart", "Start R" },
    q = { "<Plug>RClose", "Close R" },
    l = { "<Plug>RSendLine", "Send Line to R" },
    s = { "<Plug>RSendSelection", "Send Selection to R" },
    h = { "<Plug>RHelp", "Open R help" },
    o = { "<Plug>RUpdateObjBrowser", "Open Object Browser" },
    a = { "<Plug>RSendFile", "Send File to R" },
}

lvim.builtin.which_key.vmappings["r"] = {
    name = "Nvim-R",
    l = { "<Plug>RSendLine", "Send Line to R" },
    s = { "<Plug>RSendSelection", "Send Selection to R" },
}
-- vim.keymap.set("n", "<leader>rf", "<Plug>RStart", { desc = "Start R" })
-- vim.keymap.set("n", "<leader>rq", "<Plug>RClose", { desc = "Close R" })
-- vim.keymap.set({ "n", "v" }, "<leader>rl", "<Plug>RSendLine", { desc = "Send Line to R" })
-- vim.keymap.set("v", "<leader>rs", "<Plug>RSendSelection", { desc = "Send Selection to R" })
-- vim.keymap.set("n", "<leader>rh", "<Plug>RHelp", { desc = "Open R help" })
-- vim.keymap.set("n", "<leader>ro", "<Plug>RUpdateObjBrowser", { desc = "Open Object Browser" })


-- LSP diagnostic messages config

vim.diagnostic.config({
    virtual_text = false,
    -- signs = true,
    underline = false,
    float = {
        show_header = false,
        source = 'if_many',
        border = 'rounded',
        focusable = false,
    },
    update_in_insert = false
})


-- function to toggle diagnostics on/off

Diagnostics_active = true
Toggle_diagnostics = function()
  Diagnostics_active = not Diagnostics_active
  if Diagnostics_active then
        vim.diagnostic.config({
            virtual_text = true,
            signs = true,
            underline = true,
            float = {
                show_header = false,
                source = 'if_many',
                border = 'rounded',
                focusable = false,
            },
            update_in_insert = false
        })
  else
        vim.diagnostic.config({
            virtual_text = false,
            signs = true,
            underline = false,
            update_in_insert = false
        })
  end
end

Turnoff_diagnostics = function()
  Diagnostics_active = not Diagnostics_active
  if Diagnostics_active then
        vim.diagnostic.config({
            virtual_text = false,
            signs = true,
            underline = true,
            float = {
                show_header = false,
                source = 'if_many',
                border = 'rounded',
                focusable = false,
            },
            update_in_insert = false
        })
  else
        vim.diagnostic.config({
            virtual_text = false,
            signs = false,
            underline = false,
            update_in_insert = false
        })
  end
end

-- lvim.builtin.which_key.mappings['q'] = {
--     name = "ToggleDiagnostics"
-- }

-- lvim.keys.normal_mode["<leader-q>"] = false

lvim.builtin.which_key.mappings['q'] = {
    name = "ToggleDiagnostics",
    q = { "<cmd>lua Toggle_diagnostics()<cr>", "toggle" },
    Q = { "<cmd>lua Turnoff_diagnostics()<cr>", "turnoff" },
    H = { '<cmd>lua vim.lsp.buf.hover()<CR>', "Hover"},
}

vim.keymap.set('n', 'Q', '<cmd>lua vim.diagnostic.open_float()<CR>')
-- vim.keymap.set('n', '<leader>Q', '<cmd>lua vim.lsp.buf.hover()<CR>')

---------------------
-- Trouble Toggle ---
---------------------
--
lvim.builtin.which_key.mappings["t"] = {
  name = "Diagnostics",
  t = { "<cmd>TroubleToggle<cr>", "trouble" },
  w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
  d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}

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
    send_motion = "<space>ic",
    visual_send = "<space>ic",
    send_file = "<space>if",
    send_line = "<space>il",
    send_until_cursor = "<space>iu",
    send_mark = "<space>imm",
    mark_motion = "<space>imc",
    mark_visual = "<space>imc",
    remove_mark = "<space>imd",
    cr = "<space>i<cr>",
    interrupt = "<space>i<space>",
    exit = "<space>iq",
    clear = "<space>iC",
  },
  -- If the highlight is on, you can change how it looks
  -- For the available options, check nvim_set_hl
  highlight = {
    italic = true
  },
  ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
}
-- iron also has a list of commands, see :h iron-commands for all available commands
lvim.builtin.which_key.mappings["i"] = {
  name = "IronRepl",
}
vim.keymap.set('n', '<space>is', '<cmd>IronRepl<cr>', { desc = "Start IronRepl" })
vim.keymap.set('n', '<space>ir', '<cmd>IronRestart<cr>', { desc = "Restart IronRepl" })
vim.keymap.set('n', '<space>iF', '<cmd>IronFocus<cr>', { desc = "IronFocus" })
vim.keymap.set('n', '<space>ih', '<cmd>IronHide<cr>', { desc = "Hide IronRepl" })

