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
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    opts = {
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
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = { "clangd" },
    },
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
  "lervag/vimtex",
  lazy = false,
  ft = { "tex", "bib", "latex" },
  init = function()
    vim.g.vimtex_view_method = "general"
    vim.g.tex_flavor = "latex"
    vim.g.vimtex_quickfix_mode = 0
    vim.g.vimtex_compiler_latexmk = {
      out_dir = "build",
    }
  end,
},

{
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
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
