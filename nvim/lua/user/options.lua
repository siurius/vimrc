-- options.lua: Editor settings migrated from basic.vim
-- Author: Yiran Li <yiranli91@gmail.com>

-- Leader keys (must be set before plugins load)
vim.g.mapleader = ","
vim.g.maplocalleader = " "

-- Basic options
vim.opt.encoding = "utf-8"
vim.opt.laststatus = 2 -- status line always visible
vim.opt.visualbell = true -- turn on the visual bell
vim.opt.cursorline = true -- highlight the line under the cursor
vim.opt.fillchars:append({ vert = "│" }) -- better looking for windows separator
-- ttyfast is deprecated in Neovim (always fast)
vim.opt.title = true -- set the terminal title to the current file
vim.opt.showcmd = true -- shows partial commands
vim.opt.hidden = true -- hide the inactive buffers
vim.opt.ruler = true -- sets a permanent rule
vim.opt.lazyredraw = true -- only redraws if it is needed
vim.opt.autoread = true -- update a open file edited outside of Vim
vim.opt.ttimeoutlen = 0 -- toggle between modes almost instantly
vim.opt.backspace = "indent,eol,start" -- defines the backspace key behavior
vim.opt.virtualedit = "all" -- to edit where there is no actual character
vim.opt.scrolloff = 7 -- buffer when scrolling

-- Searching
vim.opt.incsearch = true -- incremental searching
vim.opt.showmatch = true -- show pairs match
vim.opt.hlsearch = true -- highlight search results
vim.opt.smartcase = true -- smart case ignore
vim.opt.ignorecase = true -- ignore case letters

-- History and permanent undo levels
vim.opt.history = 1000
vim.opt.undofile = true
vim.opt.undoreload = 1000

-- Backups
vim.opt.backup = true
vim.opt.swapfile = false -- noswapfile
local backupdir = vim.fn.expand("$HOME/.vim/tmp/backup/")
local undodir = vim.fn.expand("$HOME/.vim/tmp/undo/")
local swapdir = vim.fn.expand("$HOME/.vim/tmp/swap/")
vim.opt.backupdir = backupdir
vim.opt.undodir = undodir
vim.opt.directory = swapdir

-- Create backup/undo/swap directories if they don't exist
for _, dir in ipairs({ backupdir, undodir, swapdir }) do
	if vim.fn.isdirectory(dir) == 0 then
		vim.fn.mkdir(dir, "p")
	end
end

-- Wildmenu
vim.opt.wildmenu = true -- Command line autocompletion
vim.opt.wildmode = "list:longest,full" -- Shows all the options

vim.opt.wildignore:append({
	"*.sw?", -- Vim swap files
	"*.bak", -- Backup files
	"*.?~",
	"*.??~",
	"*.???~",
	"*.~",
	"*.luac", -- Lua byte code
	"*.jar", -- java archives
	"*.pyc", -- Python byte code
	"*.stats", -- Pylint stats
})

-- Tabs, space and wrapping
vim.opt.expandtab = true -- spaces instead of tabs
vim.opt.tabstop = 4 -- a tab = four spaces
vim.opt.shiftwidth = 4 -- number of spaces for auto-indent
vim.opt.softtabstop = 4 -- a soft-tab of four spaces
vim.opt.autoindent = true -- set on the auto-indent
vim.opt.textwidth = 0

-- Window behavior
vim.opt.equalalways = false -- noea - don't equalize window sizes

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Folding
vim.opt.foldmethod = "syntax"
vim.opt.foldlevelstart = 99 -- open all folds by default

-- Hidden characters
vim.opt.listchars = "tab:→ ,eol:↵,trail:·,extends:↷,precedes:↶"
vim.opt.timeoutlen = 500 -- time to wait for mapped sequence (for which-key)

-- Clipboard (use system clipboard for all operations)
-- On Wayland: install wl-clipboard (sudo pacman -S wl-clipboard)
-- On X11: install xclip or xsel (sudo pacman -S xclip)
vim.opt.clipboard = "unnamedplus"
