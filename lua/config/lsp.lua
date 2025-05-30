-- https://neovim.io/doc/user/lsp.html#lsp

-- TODO: Get path to LSP folder and loop over files instead, will make it automatic
-- so i dont have to manual add them here
vim.lsp.enable({ "luals", "basedpyright", "ruff", "ts_ls", "tailwindcss" })

-- Diagnostics

---@type vim.diagnostic.Opts
local config = {
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "x ",
      [vim.diagnostic.severity.ERROR] = "! ",
      [vim.diagnostic.severity.ERROR] = "# ",
      [vim.diagnostic.severity.ERROR] = "i "
    }
  },
  virtual_text = { current_line = true },
}
vim.diagnostic.config(config)

vim.api.nvim_create_autocmd('LspAttach', {
  desc = "LSP Actions",
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if not client then
      return
    end

    -- Format on Save
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = args.buf,
      callback = function()
        if client:supports_method("textDocument/formatting") then
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
        end
      end
    })
    -- TODO: Make keymaps here
    -- Lsp Keymaps
  end,
})

-- Create a LspInfo command
vim.api.nvim_create_user_command("LspInfo", function()
  vim.cmd("silent checkhealth vim.lsp")
end, {
  desc = "Get all the information about all LSP attached",
})
