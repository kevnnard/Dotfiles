return {
  "stevearc/conform.nvim",
  opts = {
    require("conform").setup({
      notify_no_formatters = true,
      formatters = {
        biome = {
          command = "biome",
          args = { "--stdin" },
          formatStdin = true,
        },
      },
      formatters_by_ft = {
        lua = { "stylua" },
        sh = { "shellcheck" },
        tailwind = { "tailwindcss-language-server" },
        typescript = {
          "biome",
          "prettier",
          timeout_ms = 5000,
          lsp_format = "fallback",
          stop_after_first = true,
        },
        javascript = {
          "biome",
          "prettier",
          timeout_ms = 5000,
          lsp_format = "fallback",
          stop_after_first = true,
        },
        astro = { "prettier", "biome" },
      },
    }),
    opts = function(_, opts)
      if LazyVim.has_extra("formatting.prettier") then
        opts.formatters_by_ft = opts.formatters_by_ft or {}
        opts.formatters_by_ft.astro = { "prettier" }
      end
    end,
  },
}
