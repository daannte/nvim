return {
	{
		"echasnovski/mini.files",
		version = false,
		keys = {
			{ "<leader>e", ":lua MiniFiles.open()<CR>", desc = "Open Neotree", silent = true },
		},
		opts = { content = { prefix = function() end } },
		event = "VeryLazy",
	},
}
