return {
  "akinsho/git-conflict.nvim",
  version = "*",
  keys = {
    { "<leader>gCo", "<cmd>GitConflictChooseOurs<cr>", desc = "Select the current changes" },
    { "<leader>gCt", "<cmd>GitConflictChooseTheirs<cr>", desc = "Select the incoming changes" },
    { "<leader>gC0", "<cmd>GitConflictChooseBoth<cr>", desc = "Select both changes" },
    { "<leader>gCb", "<cmd>GitConflictChooseNone<cr>", desc = "Select none of the changes" },
    { "<leader>gCn", "<cmd>GitConflictNextConflict<cr>", desc = "Move to the next conflict" },
    { "<leader>gCp", "<cmd>GitConflictPrevConflict<cr>", desc = "Move to the previous conflict" },
    { "<leader>gCq", "<cmd>GitConflictListQf<cr>", desc = "Open conflicts in quickfix" },
  },
  opts = {
    default_mappings = false,
    default_commands = true,
  },
}
