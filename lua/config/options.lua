-- Set <space> as the leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Use indentation of 2 spaces
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true

-- Search Settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Cursor Settings
vim.opt.cursorline = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Use System Clipboard
vim.opt.clipboard = "unnamedplus"

vim.opt.undofile = true
vim.opt.wrap = false

-- Disable some chars, makes it more minimal
vim.opt.fillchars = {
	eob = " ",
	fold = " ",
	horiz = " ",
	horizup = " ",
	horizdown = " ",
	vert = " ",
	vertleft = " ",
	vertright = " ",
	verthoriz = " ",
}

-- Status line
vim.opt.laststatus = 3
vim.opt.cmdheight = 0
vim.opt.ruler = false
vim.opt.showmode = false

-- Splitting windows on the right and/or below
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Completion options
vim.opt.completeopt = "menuone,noselect"

vim.opt.signcolumn = "yes:2"

-- Disable Mouse
vim.opt.mouse = ""
