vim.pack.add { 'https://github.com/vyfor/cord.nvim' }

require('cord').setup {
  editor = {
    tooltip = "The editor of your nightmares"
  },
  display = {
    theme = "void"
  }
}
