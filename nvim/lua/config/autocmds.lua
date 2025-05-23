-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- Disable the concealing in some file formats
-- The default conceallevel is 3 in LazyVim
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc", "markdown" },
  callback = function()
    vim.opt.conceallevel = 0
  end,
})

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
