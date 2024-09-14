return {
	"echasnovski/mini.starter",
	version = false,
	lazy = vim.fn.argc() ~= 0,
	config = function()
		require("mini.starter").setup({
			items = {
				{ action = "Telescope find_files", name = "Files", section = "" },
				{ action = "NvimTreeToggle", name = "Browser", section = "" },
				{ action = "qa!", name = "Quit", section = "" },
			},
			footer = "",
			silent = true,
		})
	end,
}
