return {
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
