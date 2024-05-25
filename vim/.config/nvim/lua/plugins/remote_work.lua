-- Helpful plugins for remote work.
-- stylua: ignore
-- if true then return {} end

return {
  -- Transfer files from and to remote servers.
  {
    "coffebar/transfer.nvim",
    lazy = true,
    cmd = { "TransferInit", "DiffRemote", "TransferUpload", "TransferDownload", "TransferDirDiff", "TransferRepeat" },
    opts = {},
  },
}
