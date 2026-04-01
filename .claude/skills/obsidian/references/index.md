# Obsidian CLI Command Index

> Breadcrumb: [Obsidian CLI]

## Categories

### 1. Daily Notes
Breadcrumb: [Obsidian CLI] > [Daily Notes]

| Command | Description |
|---------|-------------|
| `obsidian daily` | Open today's daily note |
| `obsidian daily:append content="..."` | Append content to today's daily note |
| `obsidian daily:append content="..." open` | Append and open the note |

### 2. Tasks
Breadcrumb: [Obsidian CLI] > [Tasks]

| Command | Description |
|---------|-------------|
| `obsidian tasks daily` | List all tasks in today's daily note |
| `obsidian tasks daily total` | Count tasks in today's daily note |

### 3. File Operations
Breadcrumb: [Obsidian CLI] > [File Operations]

| Command | Description |
|---------|-------------|
| `obsidian create name="..." content="..."` | Create a new note |
| `obsidian create name="..." template=...` | Create note from template |
| `obsidian append file="..." content="..."` | Append content to a file |
| `obsidian read file="..."` | Read file content |
| `obsidian files sort=modified limit=N` | List files sorted by criteria |
| `obsidian files sort=modified limit=N --copy` | List files and copy to clipboard |
| `obsidian diff file=... from=N to=N` | Compare file versions |
| `obsidian unresolved` | Check for unresolved links |

### 4. Search
Breadcrumb: [Obsidian CLI] > [Search]

| Command | Description |
|---------|-------------|
| `obsidian search query="..."` | Search file paths |
| `obsidian search:context query="..." limit=N` | Contextual grep-style search |
| `obsidian search query="..." format=json` | Search with JSON output |

### 5. Tags & Properties
Breadcrumb: [Obsidian CLI] > [Tags & Properties]

| Command | Description |
|---------|-------------|
| `obsidian tags counts` | View all tags with frequency |

### 6. Developer
Breadcrumb: [Obsidian CLI] > [Developer]

| Command | Description |
|---------|-------------|
| `obsidian devtools` | Open DevTools |
| `obsidian plugin:reload id=...` | Reload a plugin |
| `obsidian dev:screenshot file=...` | Capture UI screenshot |
| `obsidian eval` | Execute JavaScript |
| `obsidian dev:errors` | Review error log |
| `obsidian dev:css selector="..."` | Inspect CSS for a selector |
| `obsidian dev:dom selector="..."` | Query DOM elements |

### 7. System
Breadcrumb: [Obsidian CLI] > [System]

| Command | Description |
|---------|-------------|
| `obsidian` | Open TUI with autocomplete |
| `obsidian help` | Show all available commands |
| `obsidian version` | Display installed version |

## Global Options

| Option | Description |
|--------|-------------|
| `vault="..."` | Specify target vault (must appear first) |
| `format=json` | Output in JSON format |
| `--copy` | Copy output to clipboard |

## Notes

- This index is based on publicly documented commands as of early 2026.
- For the latest full command list, run `obsidian help` in your terminal.
- Obsidian CLI docs: https://help.obsidian.md/cli
