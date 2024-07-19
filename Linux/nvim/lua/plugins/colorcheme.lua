return {
  {
    "navarasu/onedark.nvim",
    lazy = true,
    priority = 1000,
    opts = function()
      return {
        transparent = true,
        style = "darker",
        lualine = {
          transparent = true,
        },
      }
    end,
  },
}
