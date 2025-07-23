local o, opt, g = vim.o, vim.opt, vim.g

-- Set <space> as the leader
g.mapleader = " "
g.maplocalleader = " "

-- Use indentation of 2 spaces
o.shiftwidth = 2
o.tabstop = 2
o.expandtab = true

-- Search Settings
o.ignorecase = true
o.smartcase = true

-- Cursor Settings
o.cursorline = true
opt.cursorlineopt = { "number" }
o.scrolloff = 8
o.sidescrolloff = 8

-- Use System Clipboard
o.clipboard = "unnamedplus"

o.undofile = true
o.wrap = false

-- Disable some chars, makes it more minimal
opt.fillchars = {
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
o.laststatus = 0
o.cmdheight = 0
o.ruler = false
o.showmode = false

-- Splitting windows on the right and/or below
o.splitright = true
o.splitbelow = true

-- Completion options
o.completeopt = "menuone,noselect"

o.signcolumn = "yes:2"

-- Disable Mouse
o.mouse = ""
