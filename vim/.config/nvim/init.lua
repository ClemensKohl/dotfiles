-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("mini.align").setup()
-- require("telescope").load_extension("heading")

-- -- Molten status line
-- require("molten.status").initialized() -- "Molten" or "" based on initialization information
-- require("molten.status").kernels()     -- "kernel1 kernel2" list of kernels attached to buffer or ""
-- -- require('molten.status').all_kernels() -- same as kernels, but will show all kernels
