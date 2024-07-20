return {
  {
    "navarasu/onedark.nvim",
    lazy = true,
    priority = 1000,
    term_colors = true,
    ending_tildes = true,
    opts = function()
      return {
        transparent = true,
        style = "darker",
        lualine = {
          transparent = true,
        },
        code_style = {
          comments = "italic",
        },
        diagnostics = {
          undercurl = true,
          darker = true,
          background = true,
        },
      }
    end,
  },
}
