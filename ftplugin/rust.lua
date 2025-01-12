local dap = require("dap")

dap.adapters.codelldb = {
  type = "executable",
  command = "/home/ralvescosta/.lldb/extension/adapter/codelldb", -- or if not in $PATH: "/absolute/path/to/codelldb"
}

dap.configurations.rust = {
  {
    name = "Launch",
    type = "codelldb",
    request = "launch",
    cwd = "${workspaceFolder}",
    program = "${file}",
    args = { "" },
    env = {
      ENVIRONMENT = function()
        return "dev"
      end,
      LOG_LEVEL = function()
        return "trace"
      end,
    }
  }
}
