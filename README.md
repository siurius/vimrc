# vimrc
Vim configuration.

## Preparation

### fzf

Requires `fzf` in the system.

### ctrlsf

Requires `ack` in the system.

### Markdown preview

[Markdown Preview for (Neo)vim](https://github.com/iamcco/markdown-preview.nvim)

Requires `firefox` (for private browsing), `nodejs` and `yarn` installed.

### Secret editing

Requires `gpg` in the system.

### any-jump

Requires `ag` (`the_silver_searcher` in alpinelinux) for code search.

## Setup

1. Adds link from `~/.vimrc` to `dotvimrc`
2. Export `VIMRC_DIR` environmental variable to the path of this folder, in `.bashrc` or other places
3. Change `g:vimrc_modules` in `dotvimrc`
    - Minimal: `let g:vimrc_modules=[]`
    - Complete: `let g:vimrc_modules=['ui', 'tool', 'code', 'edit']`
3. `:PlugInstall`
4. Restart vim

## Configuration

### Code completion engine

#### coc.nvim

- `C/C++`: install `ccls` from repositories ([ccls](https://github.com/MaskRay/ccls), [setup](https://github.com/neoclide/coc.nvim/wiki/Language-servers#ccobjective-c)).
    - Project [configuration](https://github.com/MaskRay/ccls/wiki/Project-Setup) using extra file, [auto-generate](https://sarcasm.github.io/notes/dev/compilation-database.html) or `.ccls`
    - Usually, `bear make` generates `compile_commands.json`
- `Java`: type `:CocInstall coc-java` in vim ([coc-java](https://github.com/neoclide/coc-java))
    - It will download [jdt.ls](http://download.eclipse.org/jdtls/snapshots/?d).
- `Haskell`: install [`HIE`](https://github.com/haskell/haskell-ide-engine)
    - Generating haddock documentation `stack haddock --keep-going` ([hover completion](https://github.com/haskell/haskell-ide-engine#docs-on-hovercompletion))

- snippet: `:CocInstall coc-snippets` ([coc-snippets](https://github.com/neoclide/coc-snippets))

More extensions see [here](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions)

#### Kite

Download from [Kite official][kite-official], install and adds vim support.

[kite-official]: https://kite.com/integrations/vim/


## Usage

In `modules/basic.vim`
- `leader`: `,`
- `localleader`: ` `

| Command                 | Description                        | Plugin               |
|:------------------------|:-----------------------------------|:---------------------|
| `;`                     | Clear previous search highlight    |                      |
| `<leader>eh`            | Toggle hidden characters           |                      |
| `<leader>eq`            | Toggle quickfix window             |                      |
| `:TC`                   | Alias of `:tabclose`               |                      |
| `<leader>ra`            | Run async command                  | AsyncRun             |
| `<leader>rk`            | Kill async command                 | AsyncRun             |
| `Ctrl-<space>`          | Trigger completion                 | coc.vim              |
| `Alt-.`                 | Next fix                           | coc.vim              |
| `Alt-,`                 | Previous fix                       | coc.vim              |
| `gd`                    | Goto definition                    | coc.vim              |
| `gy`                    | Goto type declaration              | coc.vim              |
| `gi`                    | Goto implementation                | coc.vim              |
| `gr`                    | Goto references                    | coc.vim              |
| `K`                     | Show documentation in preview      | coc.vim              |
| `<leader>a`             | Run codeAction for selected region | coc.vim              |
| `<leader>al`            | Run codeAction for current line    | coc.vim              |
| `<leader>cf`            | Format selected region             | coc.vim              |
| `<leader>qf`            | Fix autofix of current line        | coc.vim              |
| `:Format`               | Format current buffer              | coc.vim              |
| `:Fold`                 | Fold current buffer                | coc.vim              |
| `:OR`                   | Organize import of current buffer  | coc.vim              |
| `<space>a`              | Show all diagnostics               | coc.vim              |
| `<space>e`              | Manage extensions                  | coc.vim              |
| `<space>o`              | List symbols of current document   | coc.vim              |
| `<space>s`              | Search worksypace for symbol       | coc.vim              |
| `<space>p`              | Resume latest coc list             | coc.vim              |
| `<leader>`j             | Search current token               | any-jump.vim         |
| `:AnyJump`              | Search current token               | any-jump.vim         |
| `:AnyJumpArg <keyword>` | Find keyword                       | any-jump.vim         |
| `<leader>rc`            | Toggle Codi                        | Codi                 |
| `<F4> <keyword>`        | Find in project                    | CtrlSF               |
| `<leader>w`             | Find selected word in project      | CtrlSF               |
| `Ctrl-o`                | Open in a horizontal split window  | CtrlSF               |
| `Ctrl-j`                | Move cursor to next match          | CtrlSF               |
| `Ctrl-k`                | Move cursor to previous match      | CtrlSF               |
| `Ctrl-x Ctrl-l`         | Complete line                      | fzf                  |
| `Ctrl-x Ctrl-f`         | Complete path                      | fzf                  |
| `Ctrl-l`                | Show file in split window          | fzf                  |
| `Ctrl-v`                | Show file in vsplit window         | fzf                  |
| `<leader>f`             | Search file name from project root | fzf                  |
| `<leader>hf`            | Search history file name           | fzf                  |
| `<leader>hs`            | Search history search              | fzf                  |
| `<leader>hc`            | Search history command             | fzf                  |
| `<F12>`                 | Toggle hoogle                      | vim-hoogle           |
| `Ctrl-m`                | Multi cursor mark                  | vim-multiple-cursors |
| `Ctrl-]`                | Multi cursor skip                  | vim-multiple-cursors |
| `Ctrl-[`                | Multi cursor previous              | vim-multiple-cursors |
| `<F2>`                  | Toggle NERDTree                    | NERDTree             |
| `:PlugInstall`          | Install plugins                    | vim-plug             |
| `:PlugUpdate`           | Install / update plugins           | vim-plug             |
| `:PlugUpgrade`          | Upgrde vim-plug itself             | vim-plug             |
| `<F3>`                  | Toggle TagBar                      | TagBar               |
| `:TableFormat`          | Format markdown table              | vim-markdown         |
| `:Toc`                  | Open table of content              | vim-markdown         |
| `]]`                    | Go to next header                  | vim-markdown         |
| `[[`                    | Go to previous header              | vim-markdown         |
| `][`                    | Go to next sibling header          | vim-markdown         |
| `[]`                    | Go to previous sibling header      | vim-markdown         |
| `]u`                    | Go to current header               | vim-markdown         |
| `]p`                    | Go to parent header                | vim-markdown         |
| `<leader>rs`            | Toggle slime                       | vim-slime            |

### color\_coded

Requires adding `.color_coded` file in project root containing header folders, like:

```
-Iinclude
```

## Editing Encrypted File

When saving an encrypted file, the file is encrypted with the current recipient.

`gpg-agent` caches the password of the secret key. `gpgconf --reload gpg-agent` clears the cache.

## Trouble Shooting

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

***[coc.nvim] The "java" server crashed 5 times in the last 3 minutes. The server will not be restarted.***

To restart language server quickly, `:CocRestart`.

If the system uses jdk 1.8, try to change the language server version as [this issue](https://github.com/neoclide/coc-java/issues/99) suggests:
1. download the language server v0.57.0 from https://download.eclipse.org/jdtls/milestones/0.57.0/ ;
2. replace files in `~/.config/coc/extensions/coc-java-data/server`.

If the system requires a higher version, the latest version should works well with jdk 11:
1. download the latest version of language server;
2. replace files in `~/.config/coc/extensions/coc-java-data/server`.
3. clean the workspace cache in vim `:CocCommand java.clean.workspace` (according to [this post](https://www.reddit.com/r/neovim/comments/hwosq7/cocjava_the_java_server_crashed_5_times_in_the/)).

## TODO

1. Haskell, Lisp support
2. Grammar checker
3. Merge multiple files and create `view`


### Haskell support

- ghc-mod
- hfmt
- hlint
- lushtags

