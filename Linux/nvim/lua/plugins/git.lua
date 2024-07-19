return {
  enabled = false,
  "dinhhuy258/git.nvim",
  event = "BufReadPre",
  opts = {
    keymaps = {
      -- Open Blame General
      blame = "<Leader>ga",
      -- Open File/folder in browser
      browse = "<Leader>go",
    },
  },
}
