# 📦 Neovim Function Folding Cheat Sheet

## 🔧 Fold Commands (Normal Mode)
| Key       | Action              |
|----------|---------------------|
| `zc`     | Close (collapse) fold |
| `zo`     | Open fold             |
| `za`     | Toggle fold           |
| `zM`     | Close all folds       |
| `zR`     | Open all folds        |

## ⚙️ Enable Folding
### **Syntax-based Folding**
```vim
:set foldmethod=syntax
```
### **Treesitter/LSP Folding**
```vim
:set foldmethod=expr
:set foldexpr=nvim_treesitter#foldexpr()
```
## **💾 NvChad Persistent Setup**
Add to lua/custom/chadrc.lua:
```lua
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
```

> 🧠 Tip: Use zM before navigating code to quickly collapse everything, then zo to drill down.