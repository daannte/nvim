vim.pack.add({ { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") } })


require("blink.cmp").setup({
  keymap = {
    ["<Tab>"] = { "accept", "fallback" },
    ["<C-p>"] = { "select_prev", "fallback" },
    ["<C-n>"] = { "select_next", "fallback" },
    ["<C-x>"] = { "show", "show_documentation", "hide_documentation" }
  },
  completion = {
    menu = {
      border = nil,
      scrolloff = 1,
      scrollbar = false,
      draw = {
        columns = {
          { "kind_icon", "label", gap = 3 },
        },
      }
    }
  },
  cmdline = { enabled = false },
  sources = {
    default = function()
      local sources = { "lsp", "buffer" }
      local ok, node = pcall(vim.treesitter.get_node)

      if ok and node then
        if not vim.tbl_contains({ "comment", "line_comment", "block_comment" }, node:type()) then
          table.insert(sources, "path")
        end
        if node:type() ~= "string" then
          table.insert(sources, "snippets")
        end
      end

      return sources
    end
  }
})
