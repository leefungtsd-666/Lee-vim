--============================================================================
-- LSP 配置：语言服务器管理 + 自动补全
-- 通过 mason-lspconfig 统一安装和配置所有语言服务器
--============================================================================

-- 1. 计算 capabilities（集成 cmp_nvim_lsp 的补全能力）
local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok_cmp_lsp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if ok_cmp_lsp then
  capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

-- 2. mason-lspconfig：自动安装并配置语言服务器
local ok_mlsp, mason_lspconfig = pcall(require, "mason-lspconfig")
if ok_mlsp then
  -- Pyright 原生简体中文诊断：在 LSP initialize 请求中发送 locale。
  -- 使用当前 Neovim API，在 Mason 自动启用服务器之前配置。
  vim.lsp.config("pyright", {
    capabilities = capabilities,
    before_init = function(params)
      params.locale = "zh-cn"
    end,
  })
  mason_lspconfig.setup({
    ensure_installed = {
      "lua_ls",        -- Lua / Neovim 配置
      "pyright",       -- Python
      "clangd",        -- C / C++
      "ts_ls",         -- JavaScript / TypeScript
      "rust_analyzer", -- Rust
    },
    automatic_installation = true,
    -- Python 统一使用 Pyright，避免 BasedPyright 重复诊断。
    automatic_enable = { exclude = { "basedpyright" } },
    handlers = {
      -- 默认 handler：对所有语言服务器使用统一的 capabilities
      function(server_name)
        local ok_lspconfig, lspconfig = pcall(require, "lspconfig")
        if not ok_lspconfig then
          return
        end

        -- lua_ls 特殊配置：识别 Neovim API
        if server_name == "lua_ls" then
          lspconfig.lua_ls.setup({
            capabilities = capabilities,
            settings = {
              Lua = {
                runtime = { version = "LuaJIT" },
                diagnostics = { globals = { "vim" } },
                workspace = {
                  library = vim.api.nvim_get_runtime_file("", true),
                  checkThirdParty = false,
                },
                telemetry = { enable = false },
              },
            },
          })
        else
          -- 其他服务器使用默认配置
          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end
      end,
    },
  })
end

-- 3. nvim-cmp 自动补全配置
local ok_cmp, cmp = pcall(require, "cmp")
local ok_luasnip, luasnip = pcall(require, "luasnip")

if ok_cmp then
  vim.opt.completeopt = { "menu", "menuone", "noselect" }

  cmp.setup({
    snippet = {
      expand = function(args)
        if ok_luasnip then
          luasnip.lsp_expand(args.body)
        end
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
      ["<Tab>"] = cmp.mapping.select_next_item(),
      ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    }),
    sources = {
      { name = "nvim_lsp" },
    },
  })
end
