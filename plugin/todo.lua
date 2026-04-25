vim.pack.add({
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/folke/todo-comments.nvim" }
})

require("todo-comments").setup({
  signs = false
})

vim.keymap.set('n', '<leader>tq', ":TodoQuickFix<cr>", { desc = 'todo: quickfix list' })
