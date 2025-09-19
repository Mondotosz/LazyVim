return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    inlay_hints = {
      enabled = vim.fn.has("vim-0.10"), -- Only works here since I manually changed the code in ~/.local/share/nvim/lazy/LazyVim/lua/lazyvim/util/toggle.lua
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
      tailwindcss = function(_, opts)
        local tw = LazyVim.lsp.get_raw_config("tailwindcss")
        opts.filetypes = opts.filetypes or {}

        -- Add default filetypes
        vim.list_extend(opts.filetypes, tw.default_config.filetypes)

        -- Remove excluded filetypes
        --- @param ft string
        opts.filetypes = vim.tbl_filter(function(ft)
          return not vim.tbl_contains(opts.filetypes_exclude or {}, ft)
        end, opts.filetypes)

        -- Additional settings for Phoenix projects
        opts.settings = {
          tailwindCSS = {
            includeLanguages = {
              vue = "html",
              ["vue-html"] = "html",
              eelixir = "html-eex",
              elixir = "html-eex",
              eruby = "erb",
              heex = "html-eex",
              templ = "html",
            },
          },
        }

        -- Add additional filetypes
        vim.list_extend(opts.filetypes, opts.filetypes_include or {})
      end,
    },
    servers = {
      hyprls = {
        filetypes = { "hyprlang", "*.hl", "hypr*.conf", ".config/hypr/*.conf", ".config/hypr/**/*.conf" },
      },
      tailwindcss = {
        filetypes_include = { "vue" },
      },
      volar = {
        on_attach = function(client, _)
          client.server_capabilities.completionProvider = nil
        end,
        filetypes = { "vue" },
      },
    },
    diagnostics = {
      virtual_text = false,
    },
  },
}
