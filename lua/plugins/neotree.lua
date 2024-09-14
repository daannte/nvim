return {
	{
		"nvim-tree/nvim-tree.lua",
		keys = {
			{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" },
		},
		config = function()
			require("nvim-tree").setup({
				renderer = {
					icons = {
						web_devicons = {
							file = {
								enable = false,
								color = false,
							},
						},
						glyphs = {
							default = "",
							symlink = "",
							bookmark = "",
							modified = "",
							folder = {
								arrow_closed = ">",
								arrow_open = "v",
								default = "",
								open = "",
								empty = "",
								empty_open = "",
								symlink = "",
								symlink_open = "",
							},
							git = {
								unstaged = "~",
								staged = "+",
								unmerged = "%",
								renamed = "@",
								untracked = "*",
								deleted = "-",
								ignored = "#",
							},
						},
					},
				},
			})
		end,
	},
}
