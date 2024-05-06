return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = {
      enabled = vim.fn.has("vim-0.10"), -- Only works here since I manually changed the code in ~/.local/share/nvim/lazy/LazyVim/lua/lazyvim/util/toggle.lua
    },
    setup = {
      clangd = function(_, opts)
        opts.capabilities.offsetEncoding = { "utf-16" }
      end,
    },
  },
}
