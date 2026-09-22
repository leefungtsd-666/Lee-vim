vim.g.mapleader = " "
vim.g.localmapleader = " "
-- 基础操作
vim.keymap.set("i", "jk", "<Esc>", { desc = "退出插入模式" })
vim.keymap.set("n", "<leader>q", "<cmd>quit<CR>", { desc = "退出窗口" })
vim.keymap.set("n", "<leader>w", "<cmd>write<CR>", { desc = "保存文件" })
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

-- 窗口管理
vim.keymap.set("n", "<C-Up>", "<cmd>split<CR>", { desc = "水平分屏（上下）" })
vim.keymap.set("n", "<C-Right>", "<cmd>vsplit<CR>", { desc = "垂直分屏（左右）" })

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "切到左侧窗口" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "切到下方窗口" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "切到上方窗口" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "切到右侧窗口" })

-- terminal 模式下 Ctrl+hjkl 切换窗口（<C-\><C-n> 退出 terminal 模式）
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "终端：切到左侧窗口" })
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "终端：切到下方窗口" })
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "终端：切到上方窗口" })
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "终端：切到右侧窗口" })

vim.keymap.set("n", "<A-Left>",  "<cmd>vertical resize -2<cr>", { desc = "窗口变窄" })
vim.keymap.set("n", "<A-Right>", "<cmd>vertical resize +2<cr>", { desc = "窗口变宽" })
vim.keymap.set("n", "<A-Up>",    "<cmd>resize +2<cr>",          { desc = "窗口变高" })
vim.keymap.set("n", "<A-Down>",  "<cmd>resize -2<cr>",          { desc = "窗口变矮" })

-- LSP 导航与代码操作
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "查看说明" })
vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "跳到定义" })
vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", { desc = "查看引用" })
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "重命名符号" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "代码动作" })

vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "跳到声明" })
vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", { desc = "查看实现" })
vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "查看类型定义" })

-- 光标必须位于诊断范围内；首次打开不抢焦点，再按 gl 可进入浮窗复制。
vim.keymap.set("n", "gl", function()
  local float_buf = vim.diagnostic.open_float({
    scope = "cursor",
    focusable = true,
    border = "rounded",
    source = true,
    header = "",
    prefix = "",
    severity_sort = true,
  })
  if not float_buf then
    vim.notify("光标处没有诊断信息", vim.log.levels.INFO)
  end
end, { desc = "查看光标处诊断", silent = true })

-- Neovim 默认 gr 系列也使用 Telescope，避免进入另一种结果列表。
-- 保留 gr 前缀等待，以便 grr/gri/grn 等仍然可用。
vim.keymap.set("n", "grr", "<cmd>Telescope lsp_references<CR>", { desc = "查看引用" })
vim.keymap.set("n", "gri", "<cmd>Telescope lsp_implementations<CR>", { desc = "查看实现" })
vim.keymap.set("n", "grt", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "查看类型定义" })
vim.keymap.set("n", "grn", vim.lsp.buf.rename, { desc = "重命名符号" })
vim.keymap.set({ "n", "x" }, "gra", vim.lsp.buf.code_action, { desc = "代码操作" })
vim.keymap.set("n", "gO", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "当前文件符号" })

-- 查找：统一放在 <leader>f 分类下
vim.keymap.set("n", "<leader>fd", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "当前文件符号" })
vim.keymap.set("n", "<leader>fw", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", { desc = "工作区符号" })
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope grep_string<cr>", { desc = "搜索光标下单词" })

-- Markdown
vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", { desc = "Markdown 预览" })
vim.keymap.set("n", "<leader>mr", "<cmd>RenderMarkdown toggle<cr>", { desc = "Markdown 渲染切换" })


