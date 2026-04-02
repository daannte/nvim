vim.cmd.highlight 'clear'
if vim.fn.exists 'syntax_on' then
  vim.cmd.syntax 'reset'
end
vim.o.termguicolors = true
vim.g.colors_name = "swamp"
local c = {
  bg = '#0E1419',
  black = '#000000',
  bright_blue = '#D0B5F3',
  bright_cyan = '#BCF4F5',
  bright_green = '#97EDA2',
  bright_magenta = '#E7A1D7',
  bright_red = '#EC6A88',
  bright_white = '#FFFFFF',
  bright_yellow = '#F6F6B6',
  comment = '#B08BBB',
  cyan = '#A7DFEF',
  fg = '#F6F6F5',
  fuchsia = '#E11299',
  green = '#87E58E',
  grey = '#A9ABAC',
  gutter_fg = '#4B5263',
  lavender = '#6272A4',
  lilac = '#6D5978',
  menu = '#21222C',
  neon_cyan = '#00DFDF',
  nontext = '#3B4048',
  orange = '#FFBFA9',
  pink = '#E48CC1',
  purple = '#BAA0E8',
  red = '#E95678',
  selection = '#3C4148',
  transparent_black = '#1E1F29',
  transparent_blue = '#19272C',
  transparent_green = '#22372c',
  transparent_red = '#342231',
  transparent_yellow = '#202624',
  visual = '#3E4452',
  white = '#F6F6F5',
  yellow = '#E8EDA2',
}

local palette = {
  base00 = "#F1E3D1", -- BG
  base01 = "#DDCEBC", -- BG2
  base02 = "#C9B9A7", -- BG3
  base03 = "#B5A492", -- Comments
  base04 = "#A0907D",
  base05 = "#64513E", -- FG
  base06 = "#786653",
  base07 = "#8C7B68",
  base08 = "#D09700", -- Variables
  base09 = "#64513E", -- numbers
  base0A = "#993333", -- Classes
  base0B = "#908D6A", -- Strings
  base0C = "#d09700", -- Support
  base0D = "#BF7979", -- Functions
  base0E = "#9E5581", -- Keywords
  base0F = "#75858C", -- Parentheses
}

local colors = {
  bg = "#F1E3D1",
  fg = "#64513E",
  visual = "#DDCEBC",
  comment = "#B5A492",
  selection = "#DDCEBC",
  slate = "#75858C",
  lavender = '#6272A4',
  magenta = "#9E5581",
  peach = "#C58686",
  yellow = "#D09700",
  green = "#80906A",
}

---@type table<string, vim.api.keyset.highlight>
local groups = {
  Comment = { fg = colors.comment },               -- just comments
  Constant = { fg = colors.peach },                -- any constant
  Cursor = { fg = colors.bg, bg = colors.fg },     -- character under the cursor
  CursorLine = { bg = colors.selection },          -- screen-line at the cursor, when 'cursorline' is set.  Low-priority if forecrust (ctermfg OR guifg) is not set.
  lCursor = { fg = colors.bg, bg = colors.fg },    -- character under the cursor when |language-mapping| is used (see 'guicursor')
  CursorLineNr = { fg = colors.peach },            -- like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line. highlights the number in numberline.
  Delimiter = { fg = colors.slate },               -- char that needs attention
  Exception = { fg = colors.magenta },             -- try, catch, throw
  Identifier = { fg = colors.yellow },             -- any variable name
  Operator = { fg = colors.lavender },             -- "sizeof", "+", "*", etc.
  Keyword = { fg = colors.magenta },               -- any other keyword
  LineNr = { fg = colors.comment },                -- line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
  MatchParen = { fg = colors.peach, bold = true }, -- the character under the cursor or just before it, if it is a paired bracket, and its match.
  Normal = { fg = colors.fg, bg = colors.bg },     -- normal text
  Special = { fg = colors.slate },                 -- any special symbol
  SpecialChar = { link = "Special" },              -- special character in a constant
  String = { fg = colors.green },                  -- a string
  Visual = { bg = colors.visual },                 -- visual mode selection
  VisualNOS = { bg = colors.visual },              -- visual mode selection when vim is "Not Owning the Selection".

  ["@variable"] = { fg = colors.fg },

  ["@lsp.type.variable"] = {},
}

for group, opts in pairs(groups) do
  vim.api.nvim_set_hl(0, group, opts)
end
