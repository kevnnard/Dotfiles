return {
  "stevearc/conform.nvim",
  opts = {
    require("conform").setup({
      notify_no_formatters = true,
      formatters = {
        biome = {
          command = "biome",
          cwd = require("conform.util").root_file({ ".biome.json" }),
          formatStdin = true,
        },
        prettier = {
          command = "prettier",
          cwd = require("conform.util").root_file({ ".prettierrc", ".prettierrc.json" }),
          formatStdin = true,
        },
      },
      formatters_by_ft = {
        lua = { "stylua" },
        sh = { "shellcheck" },
        astro = function(bufnr)
          if require("conform").get_formatter_info("biome", bufnr).available then
            return { "biome" }
          else
            return { "prettier" }
          end
        end,
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
