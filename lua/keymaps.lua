vim.g.mapleader = " "
vim.g.lacalmapleader = " "
vim.keymap.set("i","jk","<ESC>")
vim.keymap.set("n","<leader>q",":q<enter>",{desc = "退出"})
vim.keymap.set("n","<leader>w",":w<enter>",{desc = "保存"})
vim.keymap.set("n","<leader>e",":Neotree<enter>",{desc = "文件树"})

-----窗口设置
vim.keymap.set("n","<c-up>",":sp<enter>",{desc = "纵分屏"})
vim.keymap.set("n","<c-right>",":vsp<enter>",{desc = "横分屏"})

vim.keymap.set("n", "<leader><Left>",  "<C-w>h", { desc = "切到左侧窗口" })
vim.keymap.set("n", "<leader><Down>",  "<C-w>j", { desc = "切到下方窗口" })
vim.keymap.set("n", "<leader><Up>",    "<C-w>k", { desc = "切到上方窗口" })
vim.keymap.set("n", "<leader><Right>", "<C-w>l", { desc = "切到右侧窗口" })

vim.keymap.set("n", "<A-Left>",  "<cmd>vertical resize -2<cr>", { desc = "窗口变窄" })
vim.keymap.set("n", "<A-Right>", "<cmd>vertical resize +2<cr>", { desc = "窗口变宽" })
vim.keymap.set("n", "<A-Up>",    "<cmd>resize +2<cr>",          { desc = "窗口变高" })
vim.keymap.set("n", "<A-Down>",  "<cmd>resize -2<cr>",          { desc = "窗口变矮" })

---telescope快捷键
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "查找文件" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "全文搜索" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "查找缓冲区" })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "查找帮助" })

--LSP快捷键
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "查看说明" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "跳到定义" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "查看引用" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "重命名" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "代码动作" })

---markdown快捷键
vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", { desc = "Markdown 预览" })
vim.keymap.set("n", "<leader>mr", "<cmd>RenderMarkdown toggle<cr>", { desc = "Markdown 渲染切换" })
