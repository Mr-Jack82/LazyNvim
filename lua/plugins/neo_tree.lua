-- https://github.com/dpetka2001/dotfiles/blob/main/dot_config/nvim/lua/plugins/editor.lua
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      mappings = {
        ["l"] = "open",
        ["h"] = "close_node",
      },
    },
    event_handlers = {
      {
        event = "file_added",
        handler = function(destination)
          local uv = vim.loop
          local file_info = uv.fs_stat(destination)
          if not file_info then
            return
          elseif file_info.type == "file" then
            uv.fs_chmod(destination, 436) -- (436 base 10) == (664 base 8)
          elseif file_info.type == "directory" then
            uv.fs_chmod(destination, 509) -- 644 does not work for directories I guess?
          end
        end,
      },
    },
  },
}