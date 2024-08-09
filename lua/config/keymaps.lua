local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Keep cursor centered when scrolling
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "<C-d>", "<C-d>zz", opts)

-- Split windows
map("n", "<leader>sh", ":split<cr>", opts) -- Horizontal split
map("n", "<leader>sv", ":vsplit<cr>", opts) -- Vertical split
map("n", "<leader>sx", ":close<cr>", opts) -- Close current split
map("n", "<leader>se", "<C-w>=<cr>", opts) -- Resize equally

-- Window navigation
map("n", "sj", "<C-w>j", opts)
map("n", "sk", "<C-w>k", opts)
map("n", "sl", "<C-w>l", opts)
map("n", "sh", "<C-w>h", opts)

-- Buffer Manipulation
map("n", "<Tab>", ":bnext<cr>", opts) -- Switch to next buffer
map("n", "<S-Tab>", ":bprev<cr>", opts) -- Switch to previous buffer

-- Remove highlight after searching
map("n", "<leader>nh", ":nohl<cr>", opts)

-- Deleting won't copy it
map("n", "x", '"_x', opts)
map("n", "dd", '"_dd', opts)

-- Increment and Decrement Numbers
map("n", "+", "<C-a>", opts)
map("n", "-", "<C-x>", opts)

-- Delete a word backwards
map("n", "dw", 'vb"_d', opts)

-- Select All
map("n", "<C-a>", "gg<S-v>G", opts)
