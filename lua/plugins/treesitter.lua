return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    event = { "BufReadPost" },
    build = ":TSUpdate",
    lazy = vim.fn.argc(-1) == 0,
    init = function(plugin)
      require("lazy.core.loader").add_to_rtp(plugin)
      require("nvim-treesitter.query_predicates")
    end,
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    keys = {
      { "<c-h>", desc = "Increment Selection" },
      { "<bs>", desc = "Decrement Selection", mode = "x" },
    },
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        "c",
        "html",
        "javascript",
        "lua",
        "markdown",
        "python",
        "tsx",
        "typescript",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-h>",
          node_incremental = "<C-h>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  -- Automatically add closing tags for HTML and JSX
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    opts = {},
  },
}
