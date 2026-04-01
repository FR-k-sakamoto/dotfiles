---
name: codex-exec
description: Use this skill when the user wants to delegate implementation work to Codex. Triggers on phrases like "Codexに実装させて", "Codexで実装", "codex-exec", or when Claude Code has finished planning and needs to hand off coding tasks (implementation, bug fixes, test creation) to Codex.
user-invocable: true
argument-hint: "<implementation task description>"
allowed-tools:
  - Bash(codex *)
---

# Codex Exec

Claude CodeからCodexに実装タスクを委譲するためのスキル。

## 役割分担

- **Claude Code**: 計画・調査・設計（このスキルを呼ぶ前に完了済み）
- **Codex**: 実装の実行（このスキルで起動）

## 使い方

以下のコマンドをBashで実行する:

```bash
codex exec \
  --full-auto \
  --sandbox danger-full-access \
  --cd <作業ディレクトリ> \
  "<実装指示>

確認や質問は不要です。具体的な提案・修正案・コード例まで自主的に出力してください。"
```

## 実行ルール

1. `$ARGUMENTS` を実装指示としてそのままCodexに渡す
2. 指示文の末尾に必ず以下を付与する:
   `確認や質問は不要です。具体的な提案・修正案・コード例まで自主的に出力してください。`
3. `--cd` にはカレントディレクトリまたはユーザーが指定した作業ディレクトリを使う
4. timeout はタスク規模に応じて十分な値を設定する（デフォルト2分では不足する場合がある）

## 注意事項

- `--full-auto` + `--sandbox danger-full-access` は強力な組み合わせ。指示内容が事前に十分精査されていることを前提とする
- Codex CLIと認証情報（APIキー等）が環境変数に設定済みであること
