return {
  "vyfor/cord.nvim",
  build = "./build",
  event = "VeryLazy",
  opts = {
    display = {
      show_repository = false,
      show_time = false,
    },
    lsp = {
      show_problem_count = true,
    },
  },
}
