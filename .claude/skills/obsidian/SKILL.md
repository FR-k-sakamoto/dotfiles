---
name: obsidian
description: This skill should be used when the user asks about "Obsidian CLI", "obsidian commands", "vault operations from terminal", "obsidian daily notes CLI", "obsidian search command", "obsidian task management CLI", or needs help using the Obsidian command line interface. Provides hierarchical documentation for efficient command lookup.
user-invocable: true
argument-hint: "[command or topic, e.g. 'daily', 'search', 'create']"
allowed-tools:
  - Read
  - WebFetch
  - Bash(obsidian *)
---

# Obsidian CLI Documentation

Obsidian CLI lets you do anything you can do in Obsidian from the command line: read/write notes, manage tasks, search your vault, create notes from templates, manage plugins, and more.

## Important: use `path=` instead of `file=`

`file=` resolves by name (like wikilinks) and results are cached, which causes multiple reads to return stale/identical content. **Always use `path=` (exact path) instead of `file=`** for `read`, `append`, `prepend`, and other file operations to avoid cache issues.

```bash
# BAD - cached, may return stale content
obsidian read file="My Note"

# GOOD - no cache issues
obsidian read path="00_Inbox/My Note.md"
```

To get the exact path of a file, use `obsidian file file="My Note"` first, then use the returned `path` value for subsequent operations.

## How to use this skill

1. Read `references/index.md` to find the relevant command category
2. If the user needs more detail than the index provides, fetch the latest docs from `https://help.obsidian.md/cli` using WebFetch
3. If the user wants to execute a command, use Bash with the `obsidian` command

## Tag rules

When creating or updating notes, **always read the target vault's `README.md` first** to check the tag conventions. Each vault defines its own tag hierarchy (e.g. `#status/*`, `#type/*`, `#context/*`). Apply tags according to those rules.

```bash
# Read tag rules before creating a note
obsidian vault="<vault>" read path="README.md"
```

## Quick Reference

| Category | Key Commands |
|----------|-------------|
| Daily Notes | `daily`, `daily:append` |
| Tasks | `tasks daily`, `tasks daily total` |
| File Ops | `create`, `append`, `read`, `files`, `diff`, `unresolved` |
| Search | `search`, `search:context` |
| Tags | `tags counts` |
| Developer | `devtools`, `plugin:reload`, `dev:screenshot`, `eval`, `dev:errors`, `dev:css`, `dev:dom` |
| System | `help`, `version` |

## Global Options

- `vault="name"` — specify target vault (must be first argument)
- `format=json` — JSON output
- `--copy` — copy to clipboard

## When you need more detail

Run `obsidian help` or fetch the official docs to get the latest command list. The CLI is actively evolving and new commands may be added.
