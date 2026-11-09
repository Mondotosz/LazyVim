return {
  "stevearc/conform.nvim",
  opts = {
    formatters = {
      typstyle = {
        stdin = false,
        args = {
          "-i",
          "--wrap-text",
          "$FILENAME",
        },
      },
    },
    formatters_by_ft = {
      markdown = { "prettier" },
      java = { "google-java-format" },
      typst = { "typstyle" },
    },
  },
}
