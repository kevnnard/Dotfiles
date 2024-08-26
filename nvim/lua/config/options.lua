vim.g.mapleader = " "

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.number = true

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.shell = "zsh"
vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" }
vim.opt.inccommand = "split"
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = true -- No Wrap lines
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.path:append({ "**" }) -- Finding files - Search down into subfolders
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of current
vim.opt.splitkeep = "cursor"
vim.opt.mouse = ""
vim.opt.signcolumn = "yes"

-- Set the cursor color in normal mode
vim.api.nvim_set_hl(0, "Cursor", { fg = "#000000", bg = "#00FF00" }) -- Green cursor in normal mode
-- Set the cursor color in insert mode
vim.api.nvim_set_hl(0, "CursorInsert", { fg = "#FFFFFF", bg = "#0000FF" }) -- Blue cursor in insert mode

-- Define cursor shapes and colors for different modes
vim.opt.guicursor =
  "n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-CursorInsert/lCursorInsert,r-cr:hor20-CursorReplace,o:hor50-CursorOther"

-- Define additional cursor highlights for other modes
vim.api.nvim_set_hl(0, "CursorReplace", { fg = "#000000", bg = "#FFFF00" }) -- Yellow cursor in replace mode
vim.api.nvim_set_hl(0, "CursorOther", { fg = "#000000", bg = "#00FFFF" })

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Add asterisks in block comments
vim.opt.formatoptions:append({ "r" })

vim.cmd([[au BufNewFile,BufRead *.astro setf astro]])
vim.cmd([[au BufNewFile,BufRead Podfile setf ruby]])

if vim.fn.has("nvim-0.8") == 1 then
  vim.opt.cmdheight = 0
end
