-- return {
--   "vyfor/cord.nvim",
--   build = ".\\build",
--   event = "VeryLazy",
--   opts = {
--     timer = {
--       interval = 1000,
--       reset_on_idle = true,
--     },
--     editor = {
--       tooltip = "What're u see bro?",
--     },
--     display = {
--       show_time = false,
--       show_repository = false,
--       workspace_blacklist = {
--         "V3",
--         "DOTFILES",
--         "BACKEND",
--         "FRONTEND",
--       },
--     },
--     lsp = {
--       show_problem_count = true,
--       severety = 4,
--     },
--     idle = {
--       disable_on_focus = true,
--       timeout = 0,
--       text = "Thinking...",
--     },
--     text = {
--       editing = "Working on {}",
--     },
--   },
-- }
return {
  "IogaMaster/neocord",
  event = "VeryLazy",
  opts = {
    logo = "auto",
    logo_tooltip = "What're u see bro?",
    log_level = "error",
    blacklist = {
      "v3",
      "Dotfiles",
      "Backend",
      "Frontend",
    },
    file_assets = {
      lua = { "Luaa", "lua" },
      vim = { "Vim", "vim" },
      nvim = { "Nvim", "nvim" },
      [".Browsing"] = { "Test", "lua" },
    },

    show_time = true,
    global_timer = true,
  },
}
