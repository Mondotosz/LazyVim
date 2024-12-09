return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy", -- Or `LspAttach`
  priority = 1000, -- needs to be loaded in first
  opts = {
    options = {
      show_source = true,
      multilines = true,
      show_all_diags_on_cursorline = true,
      overflow = {
        mode = "wrap",
      },
      -- break_line = {
      --   enabled = true,
      --   after = 20,
      -- },
    },
  },
  keys = {
    {
      "<leader>uD",
      function()
        require("tiny-inline-diagnostic").toggle()
      end,
      desc = "Toggle inline diagnostic",
    },
    -- {
    --   "<leader>cD",
    --   function()
    --     require("tiny-inline-diagnostic").get_diagnostic_under_cursor(vim.api.nvim_get_current_buf())
    --   end,
    -- },
  },
  -- config = function()
  --   require("tiny-inline-diagnostic").setup()
  -- end,
}
