return {
  "https://gitlab.com/schrieveslaach/sonarlint.nvim.git",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  opts = {
    server = {
      cmd = {
        "sonarlint-language-server",
        -- Ensure that sonarlint-language-server uses stdio channel
        "-stdio",
        "-analyzers",
        -- paths to the analyzers you need, using those for python and java in this example
        vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarpython.jar"),
        vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarcfamily.jar"),
        vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjava.jar"),
      },
      settings = {
        sonarlint = {
          rules = {
            ["java:S1186"] = { level = "on" },
            ["java:S5665"] = { level = "on" },
          },
        },
      },
    },
    filetypes = {
      -- Tested and working
      -- "cs",
      -- "dockerfile",
      "python",
      -- "cpp",
      "java",
    },
  },
}
