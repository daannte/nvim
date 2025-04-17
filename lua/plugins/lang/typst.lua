return {
	ft = { "typst" },
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = { "typst" },
		},
	},

	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				tinymist = {
					single_file_support = true, -- Fixes LSP attachment in non-Git directories
					settings = {
						formatterMode = "typstyle",
					},
				},
			},
		},
	},

	{
		"stevearc/conform.nvim",
		optional = true,
		opts = {
			formatters_by_ft = {
				typst = { "typstyle", lsp_format = "prefer" },
			},
		},
	},

	{
		"chomosuke/typst-preview.nvim",
		cmd = { "TypstPreview", "TypstPreviewToggle", "TypstPreviewUpdate" },
		keys = {
			{
				"<leader>tp",
				ft = "typst",
				"<cmd>TypstPreviewToggle<cr>",
				desc = "Toggle Typst Preview",
			},
		},
		opts = {
			dependencies_bin = {
				tinymist = "tinymist",
			},
		},
	},

	{
		"folke/ts-comments.nvim",
		opts = {
			lang = {
				typst = { "// %s", "/* %s */" },
			},
		},
	},
}
