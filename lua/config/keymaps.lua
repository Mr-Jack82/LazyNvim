-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
local unmap = vim.keymap.del

unmap({ "n", "s", "x" }, "<C-S>")

-- Save files without write permissions via sudo
vim.cmd([[cabbrev w!! execute 'silent write !sudo tee % >/dev/null' <bar> edit!]])

-- Moving left/right in *INSERT* and *COMMAND* mode
-- Using `silent = false` makes movements to be immediately shown.
map({ "i", "c" }, "<C-h>", "<Left>", { silent = false, desc = "Move Left" })
map({ "i", "c" }, "<C-l>", "<Right>", { silent = false, desc = "Move Right" })

-- Make {motion} text uppercase in INSERT mode.
map("!", "<C-b>", "<Esc>gUiw`]a", { noremap = false })

-- Allow 'gf' to open non-existent files
map("", "gf", "<cmd>edit <cfile><CR>", { noremap = true, silent = true })

-- Select last pasted text
map("n", "gV", "'`[' . strpart(getregtype(), 0, 1) . '`]'", { expr = true })

-- When joining lines keep cursor position
map("n", "J", "mzJ`z")

-- repeat last command for each line of a visual selection
map("x", ".", "<cmd>normal .<CR>", { noremap = true })

-- U for redo, the opposite of for undo
map("n", "U", "<C-r>")

-- Set working directory to the current buffer's directory
map("n", "cd", ":lcd %:p:h<bar>lua print('current directory is ' .. vim.fn.getcwd())<CR>", { silent = false })
map("n", "cu", "..<bar>pwd<CR>", { silent = false })
