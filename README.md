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

## Setup

1. Adds link from `.vimrc` to this folder
2. `:PlugInstall`, then
    - YouCompleteMe
3. Restart vim

## Commands

| Command                              | Description              | Plugin   |
| :----------------------------------- | :----------------------- | :------- |
| `:PlugInstall [name ...] [#threads]` | Install plugins          | vim-plug |
| `:PlugUpdate [name ...] [#threads]`  | Install / update plugins | vim-plug |
| `:PlugUpgrade`                       | Upgrde vim-plug itself   | vim-plug |

## Minimal configuration

## Complete configuration


## TODO

1. Merge multiple files and create `view`
2. Adds incsearch
