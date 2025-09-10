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
          keyword = {range = 'prefix'}
        },
        signature = { enabled = true },
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
  {
    "theHamsta/nvim_rocks"
  },
  { 
    "chrisgrieser/nvim-spider", 
    lazy = true,
    -- dependencies = {
    -- 	"theHamsta/nvim_rocks",
    -- 	build = "/home/smmm/.config/nvim/venv/bin/pip3 install hererocks && /home/smmm/.config/nvim/venv/bin/python3 -mhererocks . -j2.1.0-beta3 -r3.0.0 && cp nvim_rocks.lua lua",
    -- 	config = function() require("nvim_rocks").ensure_installed("luautf8") end,
    -- },
  },
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
  },
  {
    "Pocco81/auto-save.nvim",
    event = "VeryLazy",
    config = function()
      require('auto-save').setup({
        enabled = true,
        execution_message = {
          message = function()
            return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
          end,
          dim = 0.18, 
          cleaning_interval = 1000, 
        },
        trigger_events = {"InsertLeave", "TextChanged"},
        condition = function(buf)
          local fn = vim.fn
          local utils = require("auto-save.utils.data")

          if
            fn.getbufvar(buf, "&modifiable") == 1 and
            utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
            return true -- met condition(s), can save
          end
          return false -- can't save
        end,
        write_all_buffers = false, -- write all buffers when the current one meets `condition`
        debounce_delay = 135, -- saves the file at most every `debounce_delay` milliseconds
        callbacks = { -- functions to be executed at different intervals
          enabling = nil, -- ran when enabling auto-save
          disabling = nil, -- ran when disabling auto-save
          before_asserting_save = nil, -- ran before checking `condition`
          before_saving = nil, -- ran before doing the actual save
          after_saving = nil -- ran after doing the actual save
        }
      })
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    config = function()
      require("neo-tree").setup({
        window = {
          position = "float", 
          mapping_options = {
            noremap = true,
            nowait = true,
          },
        mappings = {
          ["<space>"] = {
            "toggle_node",
            nowait = false,
          },
          ["<2-LeftMouse>"] = "open",
          ["<cr>"] = "open",
          ["<esc>"] = "cancel", -- close preview or floating neo-tree window
          ["P"] = {
            "toggle_preview",
            config = {
              use_float = true,
              use_snacks_image = true,
              use_image_nvim = true,
            },
          },
          -- Read `# Preview Mode` for more information
          ["l"] = "focus_preview",
          ["S"] = "open_split",
          ["s"] = "open_vsplit",
          -- ["S"] = "split_with_window_picker",
          -- ["s"] = "vsplit_with_window_picker",
          ["t"] = "open_tabnew",
          -- ["<cr>"] = "open_drop",
          -- ["t"] = "open_tab_drop",
          ["w"] = "open_with_window_picker",
          --["P"] = "toggle_preview", -- enter preview mode, which shows the current node without focusing
          ["C"] = "close_node",
          -- ['C'] = 'close_all_subnodes',
          ["z"] = "close_all_nodes",
          ["Z"] = "expand_all_nodes",
          --["Z"] = "expand_all_subnodes",
          ["a"] = {
            "add",
            -- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
            -- some commands may take optional config options, see `:h neo-tree-mappings` for details
            config = {
              show_path = "none", -- "none", "relative", "absolute"
            },
          },
          ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
          ["d"] = "delete",
          ["r"] = "rename",
          ["b"] = "rename_basename",
          ["y"] = "copy_to_clipboard",
          ["x"] = "cut_to_clipboard",
          ["p"] = "paste_from_clipboard",
          ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
          -- ["c"] = {
          --  "copy",
          --  config = {
          --    show_path = "none" -- "none", "relative", "absolute"
          --  }
          --}
          ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
          ["q"] = "close_window",
          ["R"] = "refresh",
          ["?"] = "show_help",
          ["<"] = "prev_source",
          [">"] = "next_source",
          ["i"] = "show_file_details",
          -- ["i"] = {
          --   "show_file_details",
          --   -- format strings of the timestamps shown for date created and last modified (see `:h os.date()`)
          --   -- both options accept a string or a function that takes in the date in seconds and returns a string to display
          --   -- config = {
          --   --   created_format = "%Y-%m-%d %I:%M %p",
          --   --   modified_format = "relative", -- equivalent to the line below
          --   --   modified_format = function(seconds) return require('neo-tree.utils').relative_date(seconds) end
          --   -- }
          -- },
          },
        },
        filesystem = {
          filtered_items = {
            visible = false, -- when true, they will just be displayed differently than normal items
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_hidden = false, 
          },
        },
        buffers = {
          follow_current_file = {
            enabled = true,
            leave_dirs_open = false,
          },
          group_empty_dirs = true,
          show_unloaded = true,
          window = {
            mappings = {
              ["d"] = "buffer_delete",
              ["bd"] = "buffer_delete",
              ["<bs>"] = "navigate_up",
              ["."] = "set_root",
            },
          },
        },
        git_status = {
          window = {
            position = "float",
            mappings = {
              ["A"] = "git_add_all",
              ["gu"] = "git_unstage_file",
              ["gU"] = "git_undo_last_commit",
              ["ga"] = "git_add_file",
              ["gr"] = "git_revert_file",
              ["gc"] = "git_commit",
              ["gp"] = "git_push",
              ["gg"] = "git_commit_and_push",
            },
          },
        },
        close_if_last_window = false,
        enable_git_status = true,
        enable_diagnostics = true,
        open_files_using_relative_paths = false,
        sort_case_insensitive = false,
        sort_function = nil,
      })
    end,
  }
})
vim.g.highlightedyank_highlight_duration = 300
vim.cmd.colorscheme "catppuccin"
vim.cmd("set keymap=russian-jcukenwin")
vim.cmd("set iminsert=0")
vim.cmd("set imsearch=0")
