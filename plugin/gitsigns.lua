vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" })

local Gitsigns = require("gitsigns")

Gitsigns.setup({
  on_attach = function(bufnr)
    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    map("n", "<leader>gp", Gitsigns.preview_hunk)
    map("n", "<leader>g]", function()
      Gitsigns.nav_hunk("next")
    end)
    map("n", "<leader>g[", function()
      Gitsigns.nav_hunk("prev")
    end)
    map("n", "<leader>gr", Gitsigns.reset_hunk)
    map("n", "<leader>gt", function()
      Gitsigns.blame_line({ full = true })
    end)
  end
})
