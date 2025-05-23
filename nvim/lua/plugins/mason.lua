return {
  "williamboman/mason.nvim",
  opts = function(_, opts)
    vim.list_extend(opts.ensure_installed, {
      "biome",
      "stylua",
      "selene",
      "shellcheck",
      "astro-language-server",
      "tailwindcss-language-server",
      "typescript-language-server",
      "shopify-cli",
      "solargraph",
      "dockerfile-language-server",
      "docker-compose-language-service",
      "prisma-language-server",
      "graphql-language-service-cli",
    })
  end,
}
