return {
  ft = "python",
  -- root = {
  -- 	"pyproject.toml",
  -- 	"setup.py",
  -- 	"setup.cfg",
  -- 	"requirements.txt",
  -- 	"Pipfile",
  -- 	"pyrightconfig.json",
  -- },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "ninja", "python", "rst", "toml" })
      end
    end,
  },
  -- {
  -- 	"neovim/nvim-lspconfig",
  -- 	opts = {
  -- 		servers = {
  -- 			basedpyright = {},
  -- 			ruff = {},
  -- 		},
  -- 		setup = {
  -- 			ruff = function()
  -- 				vim.api.nvim_create_autocmd("LspAttach", {
  -- 					callback = function(args)
  -- 						local client = vim.lsp.get_client_by_id(args.data.client_id)
  -- 						if client.name == "ruff" then
  -- 							-- Disable hover in favor of Pyright
  -- 							client.server_capabilities.hoverProvider = false
  -- 						end
  -- 					end,
  -- 				})
  -- 			end,
  -- 		},
  -- 	},
  -- },
}
