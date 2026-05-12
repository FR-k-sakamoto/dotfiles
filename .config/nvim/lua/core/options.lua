local opt = vim.opt

-- 表示
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.termguicolors = true
opt.scrolloff = 8
opt.wrap = false

-- インデント
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true

-- 検索
opt.ignorecase = true
opt.smartcase = true

-- 編集
opt.clipboard = "unnamedplus"
opt.undofile = true
opt.swapfile = false

-- 分割
opt.splitright = true
opt.splitbelow = true

-- その他
opt.mouse = "a"
opt.updatetime = 250
