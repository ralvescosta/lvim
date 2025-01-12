-- Toggle the summary panel
vim.keymap.set("n", "<leader>ts", function()
  require("neotest").summary.toggle()
end)

-- Run the nearest test to the cursor
vim.keymap.set("n", "<leader>tr", function()
  require("neotest").run.run()
end)

-- Run the entire file
vim.keymap.set("n", "<leader>tf", function()
  require("neotest").run.run(vim.fn.expand("%"))
end)

-- Debug the nearest test (requires nvim-dap + adapter support)
vim.keymap.set("n", "<leader>td", function()
  require("neotest").run.run({ suite = false, strategy = "dap" })
end)

-- Jump to the next failed test
vim.keymap.set("n", "]t", function()
  require("neotest").jump.next({ status = "failed" })
end)

-- Jump to the previous failed test
vim.keymap.set("n", "[t", function()
  require("neotest").jump.prev({ status = "failed" })
end)

-- local dap = require("dap")

-- dap.adapters.delve = function(callback, config)
--   if config.mode == 'remote' and config.request == 'attach' then
--     callback({
--       type = 'server',
--       host = config.host or '127.0.0.1',
--       port = config.port or '38697'
--     })
--   else
--     callback({
--       type = 'server',
--       port = '${port}',
--       executable = {
--         command = 'dlv',
--         args = { 'dap', '-l', '127.0.0.1:${port}', '--log', '--log-output=dap' },
--         detached = vim.fn.has("win32") == 0,
--       }
--     })
--   end
-- end

-- dap.configurations.go = {
--   {
--     name = "Launch Default Go",
--     type = "delve",
--     request = "launch",
--     -- mode = "test",
--     cwd = "${workspaceFolder}",
--     program = "${file}",
--     args = { "" },
--     env = {
--       ENVIRONMENT = function()
--         return "dev"
--       end,
--       LOG_LEVEL = function()
--         return "trace"
--       end,
--     }
--   },
--   -- Add more configs as you need
-- }
