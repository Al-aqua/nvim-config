return {
  { import = "astrocommunity.pack.dart" },

  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<Leader>F"] = { desc = " Flutter" },
        },
      },
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  {
    "nvim-flutter/flutter-tools.nvim",
    opts = {
      debugger = {
        enabled = false,
        run_via_dap = false,
      },
    },
    keys = {
      {
        "<Leader>Fc",
        function()
          require("lazy").load { plugins = { "telescope.nvim" } }
          local telescope = require "telescope"
          telescope.load_extension "flutter"
          telescope.extensions.flutter.commands()
        end,
        desc = "Flutter Commands (Telescope)",
        ft = { "dart", "flutter" },
      },
    },
  },
}
