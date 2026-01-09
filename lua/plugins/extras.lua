-- Plugins that don't really need their own file
return {
  { "MunifTanjim/nui.nvim",  lazy = true },
  { "nvim-lua/plenary.nvim", lazy = true },
  {
    "stevearc/dressing.nvim",
    lazy = true,
    init = function()
      vim.ui.select = function(...)
        ---@diagnostic disable-next-line: different-requires
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.select(...)
      end
      vim.ui.input = function(...)
        ---@diagnostic disable-next-line: different-requires
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.input(...)
      end
    end,
  },
  {
    "echasnovski/mini.move",
    event = "BufRead",
    version = "*",
    config = function()
      require("mini.move").setup({
        mappings = {
          down = "J",
          up = "K",
          left = "",
          right = "",

          line_left = "",
          line_right = "",
          line_up = "",
          line_down = "",
        },
        options = {
          reindent_linewise = false,
        },
      })
    end,
  },
  {
    "folke/ts-comments.nvim",
    event = "BufReadPost",
    opts = {},
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      signs = false,
    },
  },
  -- {
  --   "j-hui/fidget.nvim",
  --   opts = {}
  -- }
}
