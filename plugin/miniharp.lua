vim.pack.add({ {
  src = 'https://github.com/vieitesss/miniharp.nvim',
  version = vim.version.range("v*"),
} })

require('miniharp').setup({
  autoload = true,          -- load marks for this cwd on startup (default: true)
  autosave = true,          -- save marks for this cwd on exit (default: true)
  show_on_autoload = false, -- show popup list after a successful autoload (default: false)
  ui = {
    position = 'center',    -- 'center' | 'top-left' | 'top-right' | 'bottom-left' | 'bottom-right'
    show_hints = false,     -- show close hints in the floating list (default: true)
    enter = false,          -- enter the floating window when it opens (default: true)
  },
})

vim.keymap.set('n', '<leader>m', require('miniharp').toggle_file, { desc = 'miniharp: toggle file mark' })
vim.keymap.set('n', '<C-n>', require('miniharp').next, { desc = 'miniharp: next file mark' })
vim.keymap.set('n', '<C-p>', require('miniharp').prev, { desc = 'miniharp: prev file mark' })
vim.keymap.set('n', '<leader>l', require('miniharp').show_list, { desc = 'miniharp: toggle marks list' })
vim.keymap.set('n', '<leader>c', require('miniharp').clear, { desc = 'miniharp: clear marks list' })
