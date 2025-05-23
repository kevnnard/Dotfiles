local blacklist = {
  "v3",
  "Dotfiles",
  "grupor-backend",
  "grupor-frontend",
  "grupor-v3",
  "three-trackr",
  "trackr-b-v1",
}

local is_blacklisted = function(opts)
  return vim.tbl_contains(blacklist, opts.workspace)
end

local git_branch = vim.fn.system("git branch --show-current"):gsub("\n", "")
local get_errors = function(bufnr)
  return vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.ERROR })
end
local errors = get_errors(0) -- pass the current buffer; pass nil to get errors for all buffers

vim.api.nvim_create_autocmd("DiagnosticChanged", {
  callback = function()
    errors = get_errors(0)
  end,
})

return {
  "vyfor/cord.nvim",
  build = ":Cord update",
  opts = {
    editor = {
      client = "neovim",
      tooltip = "What're u see bro?",
    },
    display = {
      theme = "atom",
      swap_fields = true,
    },
    timestamp = {
      enabled = false,
      format = "%H:%M",
      show_seconds = false,
    },
    idle = {
      enabled = true,
      timeout = 300000,
      details = "Thinking...",
    },
    variables = {
      git_status = function(opts)
        return git_branch
      end,
    },
    text = {
      workspace = function(opts)
        local hour = tonumber(os.date("%H"))
        local status = hour >= 22 and "🌙 Late night coding"
          or hour >= 18 and "🌆 Evening session"
          or hour >= 12 and "☀️ Afternoon coding"
          or hour >= 5 and "🌅 Morning productivity"
          or "🌙 Midnight hacking"

        return string.format("%s: in %s", status, opts.workspace)
      end,
      editing = function(opts)
        return string.format("Editing %s - %s errors", opts.filename, #errors)
      end,
      -- editing = function(opts)
      --   return string.format("Editing %s - %s:%s", opts.filename, opts.cursor_line, opts.cursor_char)
      -- end,
    },
    hooks = {
      -- post_activity = function(opts, activity)
      --   local version = vim.version()
      --   activity.assets.small_text = string.format("Neovim %s.%s.%s", version.major, version.minor, version.patch)
      -- end,
      workspace_change = function(opts)
        if is_blacklisted(opts) then
          opts.manager:hide()
        else
          opts.manager:resume()
        end
        -- git_branch = vim.fn.system("git branch --show-current"):gsub("\n", "")
      end,
    },
  },
}
-- return {
--   "IogaMaster/neocord",
--   event = "VeryLazy",
--   opts = {
--     logo = "auto",
--     logo_tooltip = "What're u see bro?",
--     log_level = "error",
--     blacklist = {
--       "v3",
--       "Dotfiles",
--       "grupor-backend",
--       "grupor-frontend",
--       "grupor-v3",
--       "three-trackr",
--       "trackr-b-v1",
--     },
--     file_assets = {
--       lua = { "Luaa", "lua" },
--       vim = { "Vim", "vim" },
--       nvim = { "Nvim", "nvim" },
--       [".Browsing"] = { "Test", "lua" },
--     },
--
--     show_time = false,
--     global_timer = false,
--   },
-- }
