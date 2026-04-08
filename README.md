# Lee-vim

Neovim 配置，基于 lazy.nvim 管理插件。

## 插件列表

| 插件 | 说明 |
|------|------|
| [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) | 文件浏览器 |
| [cyberdream.nvim](https://github.com/scottmckendry/cyberdream.nvim) | 主题 |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | 状态栏 |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | 模糊搜索 |
| [noice.nvim](https://github.com/folke/noice.nvim) | 命令面板 / 通知 |
| [nvim-notify](https://github.com/rcarriga/nvim-notify) | 通知弹窗 |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | 快捷键提示 |
| [smear-cursor.nvim](https://github.com/sphamba/smear-cursor.nvim) | 鼠标轨迹效果 |
| [mason.nvim](https://github.com/mason-org/mason.nvim) | LSP/DAP 管理器 |
| [mason-lspconfig.nvim](https://github.com/mason-org/mason-lspconfig.nvim) | LSP 配置桥接 |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP 基础配置 |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | 自动补全 |
| [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) | LSP 补全源 |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | 代码片段 |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | 语法高亮 |
| [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) | Markdown 渲染 |
| [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) | Markdown 浏览器预览 |

## 快捷键

### 通用

| 快捷键 | 命令 | 说明 |
|--------|------|------|
| `i` 模式下 `jk` | `<ESC>` | 退出插入模式 |
| `<leader>q` | `:q` | 退出 |
| `<leader>w` | `:w` | 保存 |

### 窗口

| 快捷键 | 命令 | 说明 |
|--------|------|------|
| `<C-up>` | `:sp` | 纵向分屏 |
| `<C-right>` | `:vsp` | 横向分屏 |
| `<leader>←` | `<C-w>h` | 切换到左侧窗口 |
| `<leader>↓` | `<C-w>j` | 切换到下方窗口 |
| `<leader>↑` | `<C-w>k` | 切换到上方窗口 |
| `<leader>→` | `<C-w>l` | 切换到右侧窗口 |
| `<A-←>` | `:vertical resize -2` | 窗口变窄 |
| `<A-→>` | `:vertical resize +2` | 窗口变宽 |
| `<A-↑>` | `:resize +2` | 窗口变高 |
| `<A-↓>` | `:resize -2` | 窗口变矮 |

### Telescope 文件搜索

| 快捷键 | 命令 | 说明 |
|--------|------|------|
| `<leader>ff` | `Telescope find_files` | 查找文件 |
| `<leader>fg` | `Telescope live_grep` | 全文搜索 |
| `<leader>fb` | `Telescope buffers` | 查找缓冲区 |
| `<leader>fh` | `Telescope help_tags` | 查找帮助 |

### LSP

| 快捷键 | 命令 | 说明 |
|--------|------|------|
| `K` | `vim.lsp.buf.hover` | 查看符号说明 |
| `gd` | `vim.lsp.buf.definition` | 跳到定义 |
| `gr` | `vim.lsp.buf.references` | 查看引用 |
| `<leader>rn` | `vim.lsp.buf.rename` | 重命名 |
| `<leader>ca` | `vim.lsp.buf.code_action` | 代码动作 |

### Markdown

| 快捷键 | 命令 | 说明 |
|--------|------|------|
| `<leader>mp` | `MarkdownPreviewToggle` | 浏览器预览 |
| `<leader>mr` | `RenderMarkdown toggle` | 渲染切换 |

### 窗口面板

| 快捷键 | 命令 | 说明 |
|--------|------|------|
| `<leader>e` | `Neotree` | 打开文件树 |

## 其他

- **Leader Key**: `<Space>`
- **自动补全**: `<C-Space>` 触发，`Tab`/`Shift-Tab` 切换候选，`Enter` 确认
- **主题**: cyberdream.nvim，支持透明背景
