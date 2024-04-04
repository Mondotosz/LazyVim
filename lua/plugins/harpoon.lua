return {
  "ThePrimeagen/harpoon",
  keys = {
    {
      "<leader>H",
      function()
        require("harpoon"):list():add()
      end,
    },
  },
}
