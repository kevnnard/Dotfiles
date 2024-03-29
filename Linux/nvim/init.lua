if vim.loader then
  vim.loader.enable()
end

_G.dd = function(...)
  require("util.debug").dump(...)
end
vim.print = _G.dd

require("config.lazy")
require("gitsigns").setup()
require("lspconfig").pyright.setup({})
require("package-info").setup()
require("notify").setup({
  background_colour = "#000000",
})
