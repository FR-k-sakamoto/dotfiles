# markview.nvim セットアップガイド

`markview.nvim` は、Neovim 内で Markdown や Typst、LaTeX などを美しく描画するための、高度にカスタマイズ可能なプレビュー・プラグインです。

## 前提条件

- **Neovim**: 0.10.3 以上
- **Nerd Font**: アイコンの表示に推奨されます。
- **Treesitter パーサー**:
    - `markdown`
    - `markdown_inline`
    - `html` (任意)
    - `latex` (任意)
    - `typst` (任意)
    - `yaml` (任意)

## インストールと設定 (lazy.nvim)

`lua/plugins/markview.lua` に以下の設定を記述します。プラグイン側で遅延読み込みが管理されているため、`lazy = false` が推奨されています。

```lua
return {
    "OXY2DEV/markview.nvim",
    lazy = false, -- プラグインによる推奨
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        preview = {
            icon_provider = "devicons", -- nvim-web-devicons を使用する場合
        },
    },
}
```

## 基本コマンド

Markdown ファイルを開いている時に以下のコマンドを使用できます。

| コマンド | 説明 |
| :--- | :--- |
| `:Markview` | コマンド単体では `:Markview Toggle` と同じ動作をします。 |
| `:Markview Toggle` | プレビューの有効/無効を切り替えます。 |
| `:Markview Enable` | プレビューを有効にします。 |
| `:Markview Disable` | プレビューを無効にします。 |
| `:Markview HybridToggle` | ハイブリッドモード（カーソル行のみソースを表示）を切り替えます。 |

## 注意事項

- インストール後、`:checkhealth markview` を実行して、依存関係や設定に問題がないか確認することをお勧めします。
- `render-markdown.nvim` とは競合するため、一方のみを有効にしてください。
