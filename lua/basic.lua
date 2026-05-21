-- 鼠标
vim.opt.mouse = "a"

-- 缩进
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- 搜索
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- 外观
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.showmode = false

-- 折行
vim.opt.wrap = false

-- 编码
vim.opt.fileencoding = "utf-8"

-- 备份 / 交换文件（关掉避免 clutter）
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
