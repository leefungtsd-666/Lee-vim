local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      transparent = false,
    },
},
{
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      theme = "auto",
      globalstatus = true,
      section_separators = { left = "", right = "" },
      component_separators = { left = "│", right = "│" },
    },
    sections = {
      lualine_a = {
        { "mode", icon = "" },
      },
      lualine_b = {
        "branch",
        "diff",
        "diagnostics",
      },
      lualine_c = {
        {
          "filename",
          path = 1,
        },
      },
      lualine_x = {
        {
          "filetype",
          icon_only = false,
        },
      },
      lualine_y = {
        {
          function()
            return " " .. os.date("%m") .. "-" .. os.date("%d")
          end,
        },
        {
          function()
            return " " .. os.date("%H") .. ":" .. os.date("%M")
          end,
        },
      },
      lualine_z = {
        { "location" },
        { "progress" },
      },
    },
  },
},
{
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        numbers = "none",
        close_command = "bdelete! %d",
        indicator = {
          style = "icon",
          icon = "▎",
        },
        buffer_close_icon = "󰅖",
        modified_icon = "●",
        close_icon = "",
        max_name_length = 18,
        truncate_names = true,
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "center",
          },
        },
        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        persist_buffer_sort = true,
        separator_style = "thin",
        always_show_bufferline = true,
        hover = {
          enabled = true,
          delay = 200,
          reveal = { "close" },
        },
        sort_by = "id",
      },
    })

    vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", { desc = "上一个缓冲区" })
    vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", { desc = "下一个缓冲区" })
    vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "关闭缓冲区" })
  end,
},
{
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "Telescope",
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "查找文件" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "全文搜索" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "查找缓冲区" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "查找帮助" },
  },
},
{
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  opts = {
    cmdline = {
      enabled = true,
      view = "cmdline_popup",
    },
    messages = {
      enabled = true,
    },
    popupmenu = {
      enabled = true,
    },
    notify = {
      enabled = true,
      view = "notify",
    },
    presets = {
      bottom_search = false,
      command_palette = false,
      long_message_to_split = true,
      inc_rename = false,
      lsp_doc_border = true,
    },
    views = {
      cmdline_popup = {
        position = {
          row = 1,
          col = "50%",
        },
        size = {
          width = 60,
          height = "auto",
        },
        border = {
          style = "rounded",
        },
      },
    },
  },
},
{
  "rcarriga/nvim-notify",
  opts = {
    render = "default",
    timeout = 3000,
    stages = "fade_in_slide_out",
  },
},
{
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {},
},
{
  "sphamba/smear-cursor.nvim",
  opts = {},
},
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      { "mason-org/mason.nvim", opts = {}, cmd = "Mason" },
      "neovim/nvim-lspconfig",
    },
    -- setup 统一在 lua/lsp.lua 中调用，以便传入 handlers 和 capabilities
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
    },
  },
  ---markdown
{
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "lua", "vim", "vimdoc",
      "python", "c", "cpp",
      "markdown", "markdown_inline",
      "json", "yaml",
    },
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  },
},
{
  "akinsho/toggleterm.nvim",
  version = "*",
  cmd = "ToggleTerm",
  keys = {
    { "<C-\\>", "<cmd>ToggleTerm<cr>", desc = "切换终端" },
  },
  config = function()
    require("toggleterm").setup({
      size = 15,
      open_mapping = "<C-\\>",
      direction = "horizontal",
    })
  end,
},

{
  "MeanderingProgrammer/render-markdown.nvim",
  ft = { "markdown" },
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {},
},

{
  "iamcco/markdown-preview.nvim",
  ft = { "markdown" },
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && npm install",},


{
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- ASCII 艺术标题
    dashboard.section.header.val = {
      "  ██╗     ███████╗███████╗    ██╗   ██╗██╗███╗   ███╗",
      "  ██║     ██╔════╝██╔════╝    ██║   ██║██║████╗ ████║",
      "  ██║     █████╗  █████╗      ██║   ██║██║██╔████╔██║",
      "  ██║     ██╔══╝  ██╔══╝      ╚██╗ ██╔╝██║██║╚██╔╝██║",
      "  ███████╗███████╗███████╗     ╚████╔╝ ██║██║ ╚═╝ ██║",
      "  ╚══════╝╚══════╝╚══════╝      ╚═══╝  ╚═╝╚═╝     ╚═╝",
    }

    -- Header: 水平居中 + 高亮颜色
    dashboard.section.header.opts = {
      position = "center",
      hl = "Keyword",
    }

    dashboard.section.buttons.val = {
      dashboard.button("e", "     新建文件", ":ene <BAR> startinsert<CR>"),
      dashboard.button("f", "     查找文件", ":Telescope find_files<CR>"),
      dashboard.button("r", "     最近文件", ":Telescope oldfiles<CR>"),
      dashboard.button("g", "     全文搜索", ":Telescope live_grep<CR>"),
      dashboard.button("o", "     文件树", ":Neotree<CR>"),
      dashboard.button("c", "     打开 Claude", ":ClaudeCode<CR>"),
      dashboard.button("m", "     LSP 管理", ":Mason<CR>"),
      dashboard.button("p", "     插件管理", ":Lazy<CR>"),
      dashboard.button("q", "     退出", ":qa<CR>"),
    }

    -- Buttons: 水平居中
    dashboard.section.buttons.opts = {
      position = "center",
      spacing = 1,
    }

    -- Footer: 水平居中
    dashboard.section.footer.opts = {
      position = "center",
      hl = "Comment",
    }

    -- 垂直布局: 顶部留足够空白，让内容整体居中
    local top_padding = math.max(2, math.floor(vim.fn.winheight(0) * 0.18))
    dashboard.opts.layout = {
      { type = "padding", val = top_padding },
      dashboard.section.header,
      { type = "padding", val = 3 },
      dashboard.section.buttons,
      { type = "padding", val = 1 },
      dashboard.section.footer,
    }

    -- 启动后更新 footer 显示时间
    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      callback = function()
        dashboard.section.footer.val = {
          "    " .. vim.fn.strftime("%Y-%m-%d %H:%M"),
        }
        pcall(vim.cmd, "AlphaRedraw")
      end,
    })

    alpha.setup(dashboard.opts)
  end,
},

{
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  cmd = "ClaudeCode",
  config = true,
  keys = {
    { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "打开/关闭 Claude" },
    { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "聚焦 Claude" },
    { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "恢复 Claude" },
    { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "发送到 Claude" },
    { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "添加当前文件" },
    { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "接受差异" },
    { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "拒绝差异" },
  },
},
})
