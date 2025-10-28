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
    lazy = false,
    priority = 1000,
    opts = {
      bold = false,
      italics = false,
    },
    config = function(_, opts)
      require("kanso").setup(opts)
      vim.cmd.colorscheme("kanso-zen")
    end
  }
}

return themes
