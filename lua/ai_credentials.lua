local M = {}
local path = vim.fn.stdpath("data") .. "/credentials/deepseek.key"
local cached
local prompting = false

local function normalize(value)
  if type(value) ~= "string" then return nil end
  value = vim.trim(value)
  return value ~= "" and value or nil
end

function M.get()
  if cached then return cached end
  local env_key = normalize(vim.env.DEEPSEEK_API_KEY)
  if env_key then return env_key end
  if vim.fn.filereadable(path) == 1 then
    local ok, lines = pcall(vim.fn.readfile, path)
    if ok then cached = normalize(lines[1]) end
  end
  return cached
end

function M.prompt()
  if prompting then return end
  prompting = true
  vim.ui.input({ prompt = "DeepSeek API Key（留空取消）: " }, function(value)
    prompting = false
    local key = normalize(value)
    if not key then return end
    if key:find("%s") then
      vim.notify("API Key 不能包含空白字符，请运行 :DeepSeekApiKey 重试", vim.log.levels.WARN)
      return
    end
    local ok = pcall(function()
      vim.fn.mkdir(vim.fn.fnamemodify(path, ":h"), "p", 448)
      if vim.fn.writefile({ key }, path) ~= 0 then error("write failed") end
      vim.uv.fs_chmod(path, 384)
    end)
    if not ok then
      vim.notify("无法保存 DeepSeek 密钥，请检查 Neovim 数据目录权限", vim.log.levels.ERROR)
      return
    end
    cached = key
    vim.notify("DeepSeek 密钥已保存到本机，AI 补全已启用")
  end)
end

function M.setup()
  vim.api.nvim_create_user_command("DeepSeekApiKey", M.prompt, { desc = "设置或更换本机 DeepSeek 密钥" })
  local function check()
    vim.schedule(function()
      if #vim.api.nvim_list_uis() > 0 and not M.get() then M.prompt() end
    end)
  end
  if vim.v.vim_did_enter == 1 then
    check()
  else
    vim.api.nvim_create_autocmd("VimEnter", { once = true, callback = check })
  end
end

return M
