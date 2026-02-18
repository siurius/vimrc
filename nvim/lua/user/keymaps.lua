-- keymaps.lua: Keybindings migrated from basic.vim and tool/config.vim
-- Author: Yiran Li <yiranli91@gmail.com>

local M = {}

-- Helper function for mapping
local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

-- ============================================================================
-- Basic Navigation and Editing
-- ============================================================================

-- Clear search highlight with ;
map("n", ";", ":noh<CR>:")

-- ============================================================================
-- Window Navigation
-- ============================================================================

-- C-h/j/k/l for window navigation (normal mode)
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- C-j/k for window navigation (terminal mode)
map("t", "<C-j>", "<C-w>j")
map("t", "<C-k>", "<C-w>k")

-- Maximize window vertically with C-w C-w
map("n", "<C-w><C-w>", "<C-w>1000+")
map("", "<C-w><C-w>", "<C-w>1000+")

-- ============================================================================
-- Diagnostics
-- ============================================================================

-- Show diagnostic popup
map("n", "gp", function() vim.diagnostic.open_float() end, { desc = "show diagnostic problem" })

-- ============================================================================
-- Emacs-style Shortcuts (Insert Mode)
-- ============================================================================

-- Navigation
map("i", "<C-P>", "<Up>")
map("i", "<C-N>", "<Down>")
map("i", "<C-F>", "<Right>")
map("i", "<C-B>", "<Left>")
map("i", "<C-A>", "<ESC>I")
map("i", "<C-E>", "<ESC>A")
map("i", "<C-D>", "<Delete>")

-- Word navigation (Meta/M-alt versions - using escape sequences)
-- Note: In terminal, M-f and M-b are escape sequences
map("i", "<M-f>", "<S-Right>")
map("i", "<M-b>", "<S-Left>")
map("i", "<M-d>", "<ESC>lcw")
map("i", "<M-p>", "<Up>")
map("i", "<M-n>", "<Down>")

-- Window management (Emacs C-x style)
map("i", "<C-x>2", "<C-o><C-w>s") -- horizontal split
map("i", "<C-x>3", "<C-o><C-w>v") -- vertical split
map("i", "<C-x>0", "<C-o><C-w>c") -- close window
map("i", "<C-x>1", "<C-o><C-w>o") -- close other windows
map("i", "<C-x>o", "<C-o><C-w>w") -- next window
map("i", "<C-x>+", "<C-o><C-w>=") -- equalize windows

-- ============================================================================
-- Toggle Functions
-- ============================================================================

-- Toggle hidden characters: <leader>eh
map("n", "<leader>eh", ":set list!<CR>", { desc = "toggle hidden characters" })

-- Toggle Quickfix window: <leader>eq
-- Lua implementation of QuickfixToggle
local function toggle_quickfix()
	for i = 1, vim.fn.winnr("$") do
		local bnum = vim.fn.winbufnr(i)
		if vim.fn.getbufvar(bnum, "&buftype") == "quickfix" then
			vim.cmd("cclose")
			vim.cmd("lclose")
			return
		end
	end
	vim.cmd("copen")
end

map("n", "<leader>eq", toggle_quickfix, { desc = "toggle quickfix" })

-- ============================================================================
-- Command Aliases
-- ============================================================================

-- :TC as alias for :tabclose
vim.api.nvim_create_user_command("TC", "tabclose", {})

-- ============================================================================
-- Plugin Placeholders (will be overridden by plugins)
-- ============================================================================

-- F2: File tree (nvim-tree will override)
-- Placeholder - actual mapping set by nvim-tree plugin
-- map("n", "<F2>", ":NvimTreeToggle<CR>", { desc = "toggle file tree" })

-- F3: Tags/outline (aerial will override)
-- Placeholder - actual mapping set by aerial plugin
-- map("n", "<F3>", ":AerialToggle<CR>", { desc = "toggle outline" })

-- F4: Live grep (telescope will override)
-- Placeholder - actual mapping set by telescope plugin
-- map("n", "<F4>", ":Telescope live_grep<CR>", { desc = "live grep" })

-- Leader key placeholders for telescope (will be set by telescope config)
-- <leader>f  - find files
-- <leader>hf - history files
-- <leader>hs - history search
-- <leader>hc - history command

-- Leader key placeholders for async run (may use built-in job)
-- <leader>ra - async run
-- <leader>rk - async stop

-- Leader key placeholder for Codi/scratchpad
-- <leader>rc - toggle Codi

-- Leader key placeholder for vim-slime
-- <leader>rs - toggle slime

return M
