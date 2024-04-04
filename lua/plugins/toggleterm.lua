local ensure_buffer_saved = function()
  local buf = vim.api.nvim_get_current_buf()

  if
    vim.api.nvim_get_option_value("modifiable", { buf = buf })
    and vim.api.nvim_get_option_value("modified", { buf = buf })
  then
    vim.api.nvim_command("w")
  end
end

local toggle_n = function(n, symbol)
  return function()
    ensure_buffer_saved()
    require("toggleterm").toggle_command("name=" .. symbol, n)
  end
end

return {
  "akinsho/toggleterm.nvim",
  version = "*",
  keys = {
    {
      "¬",
      function()
        ensure_buffer_saved()
        require("toggleterm").toggle_command("name=󰎤")
      end,
      mode = { "v", "n", "t", "i" },
      desc = "Toggle Terminal",
    },

    { "<leader>t1", toggle_n(1, "󰎤"), desc = "ToggleTerm: Show terminal 1" },
    { "<leader>t2", toggle_n(2, "󰎧"), desc = "ToggleTerm: Show terminal 2" },
    { "<leader>t3", toggle_n(3, "󰎪"), desc = "ToggleTerm: Show terminal 3" },
    { "<leader>t4", toggle_n(4, "󰎭"), desc = "ToggleTerm: Show terminal 4" },
    { "<leader>t5", toggle_n(5, "󰎱"), desc = "ToggleTerm: Show terminal 5" },
    { "<leader>t6", toggle_n(6, "󰎳"), desc = "ToggleTerm: Show terminal 6" },
    { "<leader>t7", toggle_n(7, "󰎶"), desc = "ToggleTerm: Show terminal 7" },
    { "<leader>t8", toggle_n(8, "󰎹"), desc = "ToggleTerm: Show terminal 8" },
    { "<leader>t9", toggle_n(9, "󰎼"), desc = "ToggleTerm: Show terminal 9" },
    { "<leader>ts", "<cmd>TermSelect<cr>", desc = "ToggleTerm: Select terminal" },
  },
  opts = {
    direction = "float",
  },
}
