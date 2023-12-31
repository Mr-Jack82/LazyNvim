return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    modes = {
      char = {
        enabled = true,
        keys = { "f", "F", "t", "T", ";", [","] = "'" },
        ---@alias Flash.CharActions table<string, "next" | "prev" | "right" | "left">
        -- The direction for `prev` and `next` is determined by the motion.
        -- `left` and `right` are always left and right.
        char_actions = function(motion)
          return {
            [";"] = "next", -- set to `right` to always go right
            [","] = "prev", -- set to `left` to always go left
            -- clever-f style
            [motion:lower()] = "next",
            [motion:upper()] = "prev",
            -- jump2d style: same case goes next, opposite case goes prev
            -- [motion] = "next",
            -- [motion:match("%l") and motion:upper() or motion:lower()] = "prev",
          }
        end,
      },
    },
  },
}
