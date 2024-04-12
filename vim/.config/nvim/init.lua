-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Molten status line
require("molten.status").initialized() -- "Molten" or "" based on initialization information
require("molten.status").kernels()     -- "kernel1 kernel2" list of kernels attached to buffer or ""
-- require('molten.status').all_kernels() -- same as kernels, but will show all kernels


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
