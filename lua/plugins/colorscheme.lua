local themes = {
	{
		"comfysage/evergarden",
		lazy = true,
		priority = 1000,
		opts = {
			theme = {
				variant = "winter",
			},
			overrides = {},
		},
		config = function(_, opts)
			require("evergarden").setup(opts)
			vim.cmd.colorscheme("evergarden")
		end,
	},
	{
		"RRethy/base16-nvim",
		lazy = true,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("base16-black-metal-gorgoroth")
			-- Change comment colour
			vim.api.nvim_set_hl(0, "TSComment", { fg = "#555555", gui = nil })
		end,
	},
	{
		"ramojus/mellifluous.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			colorset = "kanagawa_dragon",
			kanagawa_dragon = {
				highlight_overrides = {
					dark = function(highlighter, colors)
						highlighter.set("SignColumn", { bg = colors.bg })
						highlighter.set("StatusLine", { bg = colors.bg })
					end,
				},
			},
		},
		config = function(_, opts)
			require("mellifluous").setup(opts)
			vim.cmd.colorscheme("mellifluous")
		end,
	},
}

return themes
