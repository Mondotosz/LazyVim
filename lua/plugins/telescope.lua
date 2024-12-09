return {
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
    opts = {
      pickers = {
        man_pages = {
          sections = { "ALL" },
        },
      },
    },
    -- keys = {
    --   {
    --     "<leader>sM",
    --     function()
    --       require("telescope.builtin").man_pages()
    --     end,
    --     desc = "Man Pages",
    --   },
    -- },
  },
  {
    "jemag/telescope-diff.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    lazy = true,
    config = function()
      require("telescope").load_extension("diff")
    end,
    keys = {
      {
        "<leader>fd",
        function()
          require("telescope").extensions.diff.diff_current({ hidden = false, no_ignore = true })
        end,
        desc = "Diff current file",
      },
    },
  },
}
