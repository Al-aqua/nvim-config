return {
  "akinsho/flutter-tools.nvim",
  opts = {
    debugger = {
      enabled = false,
    },
  },
  dependencies = {
    {
      "nvim-telescope/telescope.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
    },
  },
  keys = {
    {
      "<leader>Fl",
      function() require("telescope").extensions.flutter.commands() end,
      desc = "Flutter commands",
    },
  },
}
