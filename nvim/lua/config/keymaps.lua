--  eymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- VERSION PACKAGES KEYMAPS

vim.keymap.set(
  { "n" },
  "<LEADER>ns",
  require("package-info").show,
  { silent = true, noremap = true, desc = "Show dependency versions" }
)
-- Hide dependency versions
vim.keymap.set(
  { "n" },
  "<LEADER>nc",
  require("package-info").hide,
  { silent = true, noremap = true, desc = "Hide dependency versions" }
)
-- Toggle dependency versions
vim.keymap.set(
  { "n" },
  "<LEADER>nt",
  require("package-info").toggle,
  { silent = true, noremap = true, desc = "Toggle dependency versions" }
)
-- Update dependency on the line
-----
vim.keymap.set(
  { "n" },
  "<LEADER>nu",
  require("package-info").update,
  { silent = true, noremap = true, desc = "Update dependency on the line" }
)
-- Delete dependency on the line
vim.keymap.set(
  { "n" },
  "<LEADER>nd",
  require("package-info").delete,
  { silent = true, noremap = true, desc = "Delete dependency on the line" }
)
-- Install a new dependency
vim.keymap.set(
  { "n" },
  "<LEADER>ni",
  require("package-info").install,
  { silent = true, noremap = true, desc = "Install a new dependency" }
)
-- Install a different dependency version
vim.keymap.set(
  { "n" },
  "<LEADER>np",
  require("package-info").change_version,
  { silent = true, noremap = true, desc = "Install a different dependency version" }
)

-----------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
-- OIL KEYMAPS INIT
vim.keymap.set("n", "<backspace>", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- TELESCOPE
vim.keymap.set("n", "<leader>fx", "<CMD>TodoTelescope<CR>", { desc = "Find Todos" })
vim.keymap.set("n", "<leader>fn", "<CMD>Telescope notify<CR>", { desc = "Find Notifications" })

-- DISCORD KEYMAPS
-- vim.keymap.set("n", "<leader>Ma", "<CMD>CordConnect<CR>", { desc = "Active Discord Status" })
-- vim.keymap.set("n", "<leader>Md", "<CMD>CordDisconnect<CR>", { desc = "Deactive Discord Status" })
-- vim.keymap.set("n", "<leader>Mr", "<CMD>CordReconnect<CR>", { desc = "Reconnect Discord" })
-- vim.keymap.set("n", "<leader>Mt", "<CMD>CordTogglePresence<CR>", { desc = "Toggle Discord Status" })
-- vim.keymap.set("n", "<leader>Mm", "<CMD>CordToggleIdle<CR>", { desc = "Toggle Idle" })
-- vim.keymap.set("n", "<leader>Mi", "<CMD>CordUnidle<CR>", { desc = "Hide Idle Stautus" })
-- vim.keymap.set("n", "<leader>Mn", "<CMD>CordWorkspace 💤 <CR>", { desc = "Change name Workspace" })

-- Delete all buffers but the current one
vim.keymap.set(
  "n",
  "<leader>bq",
  '<Esc>:%bdelete|edit #|normal`"<Return>',
  { desc = "Delete other buffers but the current one" }
)

-- Save file with custom message
vim.keymap.set("n", "<C-s>", "<CMD>lua SaveFile()<CR>", { desc = "Save file" })
function SaveFile()
  if vim.fn.empty(vim.fn.expand("%:t")) == 1 then
    vim.notify("No file to save", vim.log.levels.WARN)
    return
  end

  local filename = vim.fn.expand("%:t")
  local success, err = pcall(function()
    vim.cmd("silent! write")
  end)

  if success then
    vim.notify(filename .. " Saved!")
  else
    vim.notify("Error: " .. err, vim.log.levels.ERROR)
  end
end
