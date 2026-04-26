-- Add any additional options here
local opt = vim.opt
local o = vim.o
local g = vim.g

-- Encoding
--
-- opt.encoding = "utf-8"
-- opt.fileencoding = "utf-8"
-- opt.fileencodings = { "utf-8", "ucs-bom", "gb18030", "gbk", "gb2312", "cp936" }

-- Appearence
--
-- Syntax Highlight
vim.cmd("syntax on")

-- Indent
opt.tabstop = 4
opt.shiftwidth = 4
-- opt.expandtab = false
opt.smartindent = true
vim.cmd("filetype plugin indent on")

opt.wrap = true
opt.wrapmargin = 2
opt.linebreak = true

-- Typewriter mode: keep space when moving cursor
opt.scrolloff = 999
-- opt.sidescrolloff = 8

opt.relativenumber = false
-- opt.colorcolumn = "80"

-- Show invisible characters
-- opt.list = true
-- opt.listchars = "space:·"

opt.ignorecase = true
opt.smartcase = true

-- Highlight cursor line
opt.cursorline = true
opt.number = true

-- Operation
--
-- Time wait for typing shortcut keys
-- opt.timeoutlen = 400

-- opt.foldmethod = "manual"

o.clipboard = "unnamedplus"
