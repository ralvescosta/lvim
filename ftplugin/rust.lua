local dap = require("dap")

local mason_registry = require("mason-registry")
local codelldb = mason_registry.get_package("codelldb")
local extension_path = codelldb:get_install_path() .. "/extension/"
local codelldb_path = extension_path .. "adapter/codelldb"

dap.adapters.codelldb = {
  type = "executable",
  command = codelldb_path,
}

dap.configurations.rust = {
  {
    name = "Launch",
    type = "codelldb",
    request = "launch",
    cwd = "${workspaceFolder}",
    program = function()
      local cwd = vim.fn.getcwd()
      return cwd .. "/target/debug/" .. vim.fn.fnamemodify(cwd, ":t")
    end,
    args = { "" },
    env = {
      ENVIRONMENT = function()
        return "dev"
      end,
      LOG_LEVEL = function()
        return "trace"
      end,
    },
    preLaunchTask = function()
      -- Run `cargo build` before launching the debugger
      local handle = vim.fn.jobstart("cargo build", {
        stdout_buffered = true,
        stderr_buffered = true,
        on_stdout = function(_, data)
          if data then
            vim.schedule(function()
              print(table.concat(data, "\n"))
            end)
          end
        end,
        on_stderr = function(_, data)
          if data then
            vim.schedule(function()
              vim.api.nvim_err_writeln(table.concat(data, "\n"))
            end)
          end
        end,
        on_exit = function(_, exit_code)
          if exit_code ~= 0 then
            vim.api.nvim_err_writeln("Cargo build failed!")
          end
        end,
      })

      if handle <= 0 then
        vim.api.nvim_err_writeln("Failed to start cargo build!")
      end
    end,
  }
}
