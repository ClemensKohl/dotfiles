-- Plugins loaded by clemens.

return {

  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  { "sainnhe/gruvbox-material" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox", -- alternative: gruvbox-material
      gruvbox_material_background = "medium",
      gruvbox_material_better_performance = 1,
    },
  },
}
