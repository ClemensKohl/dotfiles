---------------------------
-- Send line to terminal --
---------------------------
local M = {}

function M.terminal_send(text)
  First_terminal_chan = Get_first_terminal()

  vim.api.nvim_chan_send(First_terminal_chan, text)
end

function Get_first_terminal()
  Terminal_chans = {}

  for _, chan in pairs(vim.api.nvim_list_chans()) do
    if chan["mode"] == "terminal" and chan["pty"] ~= "" then
      table.insert(Terminal_chans, chan)
    end
  end

  table.sort(Terminal_chans, function(left, right)
    return left["buffer"] < right["buffer"]
  end)

  return Terminal_chans[1]["id"]
end

return M
