vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local opt = vim.opt

opt.termguicolors = true
vim.cmd("syntax enable")
opt.number = true
opt.relativenumber = false
opt.clipboard = "unnamedplus"
opt.cursorline = true

local undo_dir = vim.fn.stdpath("state") .. "/undo"
if vim.fn.isdirectory(undo_dir) == 0 then
  vim.fn.mkdir(undo_dir, "p")
end
opt.undofile = true
opt.undodir = undo_dir

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = -1
opt.expandtab = true
opt.smartindent = true
opt.ignorecase = true
opt.smartcase = true
opt.scrolloff = 5

require("config.lazy")
