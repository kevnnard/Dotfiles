return {
  "ThePrimeagen/refactoring.nvim",
  keys = {
    {
      "<leader>r",
      function()
        require("refactoring").select_refactor()
      end,
      mode = "v",
      noremap = true,
      sint = true,
      expr = false,
    },
  },
  opts = {},
}
