return {
  "danymat/neogen",
  keys = {
    {
      "<leader>cq",
      function()
        require("neogen").generate()
      end,
      desc = "Neogen Comment",
    },
  },
  opts = { snippet_engine = "luasnip" },
}
