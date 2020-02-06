# vimrc
Vim configuration.

## Preparation

### fzf

Requires `fzf` in the system.

## Setup

1. Adds link from `~/.vim` to this folder and `~/.vimrc` to `dotvimrc`
2. Change `$VIMRC_DIR` in `dotvimrc` to the path of this folder
3. Change `g:vimrc_modules` in `dotvimrc`
    - Minimal: `let g:vimrc_modules=[]`
    - Complete: `let g:vimrc_modules=['ui', 'tool', 'code', 'edit']`
3. `:PlugInstall`, then (if use `code`)
4. Restart vim

## Configuration

### Code completion engine

#### coc.nvim

- `C/C++`: install `ccls` from repositories ([ccls](https://github.com/MaskRay/ccls), [setup](https://github.com/neoclide/coc.nvim/wiki/Language-servers#ccobjective-c)).
    - Project [configuration](https://github.com/MaskRay/ccls/wiki/Project-Setup) using extra file, [auto-generate](https://sarcasm.github.io/notes/dev/compilation-database.html) or `.ccls`
    - Usually, `bear make` generates `compile_commands.json`
- `Java`: type `:CocInstall coc-java` in vim ([coc-java](https://github.com/neoclide/coc-java))

- snippet: `:CocInstall coc-snippets` ([coc-snippets](https://github.com/neoclide/coc-snippets))

More extensions see [here](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions)

#### Kite

Download from [Kite official][kite-official], install and adds vim support.

[kite-official]: https://kite.com/integrations/vim/


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
| `<leader>ra`         | Run async command                  | AsyncRun             |
| `<leader>rk`         | Kill async command                 | AsyncRun             |
| `Ctrl-<space>`       | Trigger completion                 | coc.vim              |
| `Alt-.`              | Next fix                           | coc.vim              |
| `Alt-,`              | Previous fix                       | coc.vim              |
| `gd`                 | Goto definition                    | coc.vim              |
| `gy`                 | Goto type declaration              | coc.vim              |
| `gi`                 | Goto implementation                | coc.vim              |
| `gr`                 | Goto references                    | coc.vim              |
| `K`                  | Show documentation in preview      | coc.vim              |
| `<leader>cf`         | Format selected region             | coc.vim              |
| `<leader>qf`         | Fix autofix of current line        | coc.vim              |
| `:Format`            | Format current buffer              | coc.vim              |
| `:Fold`              | Fold current buffer                | coc.vim              |
| `:OR`                | Organize import of current buffer  | coc.vim              |
| `<space>a`           | Show all diagnostics               | coc.vim              |
| `<space>e`           | Manage extensions                  | coc.vim              |
| `<space>o`           | List symbols of current document   | coc.vim              |
| `<space>s`           | Search worksypace for symbol       | coc.vim              |
| `<space>p`           | Resume latest coc list             | coc.vim              |
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

### color\_coded

Requires adding `.color_coded` file in project root containing header folders, like:

```
-Iinclude
```

## Trouble shooting

### `coc.nvim`

***`:CocInstall` no response.*** Possible reason: `yarn` not working.

First try to initialize the extension folder:
```bash
# ~/.config/coc/extensions/ by default
cd ~/.config/coc/extensions/
# yarn initialize
yarn init
```

After initialization, `yarn` may still not working due to network issues. Try using proxy either by:

1) manually
```bash
# at the extensions folder
proxychains -q yarn add coc-java
```
2) setting up yarn proxy
```bash
# TODO
```

Execute `:CocList extensions` in vim, you should see installed extensions.

***Keeping `jdt.ls not found`.*** Possible solution: download `jdt.ls` manually.

Downloads latest version from [jdt.ls official snapshots][jdtls-snapshots] and extract to `~/.config/coc/extensions/coc-java-data/server/`


[jdtls-snapshots]: http://download.eclipse.org/jdtls/snapshots/?d

***Haskell, `The IO action ‘main’ is not defined in module ‘Main’`***

See [this issue][haskell-main-not-defined]. Simply add `main = undefined` at the begining.

[haskell-main-not-defined]: https://github.com/DanielG/ghc-mod/issues/781


## TODO

1. Haskell, Lisp support
2. Grammar checker
3. Merge multiple files and create `view`


### Haskell support

- ghc-mod
- hfmt
- hlint
- lushtags

