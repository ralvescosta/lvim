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
