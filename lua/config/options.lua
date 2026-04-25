-- Add any additional options here
local opt = vim.opt
local o = vim.o
local g = vim.g

-- ---------- Encoding ---------- --
-- opt.encoding = "utf-8"
-- opt.fileencoding = "utf-8"
opt.fileencodings = { "utf-8", "ucs-bom", "gb18030", "gbk", "gb2312", "cp936" }

-- ---------- VIEW ---------- --
-- Indent
opt.tabstop = 4
opt.shiftwidth = 4
-- opt.expandtab = false

opt.wrap = true
opt.linebreak = true
opt.wrapmargin = 2

-- Display lines with a line break
-- opt.cursorline = true

-- Keep space when moving cursor
opt.scrolloff = 999
-- opt.sidescrolloff = 8

-- Time wait for typing shortcut keys
-- opt.timeoutlen = 400

-- opt.colorcolumn = "80"

-- Show invisible characters
-- opt.list = true
-- opt.listchars = "space:·"

opt.relativenumber = false

-- opt.foldmethod = "manual"

o.clipboard = "unnamedplus"
