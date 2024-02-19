-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny


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
    
    -- Rose pine theme
    {
        "rose-pine/neovim",
        name = "rose-pine",
        opts = {
            variant = "auto", -- auto, main, moon, or dawn
            dark_variant = "main", -- main, moon, or dawn
            dim_inactive_windows = false,
            extend_background_behind_borders = true,

            enable = {
                terminal = true,
                legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
                migrations = true, -- Handle deprecated options automatically
            },

            styles = {
                bold = true,
                italic = false, -- default true
                transparency = false,
            },

            groups = {
                border = "muted",
                link = "iris",
                panel = "surface",

                error = "love",
                hint = "iris",
                info = "foam",
                note = "pine",
                todo = "rose",
                warn = "gold",

                git_add = "foam",
                git_change = "rose",
                git_delete = "love",
                git_dirty = "rose",
                git_ignore = "muted",
                git_merge = "iris",
                git_rename = "pine",
                git_stage = "iris",
                git_text = "rose",
                git_untracked = "subtle",

                h1 = "iris",
                h2 = "foam",
                h3 = "rose",
                h4 = "gold",
                h5 = "pine",
                h6 = "foam",
            },

            highlight_groups = {
                -- Comment = { fg = "foam" },
                -- VertSplit = { fg = "muted", bg = "muted" },
            },

            before_highlight = function(group, highlight, palette)
                -- Disable all undercurls
                -- if highlight.undercurl then
                --     highlight.undercurl = false
                -- end
                --
                -- Change palette colour
                -- if highlight.fg == palette.pine then
                --     highlight.fg = palette.foam
-- end
            end,
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

    -- Hints while typing -- conflicts with noice.
    -- {
    --     "ray-x/lsp_signature.nvim",
    --     event = "BufRead",
    --     config = function() require"lsp_signature".on_attach() end,
    -- },

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

    -- Highlights todo comments 
    {
        "folke/todo-comments.nvim",
        event = "BufRead",
        config = function()
            require("todo-comments").setup()
        end,
    },

    -- better surround of quotes etc.
    {
        'echasnovski/mini.surround',
        version = false,
        opts = {
            mappings = {
                add = "ma", -- Add surrounding in Normal and Visual modes
                delete = "md", -- Delete surrounding
                find = "mf", -- Find surrounding (to the right)
                find_left = "mF", -- Find surrounding (to the left)
                highlight = "mh", -- Highlight surrounding
                replace = "mr", -- Replace surrounding
                update_n_lines = "mn", -- Update `n_lines`
            },
        },
        config = function(_, opts)
            require("mini.surround").setup(opts)
        end,
    },
    -- Flash. Faster search.
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {},
        -- stylua: ignore
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },
    },
    -- Use telescope to switch tabs
    {
        'LukasPietzschmann/telescope-tabs',
        config = function()
            require('telescope').load_extension 'telescope-tabs'
            require('telescope-tabs').setup {
                -- Your custom config :^)
            }
        end,
        dependencies = { 'nvim-telescope/telescope.nvim' },
    },

    -- Shows function on top if it doesnt fit screen.
    -- { "nvim-treesitter/nvim-treesitter-context",
    --     event = "LazyFile",
    --     enabled = true,
    --     opts = { mode = "cursor", max_lines = 3 },
    --     keys = {
    --         {
    --             "<leader>ut",
    --             function()
    --                 local Util = require("lazyvim.util")
    --                 local tsc = require("treesitter-context")
    --                 tsc.toggle()
    --                 if Util.inject.get_upvalue(tsc.toggle, "enabled") then
    --                     Util.info("Enabled Treesitter Context", { title = "Option" })
    --                 else
    --                     Util.warn("Disabled Treesitter Context", { title = "Option" })
    --                 end
    --             end,
    --             desc = "Toggle Treesitter Context",
    --         },
    --     },
    -- },
    {
        "nvim-treesitter/nvim-treesitter-context",
        config = function()
            require("treesitter-context").setup{
                enable = true, -- enable this plugin (can be enabled/disabled later via commands)
                throttle = true, -- throttles plugin updates (may improve performance)
                max_lines = 0, -- how many lines the window should span. values <= 0 mean no limit.
                patterns = { -- match patterns for ts nodes. these get wrapped to match at word boundaries.
                    -- for all filetypes
                    -- note that setting an entry here replaces all other patterns for this entry.
                    -- by setting the 'default' entry below, you can control which nodes you want to
                    -- appear in the context window.
                    default = {
                        'class',
                        'function',
                        'method',
                    },
                },
            }
        end
    },

    -- Noice. Nicer ui and messages.
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    },

}


-- align function parameters
vim.cmd([[
    :set cino+=(0
]])

vim.opt.cindent = true
vim.opt.cinoptions = {':0','l1','t0','g0','(0'}

vim.opt.relativenumber = true -- relative line numbers
vim.opt.wrap = true -- wrap lines
vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4 -- insert 2 spaces for a tab
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.expandtab = true -- Use spaces instead of tabs

-- basic aesthetics
vim.opt.background="dark"

-- set "gruvbox", "gruvbox-material", "catppuccin-frappe"
-- "rose-pine-main/moon/dawn"
lvim.colorscheme = "catppuccin-frappe"
vim.g.gruvbox_material_background = 'medium' -- alternatives: 'soft', 'medium', 'hard'
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_float_style = 'bright' -- sets the color of floating windows. 'dim' or 'bright'
vim.opt.termguicolors = true

-- Markdown
vim.opt.conceallevel = 3 -- Hide * markup for bold and italic


----------------------------------
-- filte type specific settings --
----------------------------------

local generalSettingsGroup = vim.api.nvim_create_augroup('General settings', { clear = true })

-- R
vim.api.nvim_create_autocmd('FileType', {
    pattern = { '*.R' },
    callback = function()
        vim.opt.shiftwidth = 2
        vim.opt.tabstop = 2
    end,
    group = generalSettingsGroup,
})

-- DAP configuration
-- local dap = require('dap')
-- local dapui = require('dapui')
-- dap.adapters.r = {
--     type = 'server',
--     port = 18722, -- needs to match `debugadapter::run()`'s `port` argument
-- }
-- dap.configurations.r = {
-- {
--     type = 'r',
--     requests = 'attach',
--     name = 'Attach session'
-- }


-- Noice setup
require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
})

-- { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
--     { "<leader>snl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
--     { "<leader>snh", function() require("noice").cmd("history") end, desc = "Noice History" },
--     { "<leader>sna", function() require("noice").cmd("all") end, desc = "Noice All" },
--     { "<leader>snd", function() require("noice").cmd("dismiss") end, desc = "Dismiss All" },
--     { "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll forward", mode = {"i", "n", "s"} },
--     { "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll backward", mode = {"i", "n", "s"}},-- Remapped keys

lvim.builtin.which_key.mappings["n"] = {
    name = "Noice",
    l = { "<cmd>lua require('noice').cmd('last')<cr>", "Noice Last Message" },
    h = { "<cmd>lua require('noice').cmd('history')<cr>", "Noice History" },
    a = { "<cmd>lua require('noice').cmd('dismiss')<cr>", "Noice All" },
    d = { "<cmd>lua require('noice').cmd('dismiss')<cr>", "Dismiss All" },
    n = { "<cmd>:Telescope notify<cr>", "Notify History"}
}

-- remove trailing white space
lvim.keys.normal_mode["<F5>"] = ":let _s=@/<Bar>:%s/\\s\\+$//e<Bar>:let @/=_s<Bar><CR>"
-- find buffers
-- lvim.keys.normal_mode["<leader>bu"] = ":Telescope buffers show_all_buffers=true<CR>"
-- lvim.keys.normal_mode["<leader>bt"] = ":Telescope telescope-tabs list_tabs<CR>"

-- vim.keymap.set('n', '<leader>bv', ":Telescope buffers show_all_buffers=true<CR>", { desc = "Show All Buffers" })
vim.keymap.set('n', '<leader>bt', ":Telescope telescope-tabs list_tabs<CR>", { desc = "Show All Tabs" })

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

-- StartRdevel = function()
--     vim.g.R_path = '~/R-devel/bin/'
--     vim.fn.StartR("R")
-- end

vim.g.R_assign_map = "<<"

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
    c = { "<Plug>RSendChunk", "Send RMD Chunk" },
    d = { "<Plug>RDSendChunk", "Send RMD Chunk (DOWN)" },
    h = { "<Plug>RHelp", "Open R help" },
    o = { "<Plug>RUpdateObjBrowser", "Open Object Browser" },
    a = { "<Plug>RSendFile", "Send File to R" },
}

lvim.builtin.which_key.vmappings["r"] = {
    name = "Nvim-R",
    l = { "<Plug>RSendLine", "Send Line to R" },
    s = { "<Plug>RSendSelection", "Send Selection to R" },
}

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

-- Turn diagnostics on/off. COMPLETELY OFF.
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

-- Toggle colorcolumn
Colorcolumn_active = false
Toggle_colorcolumn = function()
  Colorcolumn_active = not Colorcolumn_active
  if Colorcolumn_active then
    vim.opt.colorcolumn = "80"
  else
    vim.opt.colorcolumn = ""
  end
end


-- function to toggle line wrap
WrapActive = vim.opt.wrap
ToggleWrap = function()
    WrapActive = not WrapActive
    if WrapActive then
        vim.opt.wrap = true
    else
        vim.opt.wrap = false
    end
end


lvim.builtin.which_key.mappings['q'] = {
    name = "Toggle Functions",
    q = { "<cmd>lua Toggle_diagnostics()<cr>", "toggle diagnostics" },
    Q = { "<cmd>lua Turnoff_diagnostics()<cr>", "turn off diagnostics" },
    H = { '<cmd>lua vim.lsp.buf.hover()<CR>', "Hover diagnostics"},
    c = { '<cmd>lua Toggle_colorcolumn()<CR>', "Toggle colorcolumn"},
    w = { "<cmd>lua ToggleWrap()<CR>", "Toggle line wrap"},
    t = { "<cmd>lua require('treesitter-context').toggle()<CR>", "Toggle Treesitter Context"},
}

vim.keymap.set('n', 'Q', '<cmd>lua vim.diagnostic.open_float()<CR>')


-- lvim.builtin.which_key.mappings['qw'] = {
--     "<cmd>lua ToggleWrap()<cr>", "toggle line wrap"
-- }
--

--------------
-- Trouble ---
--------------

lvim.builtin.which_key.mappings["t"] = {
  name = "Diagnostics",
  t = { "<cmd>TroubleToggle<cr>", "trouble" },
  w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
  d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}

lvim.builtin.which_key.mappings['to'] = {
    "<cmd>TodoTelescope<cr>", "TODOs find"
}
lvim.builtin.which_key.mappings['tp'] = {
    "<cmd>TodoQuickFix<cr>", "TODOs QuickFix"
}
----------------
-- ToggleTerm --
----------------

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

--------------
-- Iron Vim --
--------------

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





