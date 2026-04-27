# Neovim Workflow Reference

Leader = `<Space>`

---

## Navigation

### Jump (Flash)
| Key | Action |
|-----|--------|
| `s` | Jump to any visible position |
| `S` | Jump by treesitter node |
| `r` | Remote jump (operator-pending) |

### LSP Navigation (bare g)
| Key | Action |
|-----|--------|
| `gd` | Go to definition (TS: source-aware) |
| `gD` | Go to declaration |
| `gr` | References → Glance float |
| `gi` | Implementations → Glance float |
| `gt` | Type definition → Glance float |
| `gs` | Document symbols → Telescope |
| `gS` | Workspace symbols → Telescope |

### Diagnostics
| Key | Action |
|-----|--------|
| `]e` / `[e` | Next / prev error |

---

## Find (Telescope) `<leader>f`

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fw` | Grep word under cursor |
| `<leader>fb` | Open buffers |
| `<leader>fr` | Resume last picker |
| `<leader>f.` | Recent files |
| `<leader>f/` | Search in current buffer |
| `<leader>fd` | Diagnostics |
| `<leader>fM` | Marks |
| `<leader>fk` | Keymaps |
| `<leader>fh` | Help tags |
| `<leader>fn` | Notifications (Noice) |
| `<leader>fs` | Symbols (Aerial) |
| `<leader>fT` | Toggle test file visibility |

---

## Code Outline (Aerial) `<leader>l`

| Key | Action |
|-----|--------|
| `<leader>lo` | Toggle outline panel |
| `<leader>fs` | Symbol picker (Telescope) |
| `{` / `}` | Prev / next symbol (inside aerial) |
| `<CR>` | Jump to symbol |
| `p` | Scroll preview without jumping |

---

## LSP Actions `<leader>l`

| Key | Action |
|-----|--------|
| `<leader>lca` | Code action |
| `<leader>lrn` | Rename symbol |
| `<leader>lf` | Format buffer |
| `<leader>lk` | Hover docs |
| `<leader>ly` | Yank diagnostic message |
| `<leader>lx` | Run codelens |
| `<leader>lth` | Toggle inlay hints |
| `<leader>ltd` | Toggle diagnostics |

### TypeScript (typescript-tools)
| Key | Action |
|-----|--------|
| `<leader>lia` | Add missing imports |
| `<leader>lio` | Organize imports |
| `gd` | Go to source definition (not `.d.ts`) |

---

## Trouble `<leader>tr`

| Key | Action |
|-----|--------|
| `<leader>trd` | Workspace diagnostics |
| `<leader>trb` | Buffer diagnostics |
| `<leader>trq` | Quickfix list |
| `<leader>trl` | Location list |
| `<leader>trs` | Symbols |
| `<leader>trr` | LSP references |

---

## Testing (Neotest) `<leader>t`

| Key | Action |
|-----|--------|
| `<leader>tn` | Run nearest test |
| `<leader>tf` | Run file tests |
| `<leader>tl` | Run last test |
| `<leader>tS` | Run suite |
| `<leader>tw` | Watch file |
| `<leader>tx` | Stop run |
| `<leader>ts` | Summary panel |
| `<leader>to` | Output |
| `<leader>tO` | Output panel |
| `<leader>ta` | Attach |
| `]t` / `[t` | Next / prev test |
| `]T` / `[T` | Next / prev failed test |

---

## Git `<leader>g`

### LazyGit
| Key | Action |
|-----|--------|
| `<leader>go` | Open LazyGit |
| `<leader>gol` | LazyGit log |
| `<leader>gof` | LazyGit file log |

### Hunks (Gitsigns) `<leader>gh`
| Key | Action |
|-----|--------|
| `]h` / `[h` | Next / prev hunk |
| `<leader>ghv` | Preview hunk (float) |
| `<leader>ghV` | Preview hunk inline |
| `<leader>gha` | Stage hunk |
| `<leader>ghx` | Discard hunk |
| `<leader>ghu` | Undo stage hunk |

### Buffer (Gitsigns) `<leader>gb`
| Key | Action |
|-----|--------|
| `<leader>gba` | Stage buffer |
| `<leader>gbx` | Discard buffer |
| `<leader>gbl` | Blame line |
| `<leader>gbt` | Toggle blame |

### Diff (Gitsigns) `<leader>gd`
| Key | Action |
|-----|--------|
| `<leader>gdi` | Diff vs index |
| `<leader>gdh` | Diff vs HEAD |
| `<leader>gdp` | Diff vs HEAD~1 |
| `<leader>gdq` | Close diff |

### Toggle `<leader>gt`
| Key | Action |
|-----|--------|
| `<leader>gtd` | Toggle deleted hunks |

### Worktrees `<leader>gw`
| Key | Action |
|-----|--------|
| `<leader>gws` | Switch worktree |
| `<leader>gwn` | New worktree |

---

## Diffview `<leader>dv`

| Key | Action |
|-----|--------|
| `<leader>dvo` | Open diffview |
| `<leader>dvc` | Close diffview |
| `<leader>dvs` | Diff staged |
| `<leader>dvm` | Diff vs main |
| `<leader>dvb` | Diff vs branch (prompt) |
| `<leader>dvh` | File history |
| `<leader>dvf` | Current file history |
| `<leader>dvp` | Current file vs main |
| `<leader>dv2` | Diff 2 commits back |

---

## Pull Requests (Octo) `<leader>pr`

### Listing
| Key | Action |
|-----|--------|
| `<leader>prl` | PR list |
| `<leader>prs` | PR search |
| `<leader>prd` | PR diff |
| `<leader>prco` | PR commits |
| `<leader>prf` | PR changed files |
| `<leader>prk` | PR checks |

### Lifecycle
| Key | Action |
|-----|--------|
| `<leader>prn` | New PR |
| `<leader>prc` | Checkout PR |
| `<leader>prm` | Merge PR |
| `<leader>prr` | Mark ready |
| `<leader>prx` | Close PR |
| `<leader>pro` | Open in browser |

### Review `<leader>prv`
| Key | Action |
|-----|--------|
| `<leader>prvs` | Start review |
| `<leader>prvr` | Resume review |
| `<leader>prvu` | Submit review |
| `<leader>prvc` | View comments |
| `<leader>prva` | Add comment |
| `<leader>prvx` | Delete comment |
| `<leader>prvR` | Resolve thread |
| `<leader>prvU` | Unresolve thread |
| `<leader>prvd` | Discard review |

---

## GitHub Issues `<leader>gi`

| Key | Action |
|-----|--------|
| `<leader>gil` | Issue list |
| `<leader>gis` | Issue search |
| `<leader>gin` | New issue |
| `<leader>gix` | Close issue |
| `<leader>gio` | Reopen issue |
| `<leader>gib` | Open in browser |

---

## Database (Dadbod) `<leader>db`

| Key | Action |
|-----|--------|
| `<leader>dbt` | Toggle UI |
| `<leader>dbb` | Find buffer |
| `<leader>dba` | Add connection |
| `<leader>dbe` | Execute query / selection |
| `<leader>dbw` | Save query |

PostgreSQL helpers available inside DBUI: `Count`, `Top 100`, `Describe`, `Indexes`, `Explain`, `Foreign Keys`.

---

## HTTP Requests (Kulala) `<leader>R`

| Key | Action |
|-----|--------|
| `<leader>Rs` | Send request |
| `<leader>Ra` | Send all |
| `<leader>Rr` | Replay last |
| `<leader>Re` | Select env |
| `<leader>Ri` | Inspect |
| `<leader>Rc` | Copy as cURL |
| `<leader>RC` | Paste from cURL |
| `<leader>Rt` | Toggle headers/body |
| `<leader>Rf` | Find request |
| `<leader>Rb` | Scratchpad |

---

## Obsidian `<leader>o`

| Key | Action |
|-----|--------|
| `<leader>os` | Search notes |
| `<leader>on` | New note |
| `<leader>oq` | Quick switch |
| `<leader>oo` | Open in Obsidian app |
| `<leader>ot` | Today's daily note |
| `<leader>oy` | Yesterday |
| `<leader>oT` | Tomorrow |
| `<leader>ol` | Note links |
| `<leader>ob` | Backlinks |
| `<leader>of` | Follow link |
| `<leader>oc` | Toggle checkbox |
| `<leader>op` | Paste image |
| `<leader>ow` | Switch workspace |

---

## Claude `<leader>c`

| Key | Action |
|-----|--------|
| `<leader>cc` | Focus toggle |
| `<leader>ch` | Hide |
| `<leader>cr` | Resume session |
| `<leader>cn` | Continue session |
| `<leader>cm` | Select model |
| `<leader>cb` | Add buffer to context |
| `<leader>cs` | Send selection (visual) |
| `<leader>ca` | Accept diff |
| `<leader>cd` | Deny diff |
| `<leader>ci` | Status |

---

## Notifications `<leader>n`

| Key | Action |
|-----|--------|
| `<leader>nd` | Dismiss all |
| `<leader>nh` | History |

---

## Folds `<leader>z`

| Key | Action |
|-----|--------|
| `<leader>zt` | Toggle fold |
| `<leader>zoa` | Open all |
| `<leader>zca` | Close all |

---

## Tmux Navigation

| Key | Action |
|-----|--------|
| `<M-h/j/k/l>` | Navigate panes |
