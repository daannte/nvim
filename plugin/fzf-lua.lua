vim.pack.add({ "https://github.com/ibhagwan/fzf-lua" })

local FzfLua = require("fzf-lua")

FzfLua.setup({
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
      ["ctrl-u"] = "half-page-up",
      ["ctrl-q"] = "select-all+accept"
    }
  },
  defaults = {
    previewer = false,
    cwd_prompt = false,
    git_icons = false,
  }
})

vim.keymap.set("n", "<leader>ff", function()
  FzfLua.files()
end)

vim.keymap.set("n", "<leader>fg", function()
  FzfLua.live_grep()
end)

vim.keymap.set("n", "<leader>fb", function()
  FzfLua.buffers()
end)

vim.keymap.set("n", "gd", function()
  FzfLua.lsp_definitions()
end)
