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
  { "felipec/vim-sanegx", event = "BufRead" },
  { "tpope/vim-repeat" },

  { "ThePrimeagen/harpoon" },

  {
    "phaazon/hop.nvim",
    branch = "v2",
    config = function()
      require("hop").setup()
    end
  },

  -- {
  --   "nvim-telescope/telescope-frecency.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim",
  --     "kkharji/sqlite.lua"
  --   },
  --   config = function()
  --     require("telescope").load_extension("frecency")
  --   end,
  -- },

  {
    "AckslD/nvim-trevJ.lua",
    config = 'require("trevj").setup()',
    init = function()
      vim.keymap.set("n", "<leader>j", function()
        require("trevj").format_at_cursor()
      end)
    end,
  },
}

lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "frecency")
end
