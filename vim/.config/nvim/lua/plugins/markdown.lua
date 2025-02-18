return {
  -- Setting up Markdown highlighting
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      code = {
        -- Turn on / off code block & inline code rendering
        enabled = true,
        sign = false,
        width = "block",
        right_pad = 1,
      },
      heading = {
        sign = false,
        icons = {},
      },
      checkbox = {
        enabled = true,
      },
    },
    ft = { "markdown", "norg", "rmd", "org", "quarto" },
  },
}
