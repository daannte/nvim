return {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    keys = {
      {
        "<leader>gp",
        "<cmd>Gitsigns preview_hunk<cr>",
        desc = "Preview Hunk",
      },
      {
        "<leader>g]",
        "<cmd>Gitsigns next_hunk<cr>",
        desc = "Next Hunk",
      },
      {
        "<leader>g[",
        "<cmd>Gitsigns prev_hunk<cr>",
        desc = "Previous Hunk",
      },
      {
        "<leader>gt",
        "<cmd>Gitsigns toggle_current_line_blame<cr>",
        desc = "Toggle Line Blame",
      },
      {
        "<leader>gr",
        "<cmd>Gitsigns reset_hunk<cr>",
        desc = "Reset Hunk",
      },
    },
    opts = {
      attach_to_untracked = false,
      signcolumn = true,
      -- signs = {
      --   add = { text = "++" },
      --   change = { text = "::" },
      --   delete = { text = "--" },
      --   changedelete = { text = "~~" },
      --   topdelete = { text = "xx" },
      --   untracked = { text = ".." },
      -- },
      update_debounce = 500,
    }
  }
}
