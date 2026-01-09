local themes = {
  {
    "everviolet/nvim",
    name = "evergarden",
    lazy = true,
    priority = 1000,
    opts = {
      theme = {
        variant = "fall",
        accent = "pink"
      },
    },
    config = function(_, opts)
      require("evergarden").setup(opts)
      vim.cmd.colorscheme("evergarden")
    end,
  },
  {
    "webhooked/kanso.nvim",
    lazy = true,
    priority = 1000,
    opts = {
      bold = false,
      italics = false,
    },
    config = function(_, opts)
      require("kanso").setup(opts)
      vim.cmd.colorscheme("kanso-zen")
    end
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "mocha"
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end
  }
}

return themes
