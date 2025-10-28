return {
  "ibhagwan/fzf-lua",
  opts = {
    winopts = {
      backdrop = 100,
    },
    files = {
      formatter = "path.filename_first"
    },
    fzf_colors = true,
    fzf_opts = {
      ["--no-scrollbar"] = true
    },
    keymap = {
      fzf = {
        ["ctrl-d"] = "half-page-down",
        ["ctrl-u"] = "half-page-up"
      }
    },
    defaults = {
      previewer = false,
      cwd_prompt = false,
      git_icons = false,
    }
  },
  keys = {
    {
      "<leader>ff",
      function()
        require("fzf-lua").files()
      end,
      desc = "Find Files",
    },
    {
      "<leader>fg",
      function()
        require("fzf-lua").live_grep()
      end,
      desc = "Live Grep",
    },
    {
      "<leader>ft",
      "<cmd>TodoFzfLua<cr>",
      desc = "Todo",
    },
    {
      "gd",
      function()
        require("fzf-lua").lsp_definitions()
      end,
      desc = "Goto Definition",
    },
    {
      "gr",
      function()
        require("fzf-lua").lsp_references()
      end,
      nowait = true,
      desc = "References",
    },
  }
}
