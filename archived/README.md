# Legacy Vim Configuration

This folder contains the old Vim configuration for reference. If you still use Vim 8+ with vim-plug and coc.nvim, you can use these files.

## Setup (Legacy)

1. Link vimrc:
   ```bash
   ln -s /path/to/repo/archived/dotvimrc ~/.vimrc
   ```

2. Set environment variable in your `.bashrc`:
   ```bash
   export VIMRC_DIR=/path/to/repo/archived
   ```

3. Select modules in `dotvimrc`:
   ```vim
   let g:vimrc_modules=['ui', 'tool', 'code', 'edit']
   ```

4. Install plugins:
   ```vim
   :PlugInstall
   ```

## Files

| File | Description |
|------|-------------|
| `vimrc` | Main vimrc configuration |
| `dotvimrc` | Dotfile to link from ~/.vimrc |
| `modules/` | Modular configuration (ui, tool, code, edit) |
| `autoload/plug.vim` | vim-plug plugin manager |
| `coc-settings.json` | coc.nvim LSP settings |
| `bin/` | Helper scripts |

## Requirements

- Vim 8+ or Neovim 0.4+
- vim-plug
- coc.nvim
- ccls (C/C++ LSP)
- HIE (Haskell LSP)

For the modern Neovim setup, see the main [README.md](../README.md).
