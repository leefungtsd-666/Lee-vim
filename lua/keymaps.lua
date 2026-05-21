vim.g.mapleader = " "
vim.g.localmapleader = " "
vim.keymap.set("i","jk","<ESC>")
vim.keymap.set("n","<leader>q",":q<enter>",{desc = "退出"})
vim.keymap.set("n","<leader>w",":w<enter>",{desc = "保存"})
vim.keymap.set("n", "<leader>e", function()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local name = vim.api.nvim_buf_get_name(buf)
    if name:match("neo%-tree") then
      vim.cmd("Neotree close")
      return
    end
  end
  vim.cmd("Neotree")
end, { desc = "文件树" })

-----窗口设置
vim.keymap.set("n","<c-up>",":sp<enter>",{desc = "水平分屏(上下)"})
vim.keymap.set("n","<c-right>",":vsp<enter>",{desc = "垂直分屏(左右)"})

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "切到左侧窗口" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "切到下方窗口" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "切到上方窗口" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "切到右侧窗口" })

vim.keymap.set("n", "<A-Left>",  "<cmd>vertical resize -2<cr>", { desc = "窗口变窄" })
vim.keymap.set("n", "<A-Right>", "<cmd>vertical resize +2<cr>", { desc = "窗口变宽" })
vim.keymap.set("n", "<A-Up>",    "<cmd>resize +2<cr>",          { desc = "窗口变高" })
vim.keymap.set("n", "<A-Down>",  "<cmd>resize -2<cr>",          { desc = "窗口变矮" })

--LSP快捷键
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "查看说明" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "跳到定义" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "查看引用" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "重命名" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "代码动作" })

---markdown快捷键
vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", { desc = "Markdown 预览" })
vim.keymap.set("n", "<leader>mr", "<cmd>RenderMarkdown toggle<cr>", { desc = "Markdown 渲染切换" })

---vimtex 快捷键 (LaTeX)
vim.keymap.set("n", "<leader>ll", "<cmd>VimtexCompile<cr>",   { desc = "编译/停止编译" })
vim.keymap.set("n", "<leader>lv", "<cmd>VimtexView<cr>",       { desc = "查看 PDF" })
vim.keymap.set("n", "<leader>lk", "<cmd>VimtexStop<cr>",       { desc = "停止编译" })
vim.keymap.set("n", "<leader>lc", "<cmd>VimtexClean<cr>",      { desc = "清理辅助文件" })
vim.keymap.set("n", "<leader>lt", "<cmd>VimtexTOCToggle<cr>",  { desc = "切换目录" })
vim.keymap.set("n", "<leader>le", "<cmd>VimtexErrors<cr>",     { desc = "显示编译错误" })
vim.keymap.set("n", "<leader>li", "<cmd>VimtexInfo<cr>",       { desc = "查看项目信息" })
