vim.pack.add({
  { src = "https://github.com/catppuccin/nvim",         name = "catppuccin" },
  { src = "https://github.com/sainnhe/gruvbox-material" }
})

vim.g.gruvbox_material_background = 'soft'
vim.cmd.colorscheme("gruvbox-material")
