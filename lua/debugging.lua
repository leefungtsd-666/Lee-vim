local M = {}
function M.setup()
  local dap = require("dap")
  local function default_python()
    local windows = vim.fn.has("win32") == 1
    for _, prefix in ipairs({ vim.env.VIRTUAL_ENV or "", vim.env.CONDA_PREFIX or "", vim.fn.getcwd() .. "/.venv" }) do
      if prefix ~= "" then
        local path = prefix .. (windows and "/Scripts/python.exe" or "/bin/python")
        if windows and vim.fn.executable(path) ~= 1 then path = prefix .. "/python.exe" end
        if vim.fn.executable(path) == 1 then return path end
      end
    end
    return vim.fn.exepath("python") ~= "" and vim.fn.exepath("python") or vim.fn.exepath("python3")
  end
  dap.adapters.python = function(callback, config)
    callback({
      type = "executable",
      command = config.pythonPath,
      args = { "-m", "debugpy.adapter" },
    })
  end
  dap.configurations.python = {
    {
      type = "python",
      request = "launch",
      name = "Python：调试当前文件",
      program = "${file}",
      cwd = "${workspaceFolder}",
      pythonPath = function()
        return vim.fn.input("Python 路径（需安装 debugpy）: ", default_python(), "file")
      end,
      console = "internalConsole",
      justMyCode = true,
    },
  }
  -- Ctrl+数字/符号需要终端支持；leader 键位作为通用备用。
  local function map_debug(keys, action, desc)
    for _, key in ipairs(keys) do
      vim.keymap.set("n", key, action, { desc = desc })
    end
  end
  map_debug({ "<C-5>", "<leader>dc" }, dap.continue, "调试：启动/继续")
  map_debug({ "<C-9>", "<leader>db" }, dap.toggle_breakpoint, "调试：切换断点")
  map_debug({ "<C-0>", "<leader>dn" }, dap.step_over, "调试：执行下一行")
  map_debug({ "<C-->", "<leader>di" }, dap.step_into, "调试：进入函数")
  map_debug({ "<C-=>", "<leader>do" }, dap.step_out, "调试：退出当前函数")
  vim.keymap.set("n", "<leader>dr", dap.repl.toggle, { desc = "调试：打开/关闭交互窗口" })
  vim.keymap.set("n", "<leader>dq", dap.terminate, { desc = "调试：结束" })
  vim.keymap.set("n", "<leader>dx", dap.clear_breakpoints, { desc = "调试：清空所有断点" })
  vim.keymap.set("n", "<leader>dv", require("dap.ui.widgets").hover, { desc = "调试：查看光标变量" })
  vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DiagnosticError" })
  vim.fn.sign_define("DapStopped", { text = "▶", texthl = "DiagnosticWarn", linehl = "Visual" })
end
return M