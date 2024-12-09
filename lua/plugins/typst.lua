return {
  -- {
  --   "kaarmu/typst.vim",
  --   ft = "typst",
  --   -- lazy = false,
  --   enabled = vim.fn.executable("typst"),
  -- },
  {
    "chomosuke/typst-preview.nvim",
    -- lazy = false, -- or ft = 'typst'
    ft = "typst",
    version = "1.*",
    build = function()
      require("typst-preview").update()
    end,
  },
}
