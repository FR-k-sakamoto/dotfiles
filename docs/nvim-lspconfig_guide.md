# nvim-lspconfig セットアップガイド

## 概要
`nvim-lspconfig` は、Neovim の組み込み LSP クライアントを簡単に設定するためのプラグインです。各言語サーバーのデフォルト設定を提供し、バッファへのアタッチやキーバインドの設定を容易にします。

## 前提条件
- Neovim 0.8.0 以上
- 各言語のランタイム（Node.js, Go 等）

## 設定例 (lua/plugins/lsp.lua)
```lua
{
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "mason.nvim",
    "mason-lspconfig.nvim",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local on_attach = function(client, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      -- ... その他のキーバインド
    end

    -- Mason経由でインストールされたサーバーの設定
    local servers = { "ts_ls", "gopls", "tailwindcss" }
    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end
  end
}
```

## 基本操作
| キー | アクション |
| :--- | :--- |
| `gd` | 定義へジャンプ |
| `K` | ホバー表示（型情報やドキュメント） |
| `gi` | 実装へジャンプ |
| `gr` | 参照一覧を表示 |
| `<leader>rn` | リネーム |
| `<leader>ca` | コードアクション（クイックフィックス等） |
| `<leader>f` | コード整形 |
