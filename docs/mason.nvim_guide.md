# mason.nvim セットアップガイド

## 概要
`mason.nvim` は、LSPサーバー、DAPサーバー、リンター、フォーマッターを Neovim 内から簡単に管理（インストール・更新・削除）するためのプラグインです。

## 前提条件
- Neovim 0.7.0 以上
- `git`, `curl`, `unzip`, `tar` などの標準的なツール

## 設定例 (lua/plugins/lsp.lua)
```lua
{
  "williamboman/mason.nvim",
  cmd = "Mason",
  build = ":MasonUpdate",
  opts = {
    ensure_installed = {
      "typescript-language-server",
      "lua-language-server",
      "tailwindcss-language-server",
    },
  },
  config = function(_, opts)
    require("mason").setup(opts)
    -- ... ensure_installed の自動インストール処理など
  end
}
```

## 基本操作
| コマンド | 説明 |
| :--- | :--- |
| `:Mason` | Mason UIを開く（インストール状況の確認・管理） |
| `:MasonUpdate` | Mason レジストリを更新 |
| `:MasonInstall <package>` | 指定したパッケージをインストール |
| `:MasonUninstall <package>` | 指定したパッケージをアンインストール |
| `i` | (UI内) パッケージをインストール |
| `u` | (UI内) パッケージを更新 |
| `X` | (UI内) パッケージを削除 |
