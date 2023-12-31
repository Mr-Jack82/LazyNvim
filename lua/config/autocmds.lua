-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Taken from here:
-- https://github.com/dpetka2001/dotfiles/blob/main/dot_config/nvim/lua/config/autocmds.lua
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Prefer creating groups and assigning autocmds to groups, because it makes it easier to clear them
--[[ Mygroup Group ]]
augroup("mygroup", { clear = true })

autocmd("BufWritePost", {
  -- Match all `lua` files in `lua/config` except `lazy.lua` which is the
  -- setup file for `lazy.nvim` and should only be reloaded when updated.
  pattern = "**/lua/config/*[^lazy].lua",
  callback = function()
    local filepath = vim.fn.expand("%")
    dofile(filepath)
    vim.notify("Configuration reloaded \n" .. filepath, nil)
  end,
  group = "mygroup",
  desc = "Reload config on save",
})

-- Source: https://github.com/mcauley-penney/tidy.nvim
autocmd("BufWritePre", {
  pattern = "*",
  desc = "Delete trailing white space",
  group = augroup("TrimTrailingSpace", { clear = true }),
  callback = function()
    local pos = vim.api.nvim_win_get_cursor(0)

    -- delete trailing whitespace
    vim.cmd([[:keepjumps keeppatterns %s/\s\+$//e]])

    -- delete lines @ eof
    vim.cmd([[:keepjumps keeppatterns silent! 0;/^\%(\n*.\)\@!/,$d_]])

    local num_rows = vim.api.nvim_buf_line_count(0)

    --[[
            if the row value in the original cursor
            position tuple is greater than the
            line count after empty line deletion
            (meaning that the cursor was inside of
            the group of empty lines at the end of
            the file when they were deleted), set
            the cursor row to the last line.
        ]]
    if pos[1] > num_rows then
      pos[1] = num_rows
    end

    vim.api.nvim_win_set_cursor(0, pos)
  end,
})
