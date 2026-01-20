return {
  -- Make Jupyter notebooks into text files
  {
    "GCBallesteros/jupytext.nvim",
    config = function()
      require("jupytext").setup({
        style = "quarto",
        output_extension = "qmd",
        force_ft = "quarto",
      })
    end,
    -- Depending on your nvim distro or config you may need to make the loading not lazy
    -- lazy=false,
  },

  { -- send code from python/r/qmd documets to a terminal or REPL
    -- like ipython, R, bash
    "jpalardy/vim-slime",
    dev = false,
    init = function()
      vim.b["quarto_is_python_chunk"] = false
      Quarto_is_in_python_chunk = function()
        require("otter.tools.functions").is_otter_language_context("python")
      end

      vim.cmd([[
      let g:slime_dispatch_ipython_pause = 100
      function SlimeOverride_EscapeText_quarto(text)
      call v:lua.Quarto_is_in_python_chunk()
      if exists('g:slime_python_ipython') && len(split(a:text,"\n")) > 1 && b:quarto_is_python_chunk && !(exists('b:quarto_is_r_mode') && b:quarto_is_r_mode)
      return ["%cpaste -q\n", g:slime_dispatch_ipython_pause, a:text, "--", "\n"]
      else
      if exists('b:quarto_is_r_mode') && b:quarto_is_r_mode && b:quarto_is_python_chunk
      return [a:text, "\n"]
      else
      return [a:text]
      end
      end
      endfunction
      ]])

      vim.g.slime_target = "neovim"
      vim.g.slime_no_mappings = true
      vim.g.slime_python_ipython = 1
    end,
    config = function()
      vim.g.slime_input_pid = false
      vim.g.slime_suggest_default = true
      vim.g.slime_menu_config = false
      vim.g.slime_neovim_ignore_unlisted = true

      local function mark_terminal()
        local job_id = vim.b.terminal_job_id
        vim.print("job_id: " .. job_id)
      end

      local function set_terminal()
        vim.fn.call("slime#config", {})
      end
      vim.keymap.set("n", "<leader>ctm", mark_terminal, { desc = "[m]ark terminal" })
      vim.keymap.set("n", "<leader>cts", set_terminal, { desc = "[s]et terminal" })
    end,
  },

  {
    "quarto-dev/quarto-nvim",
    dependencies = {
      "jmbuhr/otter.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      lspFeatures = {
        languages = { "r", "R", "python", "bash" },
        chunks = "curly",
        diagnostics = {
          enabled = true,
          triggers = { "BufWritePost" },
        },
        completion = {
          enabled = true,
        },
      },
      -- keymap = {
      -- NOTE: setup your own keymaps:
      --   hover = "H",
      --   definition = "gd",
      --   rename = "<localleader>rn",
      --   references = "gr",
      --   format = "<localleader>gf",
      -- },
      codeRunner = {
        enabled = true,
        default_method = "slime",
      },
    },
    ft = { "quarto", "markdown", "ipython" },
    keys = {
      { "<localleader>qi", "<cmd>QuartoActivate<cr>", mode = "n", desc = "quarto activate" },
      { "<localleader>qc", "<cmd>lua require('quarto.runner').run_cell()<cr>", mode = "n", desc = "run cell" },
      {
        "<localleader>qa",
        "<cmd>lua require('quarto.runner').run_above()<cr>",
        mode = "n",
        desc = "run cell and above",
      },
      { "<localleader>qA", "<cmd>lua require('quarto.runner').run_all()<cr>", mode = "n", desc = "run all cells" },
      { "<localleader>ql", "<cmd>lua require('quarto.runner').run_line()<cr>", mode = "n", desc = "run line" },
      {
        "<localleader>qR",
        function()
          require("quarto.runner").run_all(true)
        end,
        mode = "n",
        desc = "run all cells of all languages",
      },
      { "<localleader>qr", "<cmd>lua require('quarto.runner').run_range()<cr>", mode = "v", desc = "run visual range" },
    },
    -- keys = {
    --   { "<leader>qa", ":QuartoActivate<cr>", desc = "quarto activate" },
    --   { "<leader>qp", ":lua require'quarto'.quartoPreview()<cr>", desc = "quarto preview" },
    --   { "<leader>qq", ":lua require'quarto'.quartoClosePreview()<cr>", desc = "quarto close" },
    --   { "<leader>qh", ":QuartoHelp ", desc = "quarto help" },
    --   { "<leader>qe", ":lua require'otter'.export()<cr>", desc = "quarto export" },
    --   { "<leader>qE", ":lua require'otter'.export(true)<cr>", desc = "quarto export overwrite" },
    --   { "<leader>qrr", ":QuartoSendAbove<cr>", desc = "quarto run to cursor" },
    --   { "<leader>qra", ":QuartoSendAll<cr>", desc = "quarto run all" },
    --   { "<leader><cr>", ":SlimeSend<cr>", desc = "send code chunk" },
    --   { "<c-cr>", ":SlimeSend<cr>", desc = "send code chunk" },
    --   { "<c-cr>", "<esc>:SlimeSend<cr>i", mode = "i", desc = "send code chunk" },
    --   { "<c-cr>", "<Plug>SlimeRegionSend<cr>", mode = "v", desc = "send code chunk" },
    --   { "<cr>", "<Plug>SlimeRegionSend<cr>", mode = "v", desc = "send code chunk" },
    --   { "<leader>ctr", ":split term://R<cr>", desc = "terminal: R" },
    --   { "<leader>cti", ":split term://ipython<cr>", desc = "terminal: ipython" },
    --   { "<leader>ctp", ":split term://python<cr>", desc = "terminal: python" },
    --   { "<leader>ctj", ":split term://julia<cr>", desc = "terminal: julia" },
    -- },
  },

  --provides lsp features and a code completion source for code embedded in other documents
  {
    "jmbuhr/otter.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      lsp = {
        -- `:h events` that cause the diagnostics to update. Set to:
        -- { "BufWritePost", "InsertLeave", "TextChanged" } for less performant
        -- but more instant diagnostic updates
        diagnostic_update_events = { "InsertLeave" },
      },
      buffers = {
        -- if set to true, the filetype of the otterbuffers will be set.
        -- otherwise only the autocommand of lspconfig that attaches
        -- the language server will be executed without setting the filetype
        set_filetype = true,
      },
    },
  },
}
