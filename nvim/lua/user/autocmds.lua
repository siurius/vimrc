-- Autocommands migrated from vimrc
-- Uses nvim_create_augroup and nvim_create_autocmd

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Resize splits when Vim window is resized
augroup("VimResize", { clear = true })
autocmd("VimResized", {
  group = "VimResize",
  callback = function()
    vim.cmd([[normal! <c-w>=]])
  end,
})

-- CursorLine for active/inactive windows
-- Shows cursorline only in the active window
augroup("DimInactiveWindows", { clear = true })
autocmd("WinEnter", {
  group = "DimInactiveWindows",
  callback = function()
    vim.opt.cursorline = true
  end,
})
autocmd("WinLeave", {
  group = "DimInactiveWindows",
  callback = function()
    vim.opt.cursorline = false
  end,
})

-- CursorLine highlight settings
-- Keeps syntax highlighting while highlighting current line
augroup("CursorLineHighlight", { clear = true })
autocmd("ColorScheme", {
  group = "CursorLineHighlight",
  callback = function()
    vim.api.nvim_command("highlight clear CursorLine")
    vim.api.nvim_command("highlight CursorLine ctermbg=Black")
  end,
})

-- Apply cursorline highlight immediately on startup
vim.api.nvim_command("highlight clear CursorLine")
vim.api.nvim_command("highlight CursorLine ctermbg=Black")
