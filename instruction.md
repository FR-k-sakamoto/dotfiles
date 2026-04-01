# Dotfiles リファレンス

## Neovim プラグイン一覧

| プラグイン | 説明 |
|-----------|------|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | プラグインマネージャー |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | シンタックスハイライト・インデント |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | ファジーファインダー |
| [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim) | Telescope の FZF 拡張 |
| [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) | ファイルエクスプローラー |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | キーバインドヘルパー |
| [Comment.nvim](https://github.com/numToStr/Comment.nvim) | コメントトグル (`gc` / `gcc`) |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | 括弧の自動補完 |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | 補完エンジン |
| [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) | LSP 補完ソース |
| [cmp-buffer](https://github.com/hrsh7th/cmp-buffer) | バッファ補完ソース |
| [cmp-path](https://github.com/hrsh7th/cmp-path) | パス補完ソース |
| [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline) | コマンドライン補完ソース |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | スニペットエンジン |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | LSP サーバー管理 |
| [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) | Mason と lspconfig の連携 |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP 設定 |
| [markview.nvim](https://github.com/OXY2DEV/markview.nvim) | Markdown プレビュー |
| [diffview.nvim](https://github.com/sindrets/diffview.nvim) | Git diff ビューア |
| [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) | ファイルアイコン |
| [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) | Lua ユーティリティライブラリ |
| [nui.nvim](https://github.com/MunifTanjim/nui.nvim) | UI コンポーネントライブラリ |

## Neovim キーバインド

Leader キーは `\`（デフォルト）。

### ファイル操作 (Telescope)

| キー | 説明 |
|------|------|
| `<leader>ff` | ファイル検索 |
| `<leader>fg` | テキスト検索 (Live Grep) |
| `<leader>fb` | バッファ一覧 |
| `<leader>fh` | ヘルプタグ検索 |
| `<leader>fc` | コマンド検索 |

Telescope 内操作: `Ctrl+j` / `Ctrl+k` で上下移動、`Ctrl+q` で quickfix リストへ送信、`Ctrl+x` でバッファ削除

### ファイルエクスプローラー (Neo-tree)

| キー | 説明 |
|------|------|
| `<leader>e` | エクスプローラー開閉 |
| `<leader>q` | エクスプローラーにフォーカス |

### Git (Telescope + Diffview)

| キー | 説明 |
|------|------|
| `<leader>gs` | Git Status (Telescope) |
| `<leader>gc` | Git Commits (Telescope) |
| `<leader>gd` | Diffview を開く |
| `<leader>gh` | 現在のファイルの Git 履歴 |
| `<leader>gH` | 全ファイルの Git 履歴 |
| `<leader>gq` | Diffview を閉じる |

### LSP

| キー | 説明 |
|------|------|
| `gd` | 定義へジャンプ |
| `gr` | 参照一覧 |
| `gi` | 実装へジャンプ |
| `K` | ホバー情報 |
| `Ctrl+k` | シグネチャヘルプ |
| `<leader>rn` | リネーム |
| `<leader>ca` | コードアクション |
| `<leader>f` | フォーマット |

### 補完 (nvim-cmp)

| キー | 説明 |
|------|------|
| `Tab` | 次の候補 / スニペットジャンプ |
| `Shift+Tab` | 前の候補 |
| `Enter` | 確定 |
| `Ctrl+Space` | 補完を手動起動 |
| `Ctrl+e` | 補完をキャンセル |
| `Ctrl+b` / `Ctrl+f` | ドキュメントスクロール |

### コメント (Comment.nvim)

| キー | 説明 |
|------|------|
| `gcc` | 行コメントトグル |
| `gc` (ビジュアル) | 選択範囲コメントトグル |

### その他

| キー | 説明 |
|------|------|
| `<leader>?` | ローカルキーマップ表示 (which-key) |

---

## WezTerm キーバインド

Leader キーは `Ctrl+g`（タイムアウト: 2秒）。

### タブ操作

| キー | 説明 |
|------|------|
| `Ctrl+Tab` | 次のタブ |
| `Ctrl+Shift+Tab` | 前のタブ |
| `Super+1~9` | タブを番号で切替 |
| `Ctrl+t` / `Super+t` | 新規タブ |
| `Ctrl+w` / `Super+w` | タブを閉じる |

### Pane 操作

| キー | 説明 |
|------|------|
| `Leader, -` | 水平分割 |
| `Leader, \` | 垂直分割 |
| `Leader, h/j/k/l` | Pane 移動 |
| `Leader, z` | Pane ズームトグル |
| `Leader, p` | Pane リサイズモード (`h/j/k/l` でリサイズ、`Enter` で終了) |

### コピー＆ペースト

| キー | 説明 |
|------|------|
| `Leader, [` | コピーモード起動 |
| `Ctrl+Shift+C` / `Super+c` | コピー |
| `Ctrl+Shift+V` / `Super+v` | ペースト |
| `Ctrl+Insert` | コピー |
| `Shift+Insert` | ペースト |

### コピーモード内操作

| キー | 説明 |
|------|------|
| `h/j/k/l` | カーソル移動 |
| `w/b/e` | 単語単位移動 |
| `0/^/$` | 行頭・行末移動 |
| `g/G` | 先頭・末尾移動 |
| `H/M/L` | 画面上部・中央・下部 |
| `v` | 文字選択 |
| `V` | 行選択 |
| `Ctrl+v` | 矩形選択 |
| `y` | コピー |
| `Enter` | コピーして終了 |
| `Escape` | コピーモード終了 |

### 検索モード

| キー | 説明 |
|------|------|
| `Ctrl+n` | 次のマッチ |
| `Ctrl+p` | 前のマッチ |
| `Ctrl+r` | マッチタイプ切替 |
| `Ctrl+u` | パターンクリア |
| `Escape` | 検索終了 |

### その他

| キー | 説明 |
|------|------|
| `Alt+Shift+Enter` | フルスクリーン |
| `Ctrl+Shift+p` | コマンドパレット |
| `Ctrl+-` / `Ctrl+=` | フォントサイズ変更 |
| `Super+n` | 新規ウィンドウ |
| `Super+q` | アプリケーション終了 |
| `Super+h` | ウィンドウ非表示 |
