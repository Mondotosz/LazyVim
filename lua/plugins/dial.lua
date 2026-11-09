return {
  "monaqa/dial.nvim",
  opts = function(_, opts)
    table.insert(opts.groups.default, require("dial.augend").date.alias["%Y-%m-%d"])
  end,
}
