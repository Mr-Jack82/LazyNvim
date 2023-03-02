-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

vim.cmd([[cabbrev w!! execute 'silent write !sudo tee % >/dev/null' <bar> edit!]])

-- Moving left/right in *INSERT* mode
map("i", "<C-h>", "<Left>", { noremap = true, silent = true })
map("i", "<C-l>", "<Right>", { noremap = true, silent = true })

-- Make {motion} text uppercase in INSERT mode.
map("!", "<C-s>", "<Esc>gUiw`]a", { noremap = false })

-- Move text around
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

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

-- Some additional mappings for Hop
local ok, hop = pcall(require, "hop")
if not ok then
  return
end

local directions = require("hop.hint").HintDirection

map("", "t", function()
  hop.hint_char1({
    direction = directions.AFTER_CURSOR,
    current_line_only = true,
    hint_offset = -1,
  })
end, { remap = true })
map("", "T", function()
  hop.hint_char1({
    direction = directions.BEFORE_CURSOR,
    current_line_only = true,
    hint_offset = 1,
  })
end, { remap = true })
