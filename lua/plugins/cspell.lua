return {
  "davidmh/cspell.nvim",
  dependencies = {
    "nvimtools/none-ls.nvim",
  },
  lazy = true,
  keys = {
    {
      "<leader>uS",
      function()
        local null_ls = require("null-ls")
        if null_ls.is_registered("cspell") then
          null_ls.toggle("cspell")
        else
          local cspell = require("cspell")
          null_ls.register(cspell.diagnostics.with({
            diagnostics_postprocess = function(diagnostic)
              diagnostic.severity = vim.diagnostic.severity.HINT
            end,
          }))

          null_ls.register(cspell.code_actions)
        end
      end,
      desc = "Toggle cSpell",
    },
  },
}
