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
