return {
  -- Setting up Markdown highlighting
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      code = {
        -- Turn on / off code block & inline code rendering
        enabled = true,
        sign = false,
        position = "left",
        language_icon = true,
        language_pad = 0,
        language_name = false,
        language_info = false,
        width = "full",
        right_pad = 1,
        border = "thick",
      },
      heading = {
        sign = false,
        icons = {},
      },
      checkbox = {
        enabled = true,
      },
      win_options = { conceallevel = { default = 0 } },
    },
    ft = { "markdown", "norg", "rmd", "org", "quarto" },
  },
}
