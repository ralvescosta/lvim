lvim.plugins = {
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },

  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end
  },

  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    config = function()
      require("persistence").setup({
        dir = vim.fn.expand(vim.fn.stdpath "state" .. "/sessions/"),
        options = { "buffers", "curdir", "tabpages", "winsize" }
      })
    end
  },

  { "tpope/vim-surround" },
  { "felipec/vim-sanegx",  event = "BufRead" },
  { "tpope/vim-repeat" },

  { "ThePrimeagen/harpoon" },

  {
    "phaazon/hop.nvim",
    branch = "v2",
    config = function()
      require("hop").setup()
    end
  },

  {
    "AckslD/nvim-trevJ.lua",
    config = 'require("trevj").setup()',
    init = function()
      vim.keymap.set("n", "<leader>j", function()
        require("trevj").format_at_cursor()
      end)
    end,
  },

  {
    "leoluz/nvim-dap-go",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
  },

  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      {
        "nvim-neotest/neotest-go",
        dependencies = {
          "leoluz/nvim-dap-go",
        }
      },
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-go"),
        },
      })
    end,
  },
}

lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "frecency")
end
