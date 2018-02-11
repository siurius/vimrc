# vimrc
Vim configuration.

## Preparation

### ALE

ALE (Asynchronous Lint Engine) is a plugin for providing linting in NeoVim and Vim 8 while editing.

- Python
    - linter: `pylint`, `flake8`
    - fixer: `autopep8`, `yapf`

### fzf

Requires `fzf` in the system.

### YouCompleteMe

- Global
    - libtinfo
- Golang
    - Go


## Setup

1. Adds link from `~/.vim` to this folder and `~/.vimrc` to `dotvimrc`
2. Change `$VIMRC_DIR` in `dotvimrc` to the path of this folder
3. `:PlugInstall`, then
    - YouCompleteMe: in root folder `./install.py --clang-completer --go-completer`
    - Eclim
4. Restart vim

## Commands

| Command                              | Description              | Plugin   |
| :----------------------------------- | :----------------------- | :------- |
| `:PlugInstall [name ...] [#threads]` | Install plugins          | vim-plug |
| `:PlugUpdate [name ...] [#threads]`  | Install / update plugins | vim-plug |
| `:PlugUpgrade`                       | Upgrde vim-plug itself   | vim-plug |

## Minimal configuration

In `dotvimrc`, change `g:vimrc_modules` to empty.

## Complete configuration

In `dotvimrc`, write
```vimrc
let g:vimrc_modules=['ui', 'tool', 'code', 'edit']
```

## TODO

1. Merge multiple files and create `view`
2. Adds incsearch
