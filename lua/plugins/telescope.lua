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
