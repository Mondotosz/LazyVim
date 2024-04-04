return {
  "folke/trouble.nvim",
  keys = {
    { "<leader>xx", "<cmd>Trouble diagnostics_float toggle<cr>", desc = "Diagnostics (Trouble)" },
    { "<leader>xX", "<cmd>Trouble diagnostics_float toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
    { "<leader>cs", "<cmd>Trouble symbols toggle focus=false win.size=0.3<cr>", desc = "Symbols (Trouble)" },
    {
      "<leader>cS",
      "<cmd>Trouble lsp_float toggle<cr>",
      desc = "LSP references/definitions/... (Trouble)",
    },
    { "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
    { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
  },
  opts = {
    modes = {
      diagnostics_float = {
        mode = "diagnostics",
        focus = true,
        preview = {
          type = "float",
          relative = "editor",
          border = "rounded",
          title = "Preview",
          title_pos = "center",
          position = { 0, -2 },
          size = { width = 0.3, height = 0.3 },
          zindex = 200,
        },
      },
      lsp_float = {
        mode = "lsp",
        focus = true,
        win = {
          position = "right",
          size = 0.3,
        },
        preview = {
          type = "float",
          relative = "cursor",
          position = { 0, 0 },
          anchor = "NE",
          border = "rounded",
          title = "Preview",
          title_pos = "center",
          size = {
            width = 0.3,
            height = 0.3,
          },
          zindex = 200,
        },
      },
    },
  },
}
