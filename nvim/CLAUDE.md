# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repo Is

NvChad-based Neovim configuration. Plugin manager: lazy.nvim. Theme: onedark.

## Lua Formatting

Enforced by `.stylua.toml`: 120 col width, 2-space indent, Unix line endings, double quotes preferred.

Format Lua files with:
```
stylua <file>
```

## Architecture

```
init.lua                  # Entry: bootstraps lazy.nvim, loads config modules
lua/chadrc.lua            # NvChad theme & top-level UI overrides
lua/options.lua           # Neovim options (markdown, folding, conceallevel)
lua/custom/options.lua    # Additional vim options (relative numbers, scrolloff)
lua/mappings.lua          # All keybindings, organized by domain (~500 lines)
lua/plugins/init.lua      # All plugin specs (lazy.nvim declarations)
lua/configs/              # One file per plugin's setup() call
lua/configs/lazy.lua      # Lazy.nvim options + disabled built-in plugins
```

**Pattern for adding a plugin:** declare spec in `lua/plugins/init.lua`, add config in `lua/configs/<plugin>.lua`, add keymaps to `lua/mappings.lua`.

## Key Configs

| File | Controls |
|------|----------|
| `configs/lspconfig.lua` | LSP servers: html, cssls, ts_ls, jsonls, lua_ls, ruff, pyright, eslint |
| `configs/conform.lua` | Formatters: prettier (JS/TS/CSS/HTML/JSON/MD), stylua (Lua), ruff_format (Python). Format-on-save with 1s timeout |
| `configs/treesitter.lua` | Parsers: bash, css, dockerfile, html, js, ts, tsx, json, lua, md, python, sql, yaml + more |
| `configs/snacks.lua` | Dashboard, notifications, LazyGit terminal, indent guides, statuscolumn |
| `configs/telescope.lua` | Fuzzy finder; custom toggle for hiding test files (`<leader>fT`) |
| `configs/neotest.lua` | Test runner; Vitest adapter |
| `configs/octo.lua` | GitHub PR/issue management |
| `configs/obsidian.lua` | Obsidian vault at `~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Second Brain` |
| `configs/dadbod.lua` | Database UI; PostgreSQL helpers (Count, Describe, Indexes, Explain) |
| `configs/kulala.lua` | HTTP client for `.http`/`.rest` files |
| `configs/claudecode.lua` | Claude Code Neovim integration |

## Keymap Conventions

Leader: `<Space>`

| Prefix | Domain |
|--------|--------|
| `<leader>f` | Find/Telescope |
| `<leader>l` | LSP actions |
| `<leader>t` | Tests (neotest) |
| `<leader>tr` | Trouble diagnostics |
| `<leader>gh` | Git hunks (gitsigns) |
| `<leader>go` | Git open (LazyGit, log) |
| `<leader>gd` | Git diff |
| `<leader>dv` | DiffView |
| `<leader>pr` | GitHub PRs (Octo) |
| `<leader>gi` | GitHub Issues (Octo) |
| `<leader>gw` | Git worktrees |
| `<leader>db` | Database (dadbod) |
| `<leader>R` | HTTP requests (kulala) |
| `<leader>on` | Obsidian notes |
| `<leader>c` | Claude Code |
| `<leader>z` | Folds |

## Notable Custom Logic

- **TypeScript source navigation** (`mappings.lua`): `gd` detects `ts_ls` client and uses `LspTypescriptGoToSourceDefinition` for source-mapped files.
- **Test file filter** (`configs/telescope.lua`): `<leader>fT` toggles visibility of `*.test.*`/`*.spec.*` files in pickers.
- **Git worktree resolution** (`configs/git-worktree.lua`): worktree creation resolves the common git dir from any worktree, not just root.
- **Diagnostic yank** (`mappings.lua`): `<leader>ly` copies current line's diagnostic message to clipboard.
- **Dashboard git panels** (`configs/snacks.lua`): startup shows live `git diff --stat`, `gh issue list`, `gh pr list`; auto-refreshes every 5 min.

## Performance Notes

Lazy loading is default for all plugins. 24 built-in plugins disabled (`netrw`, `gzip`, `tar`, `vimball`, etc.) — see `configs/lazy.lua`. Don't add `lazy = false` without reason.
