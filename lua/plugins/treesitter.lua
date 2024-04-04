return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    opts.incremental_selection = {
      enable = true,
      keymaps = {
        node_incremental = "v",
        node_decremental = "V",
      },
    }
  end,
}
