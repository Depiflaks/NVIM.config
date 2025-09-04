require("lazy").setup({
  { "nvim-lualine/lualine.nvim" },
  { 
    "catppuccin/nvim", 
    name = "catppuccin", 
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "macchiato", -- mocha, latte, frappe, macchiato
        transparent_background = false,
      })
    end
  },
  { "neovim/nvim-lspconfig" },
  {
    "SmiteshP/nvim-navic",
    dependencies = {
      "neovim/nvim-lspconfig"
    },
    config = function()
      require("nvim-navic").setup({
        highlight = true,
        separator = " → ",
        depth_limit = 0,
      })
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "cpp", "c", "lua", "vim", "bash", "markdown", "markdown_inline" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "FzfLua",
    config = function()
      require("fzf-lua").setup({})
    end,
  },
  {
    "shortcuts/no-neck-pain.nvim",
    version = "*",
    cmd = "NoNeckPain",
    config = function()
      require("no-neck-pain").setup({
        width = 100,
      })
    end,
    autocmds = {
      enableOnVimEnter = false,
      enableOnTabEnter = false,
      reloadOnColorSchemeChange = true,
    },
  },
  {
    "machakann/vim-highlightedyank",
    "tpope/vim-commentary",
    --"tpope/vim-surround",
  },
  {
    "chentoast/marks.nvim",
    config = true,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup()
    end,
    keys = {
      {
        "<leader>rn",
        function()
          return ":IncRename " .. vim.fn.expand("<cword>")
        end,
        expr = true,
        desc = "LSP Rename (in-place)",
      },
    },
  },
  {
    "saghen/blink.cmp",
    version = "*",
    dependencies = {
      "rafamadriz/friendly-snippets",
      "saghen/blink.compat",
    },
    event = "InsertEnter",
    opts = {
      snippets = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = "mono",
      },
    },
    config = function(_, opts)
      require("blink.cmp").setup({
        sources = {
          default = { 
            "lsp", 
            "path", 
            "snippets", 
            "buffer",
          },
        },
        keymap = {
          ["<A-n>"] = { "select_next" },
          ["<A-p>"] = { "select_prev" },
          ["<A-y>"] = { "accept" },
        },
        completion = {
          autocomplete = {
            { "TextChanged", min_len = 1 },
            { "InsertEnter",  min_len = 1 },
          },
          signature = { enabled = true },
        },
        cmdline = {
          enabled = true,
        }
      })
    end,
  }, 
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      local npairs = require("nvim-autopairs")
      npairs.setup({})
      npairs.add_rule(require("nvim-autopairs.rule")("|", "|", "cpp"))

      local ok, blink = pcall(require, "blink.compat")
      if ok then
        blink.setup()
      end
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    -- config = function()
    --   require("mason-lspconfig").setup({
    --     ensure_installed = { "clangd" }
    --   })
    -- end,
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "Saecki/crates.nvim", -- Для C++ можно адаптировать
    event = { "BufRead Cargo.toml" },
    config = function()
      require("crates").setup()
    end,
  },
  {
   "nmac427/guess-indent.nvim",
    config = function()
      require("guess-indent").setup({
        override_editorconfig = false,
        on_tab_options = {
          ["expandtab"] = false,
        },
        on_space_options = {
          ["expandtab"] = true,
          ["tabstop"] = "detected",
          ["softtabstop"] = "detected",
          ["shiftwidth"] = "detected",
        },
      })
    end,
  },
  {
    "matze/vim-move",
    event = "VeryLazy",
  },
  { 
    'fedepujol/move.nvim',
    config = function()
      require('move').setup({
        line = {
            enable = true, -- Enables line movement
            indent = true  -- Toggles indentation
        },
        block = {
            enable = true, -- Enables block movement
            indent = true  -- Toggles indentation
        },
        word = {
            enable = true, -- Enables word movement
        },
        char = {
            enable = false -- Enables char movement
        },
      })
    end,
  },
  { "chrisgrieser/nvim-spider", lazy = true },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash jump" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    }
  }, 
  {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
  }
})
vim.g.highlightedyank_highlight_duration = 300
vim.cmd.colorscheme "catppuccin"
