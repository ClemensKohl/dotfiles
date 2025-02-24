return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "default",
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
        -- ["<Esc>"] = { "hide", "fallback" },
        ["<PageUp>"] = { "scroll_documentation_up", "fallback" },
        ["<PageDown>"] = { "scroll_documentation_down", "fallback" },
      },
    },
  },

  {
    "saghen/blink.cmp",
    opts = {
      -- Disable for some filetypes
      enabled = function()
        return not vim.tbl_contains({ "typr" }, vim.bo.filetype)
          and vim.bo.buftype ~= "prompt"
          and vim.b.completion ~= false
      end,
    },
  },
}
