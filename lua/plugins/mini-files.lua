return {
	{
		"echasnovski/mini.files",
		version = false,
		keys = {
			{ "<leader>e", ":lua MiniFiles.open()<CR>", desc = "Open MiniFiles", silent = true },
		},
		opts = { content = { prefix = function() end } },
	},
}
