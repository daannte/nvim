vim.pack.add({ "https://github.com/nvim-mini/mini.files" })

local MiniFiles = require("mini.files")

MiniFiles.setup({
  mappings = {
    show_help = "?",
    go_in_plus = "<CR>"
  },
})

vim.keymap.set("n", "<leader>e", function()
  local bufname = vim.api.nvim_buf_get_name(0)
  local path = vim.fn.fnamemodify(bufname, ":p")

  if path and vim.uv.fs_stat(path) then
    MiniFiles.open()
  end
end)

vim.pack.add({ "https://github.com/nvim-mini/mini.surround", "https://github.com/nvim-mini/mini.move" })

require("mini.surround").setup()

require("mini.move").setup({
  mappings = {
    up = "K",
    down = "J"
  },
  options = {
    reindent_linewise = false
  }
})
