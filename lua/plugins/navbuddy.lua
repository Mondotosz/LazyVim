return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "SmiteshP/nvim-navbuddy",
      dependencies = {
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim",
      },
      keys = {
        { "<leader>n", "<cmd>Navbuddy<cr>", desc = "Navbuddy" },
      },
      opts = { lsp = { auto_attach = true } },
    },
  },
}
