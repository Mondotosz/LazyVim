return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      inlay_hints = {
        enabled = true,
      },
      setup = {
        clangd = function(_, opts)
          opts.capabilities.offsetEncoding = { "utf-16" }
        end,
        -- jdtls = function(_, opts)
        --   -- Customize JDTLS setup
        --   opts.init_options = {
        --     extendedClientCapabilities = {
        --       inlayHintProvider = false, -- Disable inlay hints
        --     },
        --   }
        -- end,
        -- TODO: Fix this
        -- tailwindcss = function(_, opts)
        --   local tw = LazyVim.lsp.get_raw_config("tailwindcss")
        --   opts.filetypes = opts.filetypes or {}
        --
        --   -- Add default filetypes
        --   vim.list_extend(opts.filetypes, tw.default_config.filetypes)
        --
        --   -- Remove excluded filetypes
        --   --- @param ft string
        --   opts.filetypes = vim.tbl_filter(function(ft)
        --     return not vim.tbl_contains(opts.filetypes_exclude or {}, ft)
        --   end, opts.filetypes)
        --
        --   -- Additional settings for Phoenix projects
        --   opts.settings = {
        --     tailwindCSS = {
        --       includeLanguages = {
        --         vue = "html",
        --         ["vue-html"] = "html",
        --         eelixir = "html-eex",
        --         elixir = "html-eex",
        --         eruby = "erb",
        --         heex = "html-eex",
        --         templ = "html",
        --       },
        --     },
        --   }
        --
        --   -- Add additional filetypes
        --   vim.list_extend(opts.filetypes, opts.filetypes_include or {})
        -- end,
      },
      servers = {
        hyprls = {
          filetypes = { "hyprlang", "*.hl", "hypr*.conf", ".config/hypr/*.conf", ".config/hypr/**/*.conf" },
        },
        tailwindcss = {
          filetypes_include = { "vue" },
        },
        ltex_plus = {
          enabled = false,
        },
        harper_ls = {
          enabled = false,
        },
        typos_lsp = {
          enabled = false,
        },
        tinymist = {
          settings = {
            -- Configure formatting and wrapping here
            formatterMode = "typstyle", -- or "typst-fmt"
            formatterPrintWidth = 80,
            formatterProseWrap = true,
            projectResolution = "lockDatabase",
            -- exportPdf = "onSave",
            -- If tinymist supports specific wrapping width in the future,
            -- it would go here.
          },
        },
        taplo = {
          settings = {
            evenBetterToml = {
              configure_options = {
                include = { "~/.config/**" },
              },
            },
          },
        },
      },
      diagnostics = {
        virtual_text = false,
      },
    },
  },
}
