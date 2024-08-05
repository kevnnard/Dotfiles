return {
  "vyfor/cord.nvim",
  build = "./build",
  event = "VeryLazy",
  opts = {
    timer = {
      interval = 1000,
    },
    editor = {
      tooltip = "What're u see bro?",
    },
    display = {
      show_time = false,
      show_repository = false,
      workspace_blacklist = {
        "V3",
        "DOTFIES",
      },
    },
    lsp = {
      show_problem_count = true,
      severety = 4,
    },
    idle = {
      disable_on_focus = true,
      timeout = 0,
      text = "Thinking...",
    },
    text = {
      editing = "Working on {}",
    },
  },
}
