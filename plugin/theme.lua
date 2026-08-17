vim.pack.add({
  { src = "https://github.com/catppuccin/nvim",         name = "catppuccin" },
  { src = "https://github.com/sainnhe/gruvbox-material" },
  { src = "https://github.com/Aejkatappaja/cendre" }
})

require("cendre").setup({
  background = "soft",
  italic = false,
})
vim.cmd.colorscheme("cendre")

-- vim.g.gruvbox_material_background = 'soft'
-- vim.cmd.colorscheme("gruvbox-material")
