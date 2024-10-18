-- Stolen from lazyvim cause folke goat
return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		opts = {
			servers = {
				lua_ls = {
					settings = {
						Lua = {
							diagnostics = {
								globals = {
									"vim",
									"awesome",
								},
							},
							telemetry = { enable = false },
						},
					},
				},
			},
		},
		config = function(_, opts)
			local lspconfig = require("lspconfig")
			local servers = opts.servers

			-- Setup Keymaps
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", { silent = true })
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { silent = true })
					vim.keymap.set("n", "gf", "<cmd>lua vim.diagnostic.open_float()<cr>", { silent = true })

					if client.supports_method("textDocument/definition") then
						vim.keymap.set("n", "gd", function()
							require("telescope.builtin").lsp_definitions({ reuse_win = true })
						end, { silent = true })
					end
					if client.supports_method("textDocument/signatureHelp") then
						vim.keymap.set("n", "gK", vim.lsp.buf.signature_help, { silent = true })
						vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { silent = true })
					end
					if client.supports_method("text/codeAction") then
						vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { silent = true })
					end
				end,
			})

			-- Setup Diagnostic Signs
			local diagnostic_signs = {
				Error = "x ",
				Warn = "! ",
				Hint = "# ",
				Info = "i ",
			}

			for name, icon in pairs(diagnostic_signs) do
				name = "DiagnosticSign" .. name
				vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
			end

			-- Setup servers
			local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
			-- For adding completion to the servers
			local capabilities = vim.tbl_deep_extend(
				"force",
				{},
				vim.lsp.protocol.make_client_capabilities(),
				has_cmp and cmp_nvim_lsp.default_capabilities() or {},
				opts.capabilities or {}
			)

			local function setup(server)
				local server_opts = vim.tbl_deep_extend("force", {
					capabilities = vim.deepcopy(capabilities),
				}, servers[server] or {})

				if opts.setup[server] then
					if opts.setup[server](server, server_opts) then
						return
					end
				elseif opts.setup["*"] then
					if opts.setup["*"](server, server_opts) then
						return
					end
				end
				lspconfig[server].setup(server_opts)
			end

			local have_mason, mlsp = pcall(require, "mason-lspconfig")
			local all_mslp_servers = {}
			if have_mason then
				all_mslp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
			end

			local ensure_installed = {} ---@type string[]
			for server, server_opts in pairs(servers) do
				if server_opts then
					server_opts = server_opts == true and {} or server_opts
					if server_opts.enabled ~= false then
						-- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
						if server_opts.mason == false or not vim.tbl_contains(all_mslp_servers, server) then
							setup(server)
						else
							ensure_installed[#ensure_installed + 1] = server
						end
					end
				end
			end

			if have_mason then
				local plugin = require("lazy.core.config").spec.plugins["mason-lspconfig.nvim"]
				local Plugin = require("lazy.core.plugin")
				local mason_opts = Plugin.values(plugin, "opts", false)
				mlsp.setup({
					ensure_installed = vim.tbl_deep_extend(
						"force",
						ensure_installed,
						mason_opts.ensure_installed or {}
					),
					handlers = { setup },
				})
			end

			local function get_config(server)
				local configs = require("lspconfig.configs")
				return rawget(configs, server)
			end

			local function is_enabled(server)
				local c = get_config(server)
				return c and c.enabled ~= false
			end

			local function disable(server, cond)
				local util = require("lspconfig.util")
				local def = get_config(server)
				---@diagnostic disable-next-line: undefined-field
				def.document_config.on_new_config = util.add_hook_before(
					def.document_config.on_new_config,
					function(config, root_dir)
						if cond(root_dir, config) then
							print(server)
							config.enabled = false
						end
					end
				)
			end

			if is_enabled("denols") and is_enabled("ts_ls") then
				local is_deno = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc")
				disable("ts_ls", is_deno)
				disable("denols", function(root_dir, config)
					if not is_deno(root_dir) then
						config.settings.deno.enable = false
					end
					return false
				end)
			end
		end,
	},
	{
		"williamboman/mason.nvim",
		lazy = true,
		cmd = "Mason",
		keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
		opts = {
			ensure_installed = {
				"stylua",
				"prettier",
				"css-lsp",
				"html-lsp",
				"typescript-language-server",
			},
		},
		config = function(_, opts)
			require("mason").setup({ ui = { border = "double" } }, opts)
			local mr = require("mason-registry")
			mr:on("package:install:success", function()
				vim.defer_fn(function()
					require("lazy.core.handler.event").trigger({
						event = "FileType",
						buf = vim.api.nvim_get_current_buf(),
					})
				end, 100)
			end)
			local function ensure_installed()
				for _, tool in ipairs(opts.ensure_installed) do
					local p = mr.get_package(tool)
					if not p:is_installed() then
						p:install()
					end
				end
			end
			if mr.refresh then
				mr.refresh(ensure_installed)
			else
				ensure_installed()
			end
		end,
	},

	-- Auto Format
	{
		"stevearc/conform.nvim",
		event = { "BufWrite" },
		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					javascript = { "prettier" },
					typescript = { "prettier" },
					javascriptreact = { "prettier" },
					typescriptreact = { "prettier" },
					css = { "prettier" },
					html = { "prettier" },
					json = { "prettier" },
					yaml = { "prettier" },
					lua = { "stylua" },
				},
				format_on_save = {
					lsp_fallback = true,
					async = false,
					timeout_ms = 3000,
				},
			})

			vim.keymap.set({ "n", "v" }, "<leader>cm", function()
				conform.format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 3000,
				})
			end, { desc = "Format file or range (in visual mode)" })
		end,
	},
}
