return {
  "nvim-telescope/telescope.nvim",
  version = false,
  cmd = { "Telescope" },
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    {
      "<leader>ff",
      function()
        require("telescope.builtin").find_files()
      end,
      desc = "Find Files",
    },
    {
      "<leader>fr",
      function()
        require("telescope.builtin").live_grep()
      end,
      desc = "Live Grep",
    },
    {
      "<leader>fs",
      function()
        require("telescope.builtin").grep_string()
      end,
      desc = "Grep String",
    },
    {
      "<leader>fb",
      function()
        require("telescope.builtin").buffers()
      end,
      desc = "Buffers",
    },
  },

  config = function()
    require("telescope").setup({
      defaults = {
        preview = false,
        results_title = "",
        prompt_prefix = " ",
        borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
        path_display = { "filename_first" },
        mappings = {
          i = {
            ["<ESC>"] = "close",
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
          },
        },
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--trim",
        },
      },
      pickers = {
        find_files = {
          disable_devicons = true,
        },
        buffers = {
          mappings = {
            i = {
              ["<c-d>"] = require("telescope.actions").delete_buffer,
            },
            n = {
              ["<c-d>"] = require("telescope.actions").delete_buffer,
            },
          },
        },
      },
    })
  end,
}
