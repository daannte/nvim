return {
	{
		"L3MON4D3/LuaSnip",
		event = { "InsertEnter" },
		dependencies = {
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
		opts = {
			history = true,
			delete_check_events = "TextChanged",
		},
	},
	{
		"echasnovski/mini.pairs",
		event = "InsertEnter",
		opts = {
			mappings = {
				["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\`].", register = { cr = false } },
			},
		},
	},
	{
		"saghen/blink.cmp",
		event = "InsertEnter",
		version = "v0.*",
		opts = {
			keymap = {
				["<Tab>"] = {
					function(cmp)
						if cmp.snippet_active() then
							return cmp.accept()
						else
							return cmp.select_and_accept()
						end
					end,
					"snippet_forward",
					"fallback",
				},
				["<S-Tab>"] = { "select_prev", "fallback" },
				["<C-p>"] = { "select_prev", "fallback" },
				["<C-n>"] = { "select_next", "fallback" },
				["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			},
			highlight = {
				use_nvim_cmp_as_default = true,
			},
			accept = { auto_brackets = { enabled = true } },

			windows = {
				autocomplete = {
					border = "solid",
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 200,
				},
			},
		},
	},
}
