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

require("dap-go").setup({
  dap_configurations = {
    {
      type = "go",
      name = "main.go with Arguments",
      request = "launch",
      program = "${workspaceFolder}/main.go",
      args = require("dap-go").get_arguments,
      env = {
        SOME_VAR = "value",
      },
    },
  },
})
