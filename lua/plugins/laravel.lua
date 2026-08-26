return {
  { import = "astrocommunity.pack.laravel" },

  {
    "adalessa/laravel.nvim",
    ft = { "php", "blade" },
    event = { "BufEnter composer.json" },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-neotest/nvim-nio",
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              ["<Leader>L"] = { desc = "󰫐 Laravel" },
            },
          },
        },
      },
    },
    keys = {
      {
        "<leader>Ll",
        function()
          require("lazy").load { plugins = { "laravel.nvim" } }
          _G.Laravel.pickers.laravel()
        end,
        desc = "Open Laravel Picker",
      },
      {
        "<leader>La",
        function()
          require("lazy").load { plugins = { "laravel.nvim" } }
          _G.Laravel.pickers.artisan()
        end,
        desc = "Open Artisan Picker",
      },
      {
        "<leader>Lr",
        function()
          require("lazy").load { plugins = { "laravel.nvim" } }
          _G.Laravel.pickers.routes()
        end,
        desc = "Open Routes Picker",
      },
      {
        "<leader>Lm",
        function()
          require("lazy").load { plugins = { "laravel.nvim" } }
          _G.Laravel.pickers.make()
        end,
        desc = "Open Make Picker",
      },
      {
        "<leader>Lc",
        function()
          require("lazy").load { plugins = { "laravel.nvim" } }
          _G.Laravel.pickers.commands()
        end,
        desc = "Open Commands Picker",
      },
      {
        "<leader>Lo",
        function()
          require("lazy").load { plugins = { "laravel.nvim" } }
          _G.Laravel.pickers.resources()
        end,
        desc = "Open Resources Picker",
      },
      {
        "<leader>Lv",
        function()
          require("lazy").load { plugins = { "laravel.nvim" } }
          _G.Laravel.commands.run "view:finder"
        end,
        desc = "Open View Finder",
      },
      {
        "<leader>Lx",
        function()
          require("lazy").load { plugins = { "laravel.nvim" } }
          _G.Laravel.commands.run "actions"
        end,
        desc = "Open Actions Picker",
      },
      {
        "<leader>Lp",
        function()
          require("lazy").load { plugins = { "laravel.nvim" } }
          _G.Laravel.commands.run "command_center"
        end,
        desc = "Open Command Center",
      },
      {
        "<leader>Lu",
        function()
          require("lazy").load { plugins = { "laravel.nvim" } }
          _G.Laravel.commands.run "hub"
        end,
        desc = "Laravel Artisan hub",
      },
      {
        "<leader>Lh",
        function()
          require("lazy").load { plugins = { "laravel.nvim" } }
          _G.Laravel.run "artisan docs"
        end,
        desc = "Open Documentation",
      },
      {
        "gf",
        function()
          local ok, res = pcall(function()
            require("lazy").load { plugins = { "laravel.nvim" } }
            if _G.Laravel.app("gf").cursorOnResource() then return "<cmd>lua _G.Laravel.commands.run('gf')<cr>" end
          end)
          if not ok or not res then return "gf" end
          return res
        end,
        expr = true,
        noremap = true,
      },
    },
    opts = function(_, opts)
      local is_available = require("astrocore").is_available
      opts.features = {
        pickers = {
          provider = (is_available "snacks.nvim" and "snacks")
            or (is_available "telescope.nvim" and "telescope")
            or (is_available "fzf-lua" and "fzf-lua")
            or "ui.select",
        },
      }
    end,
  },
}
