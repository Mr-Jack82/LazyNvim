-- Options are automatically loaded before lazy.nvim startup
vim.g.mapleader = ","

-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

opt.scrolloff = 6
opt.textwidth = 80
opt.colorcolumn = "81"
opt.softtabstop = 2
opt.ttimeoutlen = 0
opt.path:append(".**")

if vim.fn.has("nvim-0.8") == 1 then
  opt.cmdheight = 0
end
