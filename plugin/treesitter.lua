vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if not (name == "nvim-treesitter" and kind == "update") then return end
    if not ev.data.active then vim.cmd.packadd("nvim-treesitter") end
    vim.cmd("TSUpdate")
  end,
  desc = ":TSUpdate"
})

vim.pack.add({ { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" } })

local languages = {
  "css",
  "diff",
  "html",
  "javascript",
  "lua",
  "markdown",
  "python",
  "rust",
  "sql",
  "svelte",
  "tsx",
  "typescript",
}

local isnt_installed = function(lang) return #vim.api.nvim_get_runtime_file("parser/" .. lang .. ".*", false) == 0 end
local to_install = vim.tbl_filter(isnt_installed, languages)
if #to_install > 0 then require("nvim-treesitter").install(to_install) end

local filetypes = vim.iter(languages):map(vim.treesitter.language.get_filetypes):flatten():totable()

vim.api.nvim_create_autocmd("FileType", {
  pattern = filetypes,
  callback = function(ev) vim.treesitter.start(ev.buf) end,
  desc = "Ensure enabled tree-sitter"
})
