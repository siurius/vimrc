-- =============================================================================
-- Neovim Configuration
-- Author: siurius
-- Migration from vimrc to Neovim Lua config
-- =============================================================================

-- Set leader keys BEFORE loading plugins (important for which-key)
vim.g.mapleader = ","
vim.g.maplocalleader = " "

-- Bootstrap lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load core configuration modules (in order)
-- Using pcall for graceful handling during development
local ok, err

ok, err = pcall(require, "user.options")
if not ok then
  vim.notify("Failed to load options: " .. err, vim.log.levels.WARN)
end

ok, err = pcall(require, "user.keymaps")
if not ok then
  vim.notify("Failed to load keymaps: " .. err, vim.log.levels.WARN)
end

ok, err = pcall(require, "user.autocmds")
if not ok then
  vim.notify("Failed to load autocmds: " .. err, vim.log.levels.WARN)
end

-- Load lazy.nvim and plugins
ok, err = pcall(require, "user.lazy")
if not ok then
  vim.notify("Failed to load lazy: " .. err, vim.log.levels.ERROR)
end
