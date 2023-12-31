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

-- Make sure to go to proper indentantion level when pressing i
-- source: https://www.reddit.com/r/neovim/comments/12rqyl8/5_smart_minisnippets_for_making_text_editing_more/
map("n", "i", function()
  if #vim.fn.getline(".") == 0 then
    return [["_cc]]
  else
    return "i"
  end
end, { expr = true })

-- Reselect latest changed, put, or yanked text
map("n", "gV", '"`[" . strpart(getregtype(), 0, 1) . "`]"', { expr = true, desc = "Visually select changed text" })

-- When joining lines keep cursor position
map("n", "J", "mzJ`z", { desc = "Join lines" })

-- repeat last command for each line of a visual selection
map("x", ".", "<cmd>normal .<CR>", { noremap = true })

-- U for redo, the opposite of for undo
map("n", "U", "<C-r>", { desc = "Redo" })

-- Set working directory to the current buffer's directory
map("n", "cd", "<cmd>lcd %:p:h<bar>lua print('current directory is ' .. vim.fn.getcwd())<CR>", { silent = false })
map("n", "cu", "..<bar>pwd<CR>", { silent = false })
