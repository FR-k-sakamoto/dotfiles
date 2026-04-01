# nvim-cmp セットアップガイド

## 概要
`nvim-cmp` は、Neovim 用の非常に柔軟で強力な自動補完エンジンです。LSP、スニペット、バッファ内の単語、パスなど、様々なソースからの補完を統合して表示します。

## 前提条件
- Neovim 0.7.0 以上
- `nvim-lspconfig` (LSP補完を利用する場合)

## 設定例 (lua/plugins/completion.lua)
```lua
{
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
  },
  config = function()
    local cmp = require("cmp")
    cmp.setup({
      -- 補完ソースの設定
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
      }, {
        { name = "buffer" },
        { name = "path" },
      }),
      -- キーバインドの設定
      mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        -- ...
      }),
    })
  end
}
```

## 基本操作
| キー | アクション |
| :--- | :--- |
| `<C-Space>` | 補完メニューを手動で開く |
| `<C-e>` | 補完メニューを閉じる |
| `<CR>` | 選択中の候補を確定 |
| `<Tab>` | 次の候補を選択 / スニペットの次の位置へジャンプ |
| `<S-Tab>` | 前の候補を選択 / スニペットの前の位置へジャンプ |
| `<C-f>` | ドキュメントを下にスクロール |
| `<C-b>` | ドキュメントを上にスクロール |
