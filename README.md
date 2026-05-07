# Neovim Configuration

A personalized Neovim setup optimized for **Django development** and **Competitive Programming** in C++.

## Quick Start

```bash
# Clone or copy this config to ~/.config/nvim
# Open nvim - plugins will auto-install on first launch
nvim
```

## Keybindings

### Leader Key
Space (`<leader>`)

### General
| Keymap | Action |
|--------|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Buffers |
| `<leader>fh` | Help tags |
| `<leader>fr` | Recent files |
| `<leader>fk` | Keymaps |
| `<C-\>` | Toggle terminal |
| `<leader>tt` | Toggle terminal |
| `<leader>cd` | File explorer |

### LSP / Diagnostics
| Keymap | Action |
|--------|--------|
| `K` | Hover documentation |
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gi` | Go to implementation |
| `go` | Go to type definition |
| `gr` | Find references |
| `gs` | Signature help |
| `gl` | Open diagnostic float |
| `<F2>` | Rename symbol |
| `<F3>` | Format code |
| `<F4>` | Code action |
| `<leader>xx` | Toggle diagnostics panel |
| `<leader>xX` | Buffer diagnostics only |
| `<leader>cs` | Symbols panel |

### Django / Python
| Keymap | Action |
|--------|--------|
| `<leader>td` | Select virtual environment |

### Competitive Programming
| Keymap | Action |
|--------|--------|
| `<leader>a` | Open Assistant.nvim (test cases from browser) |
| `<leader>r` | Compile and run current C++ file |
| `s` | Flash jump (fast navigation) |
| `S` | Flash treesitter search |

### Git
| Keymap | Action |
|--------|--------|
| `<leader>lg` | Open LazyGit |

### Code Folding
| Keymap | Action |
|--------|--------|
| `<leader>fo` | Open all folds |
| `<leader>fc` | Close all folds |

### Copilot (AI)
| Keymap | Action |
|--------|--------|
| `<C-j>` | Accept suggestion |
| `<C-]>` | Dismiss suggestion |

## Plugins

### Core
| Plugin | Purpose |
|--------|---------|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting, indent, autotag |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder for files, grep, buffers |
| [Comment.nvim](https://github.com/numToStr/Comment.nvim) | Toggle comments with `gcc` |
| [onedark.nvim](https://github.com/navarasu/onedark.nvim) | Color scheme |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Status line |
| [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) | Integrated terminal |

### LSP & Completion
| Plugin | Purpose |
|--------|---------|
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP server configuration |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | LSP server installer |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Autocompletion engine |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Snippet engine |
| [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) | Pre-made snippets |

### Django / Python
| Plugin | Purpose |
|--------|---------|
| [pyright](https://github.com/microsoft/pyright) | Python LSP with Django support |
| [ruff](https://github.com/astral-sh/ruff) | Fast Python linter & formatter |
| [venv-selector.nvim](https://github.com/linux-cultist/venv-selector.nvim) | Switch Python virtual environments |

### Competitive Programming
| Plugin | Purpose |
|--------|---------|
| [assistant.nvim](https://github.com/A7Lavinraj/assistant.nvim) | Receives test cases from Competitive Companion browser extension. Auto-creates solution files with templates |

**Setup for CP:**
1. Install [Competitive Companion](https://github.com/jmerle/competitive-companion) browser extension
2. Set extension port to `10043`
3. Click the + button on any problem page to send test cases to nvim
4. Press `<leader>a` to view and run test cases

### Navigation & Editing
| Plugin | Purpose |
|--------|---------|
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Auto-close brackets, quotes |
| [mini.surround](https://github.com/echasnovski/mini.surround) | Surround/replace text objects |
| [flash.nvim](https://github.com/folke/flash.nvim) | Fast cursor movement with character search |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Shows available keymaps on leader press |

### Code Quality & Git
| Plugin | Purpose |
|--------|---------|
| [nvim-ufo](https://github.com/kevinhwang91/nvim-ufo) | Modern code folding |
| [trouble.nvim](https://github.com/folke/trouble.nvim) | Pretty diagnostics/symbols list |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Inline git blame, hunk navigation |
| [lazygit.nvim](https://github.com/kdheepak/lazygit.nvim) | LazyGit integration |

### AI
| Plugin | Purpose |
|--------|---------|
| [Copilot.lua](https://github.com/zbirenbaum/copilot.lua) | GitHub Copilot AI autocomplete |

**Setup for Copilot:**
Run `:Copilot auth` inside nvim and follow the browser prompt.

## First Launch Checklist

```vim
:MasonInstall ruff          " Install Python linter
:Copilot auth               " Authenticate GitHub Copilot
:TSInstall python cpp       " Ensure language parsers
:VenvSelect                 " Select your Django venv
```
