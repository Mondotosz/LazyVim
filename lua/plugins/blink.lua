return {
  -- TODO: configure blink like cmp

  "saghen/blink.cmp",
  opts = {
    keymap = {
      preset = "default",
      ["<CR>"] = {},
      ["<C-h>"] = { "snippet_backward", "fallback" },
      ["<C-l>"] = { "snippet_forward", "fallback" },
      ["<Tab>"] = {},
      ["<S-Tab>"] = {},
    },
    completion = {
      list = {
        selection = {
          preselect = true,
          auto_insert = true,
        },
      },
    },
  },
}
