if vim.loader then
  vim.loader.enable()
end

require("util.save-file")
require("config.lazy")
require("gitsigns").setup()
require("lspconfig").pyright.setup({})
require("package-info").setup()
require("notify").setup()
