return {
  "stevearc/conform.nvim",
  opts = {
    require("conform").setup({
      notify_no_formatters = true,
      formatters = {
        biome = {
          command = "biome",
          cwd = require("conform.util").root_file({ "biome.json", "biome.jsonc" }),
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
        json = function(bufnr)
          if require("conform").get_formatter_info("jsonls", bufnr).available then
            return { "jsonls" }
          else
            return { "prettier" }
          end
        end,
        astro = function(bufnr)
          if require("conform").get_formatter_info("biome", bufnr).available then
            return { "biome" }
          else
            return { "prettier" }
          end
        end,
        typescript = function(bufno)
          if require("conform").get_formatter_info("biome", bufno).available then
            return { "biome" }
          else
            return { "prettier" }
          end
        end,
        javascript = function(bufno)
          if require("conform").get_formatter_info("biome", bufno).available then
            return { "biome" }
          else
            return { "prettier" }
          end
        end,
      },
    }),
    opts = function(_, opts)
      if LazyVim.has_extra("formatting.biome") then
        opts.formatters_by_ft = opts.formatters_by_ft or {}
        opts.formatters_by_ft.astro = { "biome" }
        opts.formatters_by_ft.typescript = { "biome" }
        opts.formatters_by_ft.javascript = { "biome" }
      end
      if LazyVim.has_extra("formatting.prettier") then
        opts.formatters_by_ft = opts.formatters_by_ft or {}
        -- opts.formatters_by_ft.astro = { "prettier" }
        -- opts.formatters_by_ft.typescript = { "prettier" }
        -- opts.formatters_by_ft.javascript = { "prettier" }
      end
    end,
  },
}
