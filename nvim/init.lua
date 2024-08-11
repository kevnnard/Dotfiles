if vim.loader then
  vim.loader.enable()
end

require("config.lazy")
require("gitsigns").setup()
require("lspconfig").pyright.setup({})
require("lspconfig").biome.setup({})
require("package-info").setup()
require("notify").setup()
