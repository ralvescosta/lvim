-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

local dap = require("dap")

dap.adapters.delve = function(callback, config)
  if config.mode == 'remote' and config.request == 'attach' then
    callback({
      type = 'server',
      host = config.host or '127.0.0.1',
      port = config.port or '38697'
    })
  else
    callback({
      type = 'server',
      port = '${port}',
      executable = {
        command = 'dlv',
        args = { 'dap', '-l', '127.0.0.1:${port}', '--log', '--log-output=dap' },
        detached = vim.fn.has("win32") == 0,
      }
    })
  end
end

dap.configurations.go = {
  {
    name = "Launch Default Go",
    type = "delve",
    request = "launch",
    -- mode = "test",
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
  },
  -- Add more configs as you need
}

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
