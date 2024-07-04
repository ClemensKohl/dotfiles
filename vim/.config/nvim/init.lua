-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- -- Molten status line
-- require("molten.status").initialized() -- "Molten" or "" based on initialization information
-- require("molten.status").kernels()     -- "kernel1 kernel2" list of kernels attached to buffer or ""
-- -- require('molten.status').all_kernels() -- same as kernels, but will show all kernels

-- Thesaurus function from the help files
vim.cmd([[
func Thesaur(findstart, base)
  if a:findstart
    return searchpos('\<', 'bnW', line('.'))[1] - 1
  endif
  let res = []
  let h = ''
  for l in systemlist('aiksaurus ' .. shellescape(a:base))
    if l[:3] == '=== '
      let h = '(' .. substitute(l[4:], ' =*$', ')', '')
    elseif l ==# 'Alphabetically similar known words are: '
      let h = "\U0001f52e"
    elseif l[0] =~ '\a' || (h ==# "\U0001f52e" && l[0] ==# "\t")
      call extend(res, map(split(substitute(l, '^\t', '', ''), ', '), {_, val -> {'word': val, 'menu': h}}))
    endif
  endfor
  return res
endfunc

if exists('+thesaurusfunc')
  set thesaurusfunc=Thesaur
endif
]])
-- vim.opt.thesaurusfunc = 'Thesaur'
--
--
--
require("headlines").setup({
  quarto = {
    query = vim.treesitter.query.parse(
      "markdown",
      [[
        (atx_heading [
          (atx_h1_marker)
          (atx_h2_marker)
          (atx_h3_marker)
          (atx_h4_marker)
          (atx_h5_marker)
          (atx_h6_marker)
        ] @headline)

        (thematic_break) @dash

        (fenced_code_block) @codeblock

        (block_quote_marker) @quote
        (block_quote (paragraph (inline (block_continuation) @quote)))
        (block_quote (paragraph (block_continuation) @quote))
        (block_quote (block_continuation) @quote)
      ]]
    ),
    headline_highlights = { "Headline1", "Headline2", "Headline3", "Headline4", "Headline5", "Headline6" },
    bullet_highlights = {
      "@text.title.1.marker.markdown",
      "@text.title.2.marker.markdown",
      "@text.title.3.marker.markdown",
      "@text.title.4.marker.markdown",
      "@text.title.5.marker.markdown",
      "@text.title.6.marker.markdown",
    },
    treesitter_language = "markdown",
    bullets = {},
    codeblock_highlight = "CodeBlock",
    dash_highlight = "Dash",
    dash_string = "-",
    quote_highlight = "Quote",
    quote_string = "┃",
    fat_headlines = true,
    fat_headline_upper_string = "▃",
    fat_headline_lower_string = "🬂",
  },
})
