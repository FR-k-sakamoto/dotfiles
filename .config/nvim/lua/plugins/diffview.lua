return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory", "DiffviewToggleFiles" },
  keys = {
    { "<leader>gd", "<cmd>DiffviewOpen<CR>", desc = "Diffview: 差分を開く" },
    { "<leader>gc", "<cmd>DiffviewClose<CR>", desc = "Diffview: 閉じる" },
    { "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", desc = "Diffview: 現在ファイルの履歴" },
    { "<leader>gH", "<cmd>DiffviewFileHistory<CR>", desc = "Diffview: リポジトリ全体の履歴" },
  },
  opts = {},
}
