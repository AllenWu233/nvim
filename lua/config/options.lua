-- Add any additional options here
local opt = vim.opt
local o = vim.o
local g = vim.g
local cmd = vim.cmd

-- Encoding
--
-- opt.encoding = "utf-8"
-- opt.fileencoding = "utf-8"
-- opt.fileencodings = { "utf-8", "ucs-bom", "gb18030", "gbk", "gb2312", "cp936" }

-- Appearence
--
-- Syntax Highlight
-- cmd("syntax on")

-- Indent
opt.shiftwidth = 4
opt.tabstop = 4
opt.expandtab = true
opt.softtabstop = 4
opt.smartindent = true
-- cmd("filetype plugin indent on")

-- Typewriter mode: keep space when moving cursor
opt.scrolloff = 999
-- opt.sidescrolloff = 8

opt.ignorecase = true
opt.smartcase = true

-- UI
opt.wrap = true
opt.wrapmargin = 2
opt.linebreak = true
opt.cursorline = true
opt.number = true

-- opt.showmode = false -- Hide default mode module
-- opt.showcmd = true
-- opt.showcmdloc = "statusline"

opt.cmdheight = 0 -- Hide default command line
opt.relativenumber = false
-- opt.colorcolumn = "80"

-- Show invisible characters
-- opt.list = true
-- opt.listchars = "space:·"

-- Operation
--
-- Time wait for typing shortcut keys
-- opt.timeoutlen = 400
opt.updatetime = 300
-- opt.foldmethod = "manual"

o.clipboard = "unnamedplus"

opt.virtualedit = "block"

-- Remember undo history
local undo_path = vim.fn.stdpath("state") .. "/undo"
if vim.fn.isdirectory(undo_path) == 0 then
    vim.fn.mkdir(undo_path, "p")
end

opt.undodir = undo_path
opt.undofile = true
