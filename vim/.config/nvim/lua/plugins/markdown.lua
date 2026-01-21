return {
  -- Setting up Markdown highlighting
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      render_modes = { "n", "c", "t", "i" },
      code = {
        -- Turn on / off code block & inline code rendering
        enabled = true,
        sign = false,
        position = "left",
        language_icon = true,
        language_pad = 0,
        language_name = false,
        language_info = false,
        width = "block",
        right_pad = 3,
        border = "thick",
        render_modes = { "n", "i", "v", "V", "t", "c" },
      },
      heading = {
        sign = false,
        icons = {},
      },
      checkbox = {
        enabled = true,
      },
      -- win_options = { conceallevel = { default = 0 } },
    },
    ft = { "md", "markdown", "norg", "rmd", "org", "quarto", "ipynb" },
  },
}
