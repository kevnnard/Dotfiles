-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- -- Disable the concealing in some file formats
-- -- The default conceallevel is 3 in LazyVim
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "json", "jsonc", "markdown" },
--   callback = function()
--     vim.opt.conceallevel = 0
--   end,
-- })

vim.api.nvim_create_user_command("DuSize", function(opts)
  local path = opts.args ~= "" and opts.args or "."
  local handle = io.popen("du -sh " .. path)
  if handle then
    local result = handle:read("*a")
    handle:close()
    print(result)
  else
    print("Error ejecutando du")
  end
end, {
  nargs = "?",
  desc = "Muestra el tamaño de un archivo o carpeta usando du -sh",
})

vim.api.nvim_create_user_command("RemoveLineComments", function()
  local bufnr = vim.api.nvim_get_current_buf()
  local ft = vim.bo[bufnr].filetype

  local comment_patterns = {
    lua = "%s*%-%-.*",
    python = "%s*#.*",
    sh = "%s*#.*",
    javascript = "%s*//.*",
    typescript = "%s*//.*",
    c = "%s*//.*",
    cpp = "%s*//.*",
    java = "%s*//.*",
    rust = "%s*//.*",
    go = "%s*//.*",
    html = "%s*<!--.-%-->",
  }

  local pattern = comment_patterns[ft]
  if not pattern then
    vim.notify("No line comment pattern defined for filetype: " .. ft, vim.log.levels.WARN)
    return
  end

  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  for i, line in ipairs(lines) do
    lines[i] = line:gsub(pattern, "")
  end
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
end, {})
