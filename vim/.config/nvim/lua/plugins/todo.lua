-- stylua: ignore
-- if true then return {} end

return {
  {
    "folke/todo-comments.nvim",
    opts = {
      keywords = {
        BOOKMARK = {
          icon = "⚑", -- icon used for the sign, and in search results
          color = "#702963", -- can be a hex color, or a named color (see below)
          alt = { "SAVE", "WIP" }, -- a set of other keywords that all map to this FIX keywords
        },
      },
    },
  },
}

--⚒☛
