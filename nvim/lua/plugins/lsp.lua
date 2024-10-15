return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = false },
    ---@type lspconfig.options
    servers = {
      astro = {
        opts = function(_, opts)
          LazyVim.extend(opts.servers.vtsls, "settings.vtsls.tsserver.globalPlugins", {
            {
              name = "@astrojs/ts-plugin",
              location = LazyVim.get_pkg_path("astro-language-server", "/node_modules/@astrojs/ts-plugin"),
              enableForWorkspaceTypeScriptVersions = true,
            },
          })
        end,
      },
      prismals = {},
      cssls = {},
      tailwindcss = {},
      jsonls = {},
      tsserver = {
        enabled = false,
      },
      ts_ls = {
        enabled = false,
      },
      vtsls = {
        settings = {
          format = false,
          vetur = {
            completion = {
              autoImport = true,
              tagCasing = "kebab",
              useScaffoldSnippets = false,
            },
            validation = {
              template = true,
              style = true,
              script = true,
            },
            experimental = {
              templateInterpolationService = false,
            },
          },
        },
      },
      html = {},
      yamlls = {
        settings = {
          yaml = {
            keyOrdering = false,
          },
        },
      },
      lua_ls = {
        -- enabled = false,
        single_file_support = true,
        settings = {
          Lua = {
            workspace = {
              checkThirdParty = false,
            },
            completion = {
              workspaceWord = true,
              callSnippet = "Both",
            },
            misc = {
              parameters = {
                -- "--log-level=trace",
              },
            },
            hint = {
              enable = true,
              setType = false,
              paramType = true,
              paramName = "Disable",
              semicolon = "Disable",
              arrayIndex = "Disable",
            },
            doc = {
              privateName = { "^_" },
            },
            type = {
              castNumberToInteger = true,
            },
            diagnostics = {
              disable = { "incomplete-signature-doc", "trailing-space" },
              -- enable = false,
              groupSeverity = {
                strong = "Warning",
                strict = "Warning",
              },
              groupFileStatus = {
                ["ambiguity"] = "Opened",
                ["await"] = "Opened",
                ["codestyle"] = "None",
                ["duplicate"] = "Opened",
                ["global"] = "Opened",
                ["luadoc"] = "Opened",
                ["redefined"] = "Opened",
                ["strict"] = "Opened",
                ["strong"] = "Opened",
                ["type-check"] = "Opened",
                ["unbalanced"] = "Opened",
                ["unused"] = "Opened",
              },
              unusedLocalExclude = { "_*" },
            },
            format = {
              enable = false,
              defaultConfig = {
                indent_style = "space",
                indent_size = "2",
                continuation_indent_size = "2",
              },
            },
          },
        },
      },
    },
    setup = {
      tsserver = function()
        -- disable tsserver
        return true
      end,
    },
  },
}
