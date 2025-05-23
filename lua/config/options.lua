-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.mapleader = ","
vim.g.maplocalleader = "<Nop>"

vim.o.scrolloff = 6
vim.o.textwidth = 80
vim.o.colorcolumn = "81"
vim.o.softtabstop = 2
vim.o.ttimeoutlen = 150
vim.opt.path:append(".**")
vim.o.swapfile = false
vim.o.wildignorecase = true
vim.opt.listchars = {
  eol = "↴",
  tab = "» ",
  trail = "•",
  lead = "-",
  extends = "…",
  precedes = "…",
  conceal = "+",
  nbsp = "␣",
}
vim.o.wildoptions = "pum,fuzzy"
vim.opt.diffopt:append({
  "vertical",
  "iwhite",
  "hiddenoff",
  "algorithm:histogram",
  "indent-heuristic",
  "linematch:60",
})
