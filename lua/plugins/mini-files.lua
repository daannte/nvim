return {
	{
		"echasnovski/mini.files",
		version = false,
		event = "VeryLazy",
		keys = {
			{ "<leader>e", ":lua MiniFiles.open()<CR>", desc = "Open MiniFiles", silent = true },
		},
		opts = { content = { prefix = function() end } },
	},
}
