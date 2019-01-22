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

### Haskell support

- ghc-mod
- hfmt
- hlint
- lushtags

### color\_coded

- lua
- llvm

For complete list, see [README](https://github.com/jeaye/color_coded).

## Setup

1. Adds link from `~/.vim` to this folder and `~/.vimrc` to `dotvimrc`
2. Change `$VIMRC_DIR` in `dotvimrc` to the path of this folder
3. Change `g:vimrc_modules` in `dotvimrc`
    - Minimal: `let g:vimrc_modules=[]`
    - Complete: `let g:vimrc_modules=['ui', 'tool', 'code', 'edit']`
3. `:PlugInstall`, then (if use `code`)
    - YouCompleteMe: in root folder `./install.py --clang-completer --go-completer`
    - Eclim
    - vimproc: in plugin's root folder `make`
    - color\_coded
4. Restart vim

## Usage

In `modules/basic.vim`
- `leader`: `,`
- `localleader`: ` `

| Command              | Description                        | Plugin               |
| :--------------      | :--------------------------------- | :------------------- |
| `;`                  | Clear previous search highlight    |                      |
| `<leader>eh`         | Toggle hidden characters           |                      |
| `<leader>eq`         | Toggle quickfix window             |                      |
| `:TC`                | Alias of `:tabclose`               |                      |
| `Alt-.`              | Next fix                           | ALE                  |
| `Alt-,`              | Previous fix                       | ALE                  |
| `<leader>cf`         | Auto format                        | ALE                  |
| `<leader>ra`         | Run async command                  | AsyncRun             |
| `<leader>rk`         | Kill async command                 | AsyncRun             |
| `<leader>rc`         | Toggle Codi                        | Codi                 |
| `<F4>`               | Find in project                    | CtrlSF               |
| `<leader>a`          | Find selected word in project      | CtrlSF               |
| `Ctrl-o`             | Open in a horizontal split window  | CtrlSF               |
| `Ctrl-j`             | Move cursor to next match          | CtrlSF               |
| `Ctrl-k`             | Move cursor to previous match      | CtrlSF               |
| `Ctrl-x Ctrl-l`      | Complete line                      | fzf                  |
| `Ctrl-x Ctrl-f`      | Complete path                      | fzf                  |
| `Ctrl-l`             | Show file in split window          | fzf                  |
| `Ctrl-v`             | Show file in vsplit window         | fzf                  |
| `<leader>f`          | Search file name from project root | fzf                  |
| `<leader>hf`         | Search history file name           | fzf                  |
| `<leader>hs`         | Search history search              | fzf                  |
| `<leader>hc`         | Search history command             | fzf                  |
| `<F12>`              | Toggle hoogle                      | vim-hoogle           |
| `Ctrl-m`             | Multi cursor mark                  | vim-multiple-cursors |
| `Ctrl-]`             | Multi cursor skip                  | vim-multiple-cursors |
| `Ctrl-[`             | Multi cursor previous              | vim-multiple-cursors |
| `<F2>`               | Toggle NERDTree                    | NERDTree             |
| `:PlugInstall`       | Install plugins                    | vim-plug             |
| `:PlugUpdate`        | Install / update plugins           | vim-plug             |
| `:PlugUpgrade`       | Upgrde vim-plug itself             | vim-plug             |
| `<F3>`               | Toggle TagBar                      | TagBar               |
| `<leader>rs`         | Toggle slime                       | vim-slime            |
| `:YcmGenerateConfig` | Generate YCM config                | YCM-Generator        |
| `:CCGenerateConfig`  | Generate color\_coded config       | YCM-Generator        |
| `<leader>cg`         | Goto definition else declaration   | YouCompleteMe        |

### color\_coded

Requires adding `.color_coded` file in project root containing header folders, like:

```
-Iinclude
```

## Trouble shooting

### Haskell, `The IO action ‘main’ is not defined in module ‘Main’`

See [this issue][haskell-main-not-defined]. Simply add `main = undefined` at the begining.

[haskell-main-not-defined]: https://github.com/DanielG/ghc-mod/issues/781

## TODO

1. Merge multiple files and create `view`
2. Adds incsearch
3. Lisp support
