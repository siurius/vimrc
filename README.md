# Neovim Configuration

Modern Neovim configuration with Lua, lazy.nvim, and native LSP.

## Structure

```
nvim/
├── init.lua             # Entry point
└── lua/user/
    ├── options.lua      # Editor settings
    ├── keymaps.lua      # Keybindings
    ├── autocmds.lua     # Autocommands
    ├── lazy.lua         # lazy.nvim setup
    └── plugins/
        └── init.lua     # Plugin specifications

archived/                # Legacy Vim configuration
```

## Installation

### Requirements

- **wl-clipboard** (for Wayland clipboard support):
  ```bash
  sudo pacman -S wl-clipboard
  ```

- **xclip** (for X11 clipboard support):
  ```bash
  sudo pacman -S xclip
  ```

### Setup

```bash
# Clone repo
git clone https://github.com/siurius/vimrc.git ~/source/vimrc

# Link to Neovim config
ln -s ~/source/vimrc/nvim ~/.config/nvim

# Start Neovim (plugins auto-install)
nvim
```

## LSP Servers

In Neovim, run `:Mason` to install language servers:

| Language | Server |
|----------|--------|
| C/C++ | clangd |
| Python | pyright |
| JavaScript/TypeScript | ts_ls |
| Go | gopls (disabled) |
| Rust | rust_analyzer |
| Lua | lua_ls |
| Java | jdtls |
| Haskell | hls (disabled) |

## Key Mappings

### General

| Key | Action |
|-----|--------|
| `F2` | Toggle file tree |
| `F3` | Toggle tagbar |
| `;` | Clear search highlight |
| `<leader>?` | Show keybindings |

### Find (Telescope)

| Key | Action |
|-----|--------|
| `<leader>H` | Help tags |
| `<leader>f` | Find files |
| `<leader>/` | Live grep |
| `<leader>b` | Buffers |
| `<leader>of` | Old files |
| `<leader>os` | Search history |
| `<leader>oc` | Command history |

### LSP and Coding

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Go to references |
| `gi` | Go to implementation |
| `gp` | Show diagnostic popup |
| `K` | Show documentation |
| `<leader>rn` | Rename symbol |
| `<leader>cf` | Format code |
| `<leader>ca` | Code actions |

### Git

| Key | Action |
|-----|--------|
| `]h` / `[h` | Next/prev hunk |
| `<leader>gp` | Preview hunk |
| `<leader>gb` | Blame line (full) |
| `<leader>gB` | Toggle virtual blame |
| `<leader>gd` | Diff this file |
| `<leader>gD` | Diff against HEAD~ |
| `<leader>gs` | Stage hunk |
| `<leader>gr` | Reset hunk |
| `<leader>gu` | Undo stage hunk |
| `<leader>gvo` | Open diffview |
| `<leader>gvc` | Close diffview |
| `<leader>gvh` | File history |
| `<leader>gvH` | Current file history |

### Motion

| Key | Action |
|-----|--------|
| `s` | Flash jump |
| `S` | Flash treesitter |

Leader key: `,` (comma)

## Key Groups

| Prefix | Group |
|--------|-------|
| `<leader>f` | Find |
| `<leader>o` | Old/recent |
| `<leader>g` | Git |
| `<leader>c` | Code |
| `<leader>r` | Run/toggle |
| `<leader>e` | Enable/disable |

## AI Assistant (CodeCompanion)

CodeCompanion provides AI-powered coding assistance with support for multiple backends.

### Setup

1. Copy the example environment file:
   ```bash
   cp .env.example .env
   ```

2. Edit `.env` with your API credentials:
   ```bash
   OPENAI_BASE_URL=https://your-api-endpoint/v1
   OPENAI_API_KEY=your-api-key
   OPENAI_MODEL=your-model-name
   ```

### Keybindings

| Key | Mode | Action |
|-----|------|--------|
| `<leader>aa` | n, v | AI Action Palette |
| `<leader>ac` | n | Open AI Chat |
| `<leader>ai` | n, v | Inline Assistant (ask about code) |
| `<leader>at` | n | Toggle Chat |

### Chat Keybindings

| Key | Action |
|-----|--------|
| `<CR>` / `<C-s>` | Send message |
| `<C-c>` | Close chat |
| `?` | Show options |
| `ga` | Change adapter |
| `gr` | Regenerate response |

### Adapters

| Adapter | Type | Usage |
|---------|------|-------|
| Grok | ACP | Chat (default) |
| OpenCode | ACP | Chat (via `ga`) |
| OpenHands | ACP | Chat (via `ga`) |
| Custom OpenAI | HTTP | Inline assistant |

The `.env` file is automatically loaded (recursive upward search from current directory).

## Plugins

| Category | Plugin |
|----------|--------|
| Plugin Manager | lazy.nvim |
| File Explorer | nvim-tree |
| Fuzzy Finder | telescope.nvim |
| Statusline | lualine.nvim |
| Git Signs | gitsigns.nvim |
| Git Diff | diffview.nvim |
| LSP | mason.nvim, nvim-lspconfig |
| Completion | nvim-cmp, LuaSnip |
| Syntax | nvim-treesitter |
| Colorscheme | molokai |
| Motion | flash.nvim |
| Keybindings | which-key.nvim |

## Legacy Vim

The old Vim configuration is in `archived/` for reference.

## Troubleshooting

**No clipboard:** Install `wl-clipboard` (Wayland) or `xclip` (X11)

**LSP not working:** Run `:Mason` to install servers, then `:checkhealth lsp`

**Plugins not loading:** Run `:Lazy sync`

**Git blame not showing:** Make sure you're in a git repository
