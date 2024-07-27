-- Bootstrap Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local opts = {
	spec = {
		{ import = "plugins" },
		{ import = "plugins.lang" },
	},
	default = { lazy = true },
	change_detection = {
		notify = false,
	},
	ui = {
		border = "double",
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"2html_plugin",
				"archlinux",
				"bugreport",
				"compiler",
				"ftplugin",
				"fzf",
				"sleuth",
				"syntax",
				"synmenu",
				"spellfile",
				"spellfile_plugin",
				"optwin",
				"matchit",
				"rrhelper",
				"rplugin",
				"logipat",
				"gtags",
				"getscript",
				"getscriptPlugin",
				"man",
				"tutor",
				"tutor_mode_plugin",
				"tar",
				"tarPlugin",
				"zip",
				"zipPlugin",
				"gzip",
				"vimball",
				"vimballPlugin",
				"vimgrep",
				"netrw",
				"netrwPlugin",
				"netrwSettings",
				"netrwFileHandlers",
				"node_provider",
				"ruby_provider",
				"python3_provider",
				"perl_provider",
			},
		},
	},
}

require("lazy").setup(opts)
