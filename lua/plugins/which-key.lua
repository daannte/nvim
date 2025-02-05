return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
		local wk = require("which-key")
		wk.add({
			{
				{ "<leader>f", group = "Telescope" },
				{ "<leader>g", group = "Git" },
				{ "<leader>s", group = "Split" },
			},
		})
	end,
	opts = {
		icons = {
			group = "+",
			breadcrumb = "=",
			separator = "->",
		},
		win = {
			border = "double",
		},
	},
}
