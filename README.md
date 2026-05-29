# Lee-vim

Neovim 配置，基于 lazy.nvim 管理插件。

## 插件列表

| 插件 | 说明 |
|------|------|
| [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) | 文件浏览器 |
| [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) | 主题 |
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
| [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) | 终端管理 |
| [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) | Markdown 渲染 |
| [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) | Markdown 浏览器预览 |

| [claudecode.nvim](https://github.com/coder/claudecode.nvim) | AI 编码助手 |

## 基础设置

| 选项 | 值 | 说明 |
|------|-----|------|
| `number` / `relativenumber` | `true` | 行号 + 相对行号 |
| `mouse` | `"a"` | 启用鼠标 |
| `tabstop` / `shiftwidth` | `4` | 缩进 4 空格 |
| `expandtab` | `true` | Tab 转空格 |
| `hlsearch` / `incsearch` | `true` | 搜索高亮 + 增量搜索 |
| `ignorecase` / `smartcase` | `true` | 智能大小写搜索 |
| `termguicolors` | `true` | 24 位真彩色 |
| `signcolumn` | `"yes"` | 始终显示符号列 |
| `cursorline` | `true` | 高亮当前行 |
| `wrap` | `false` | 不自动换行 |
| `swapfile` / `backup` | `false` | 禁用交换/备份文件 |
| `undofile` | `true` | 持久化撤销历史 |

## LSP 服务

| 服务器 | 语言 |
|--------|------|
| `clangd` | C/C++（自动安装） |
| `pyright` | Python（需手动安装） |

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
| `<C-h>` | `<C-w>h` | 切到左侧窗口 |
| `<C-j>` | `<C-w>j` | 切到下方窗口 |
| `<C-k>` | `<C-w>k` | 切到上方窗口 |
| `<C-l>` | `<C-w>l` | 切到右侧窗口 |
| `<A-←>` | `:vertical resize -2` | 窗口变窄 |
| `<A-→>` | `:vertical resize +2` | 窗口变宽 |
| `<A-↑>` | `:resize +2` | 窗口变高 |
| `<A-↓>` | `:resize -2` | 窗口变矮 |

### 文件树

| 快捷键 | 命令 | 说明 |
|--------|------|------|
| `<leader>e` | `Neotree toggle` | 打开/关闭文件树 |

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

### 终端

| 快捷键 | 命令 | 说明 |
|--------|------|------|
| `<C-\>` | `ToggleTerm` | 切换终端（水平分割，15 行） |

### Markdown

| 快捷键 | 命令 | 说明 |
|--------|------|------|
| `<leader>mp` | `MarkdownPreviewToggle` | 浏览器预览 |
| `<leader>mr` | `RenderMarkdown toggle` | 渲染切换 |


### ClaudeCode (AI 编码助手)

| 快捷键 | 命令 | 说明 |
|--------|------|------|
| `<leader>ac` | `ClaudeCode` | 打开/关闭 Claude |
| `<leader>af` | `ClaudeCodeFocus` | 聚焦 Claude 面板 |
| `<leader>ar` | `ClaudeCode --resume` | 恢复对话 |
| `<leader>as` | `ClaudeCodeSend` | （可视模式）发送选中内容 |
| `<leader>ab` | `ClaudeCodeAdd %` | 添加当前文件到上下文 |
| `<leader>aa` | `ClaudeCodeDiffAccept` | 接受差异 |
| `<leader>ad` | `ClaudeCodeDiffDeny` | 拒绝差异 |

## 其他

- **Leader 键**: `<Space>`
- **自动补全**: `<C-Space>` 触发，`Tab`/`Shift-Tab` 切换候选，`Enter` 确认
- **主题**: tokyonight.nvim (night 风格)，禁用透明背景
- **状态栏**: lualine.nvim，显示模式 / Git 分支 / 差异 / 诊断 / 文件路径 / 文件类型 / 日期 / 时间 / 位置 / 进度
