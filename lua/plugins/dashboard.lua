return {
	"echasnovski/mini.starter",
	version = false,
	opts = {
		items = {
			{ name = "Find File", action = "Telescope find_files", section = "Builtin actions" },
			{ name = "File Explorer", action = "lua MiniFiles.open()", section = "Builtin actions" },
			{ name = "Quit Neovim", action = "qall", section = "Builtin actions" },
		},
		footer = "",
		silent = true,
	},
}
