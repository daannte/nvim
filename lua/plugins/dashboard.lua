return {
	"goolord/alpha-nvim",
	lazy = vim.fn.argc() ~= 0, -- only load when no file specified
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		local greeting = function()
			local hour = tonumber(vim.fn.strftime("%H"))
			-- [04:00, 12:00) - morning, [12:00, 20:00) - day, [20:00, 04:00) - evening
			local part_id = math.floor((hour + 4) / 8) + 1
			local day_part = ({ "evening", "morning", "afternoon", "evening" })[part_id]
			local username = vim.loop.os_get_passwd()["username"] or "USERNAME"

			return ("Good %s, %s"):format(day_part, username)
		end

		dashboard.section.header.val = greeting()
		dashboard.section.buttons.val = {
			dashboard.button("f", "Find File", "<cmd>Telescope find_files<CR>"),
			dashboard.button("e", "File Explorer", "<cmd>lua MiniFiles.open()<CR>"),
			dashboard.button("q", "Quit", "<cmd>qa!<CR>"),
		}
		dashboard.config.opts.noautocmd = true

		alpha.setup(dashboard.config)
	end,
}
