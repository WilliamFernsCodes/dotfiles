local overrides = require("custom.configs.overrides")

local plugins = {
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = "mason.nvim",
    cmd = { "DapInstall", "DapUninstall" },
    opts = {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_installation = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
      },
    },
    -- mason-nvim-dap is loaded when nvim-dap loads
    config = function() end,
  },
  {
    'mrjones2014/smart-splits.nvim',
    lazy = false,
  },
  {
    'Weissle/persistent-breakpoints.nvim',
    lazy = false,
    config = function()
      require('persistent-breakpoints').setup {
        save_dir = vim.fn.stdpath('data') .. '/nvim_checkpoints',
        load_breakpoints_event = { "BufReadPost" },
        perf_record = false,
        on_load_breakpoint = nil,
      }
    end
  },
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require('refactoring').setup()
    end,
    lazy = false,
  },
  {
    "olrtg/nvim-emmet",
    config = function()
      vim.keymap.set({ "n", "v" }, '<leader>xe', require('nvim-emmet').wrap_with_abbreviation)
    end,
  },
  {
    'laytan/cloak.nvim',
    lazy = false,
    config = function()
      require('cloak').setup({
        enabled = true,
        cloak_character = '*',
        -- The applied highlight group (colors) on the cloaking, see `:h highlight`.
        highlight_group = 'Comment',
        -- Applies the length of the replacement characters for all matched
        -- patterns, defaults to the length of the matched pattern.
        cloak_length = nil, -- Provide a number if you want to hide the true length of the value.
        -- Whether it should try every pattern to find the best fit or stop after the first.
        try_all_patterns = true,
        -- Set to true to cloak Telescope preview buffers. (Required feature not in 0.1.x)
        cloak_telescope = true,
        -- Re-enable cloak when a matched buffer leaves the window.
        cloak_on_leave = false,
        patterns = {
          {
            -- Match any file starting with '.env'.
            -- This can be a table to match multiple file patterns.
            file_pattern = '.env*',
            -- Match an equals sign and any character after it.
            -- This can also be a table of patterns to cloak,
            -- example: cloak_pattern = { ':.+', '-.+' } for yaml files.
            cloak_pattern = '=.+',
            -- A function, table or string to generate the replacement.
            -- The actual replacement will contain the 'cloak_character'
            -- where it doesn't cover the original text.
            -- If left empty the legacy behavior of keeping the first character is retained.
            replace = nil,
          },
        },
      })
    end
  },
  { 'ThePrimeagen/vim-be-good', lazy = false },
  { 'wakatime/vim-wakatime',    lazy = false },
  {
    'barrett-ruth/live-server.nvim',
    build = 'pnpm add -g live-server',
    cmd = { 'LiveServerStart', 'LiveServerStop' },
    config = function()
      require("live-server").setup()
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.after.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("custom.configs.nvim_dap")
    end,
    dependencies = {
      "rcarriga/nvim-dap-ui",
      -- virtual text for the debugger
      -- {
      --   "theHamsta/nvim-dap-virtual-text",
      --   opts = {},
      -- },
      {
        -- install the vscode-js debug adapter
        "microsoft/vscode-js-debug",
        -- After install, build it and rename the dist to out
        build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
      },
      {
        "mxsdev/nvim-dap-vscode-js",
        config = function()
          ---@diagnostic disable-next-line: missing-fields
          require("dap-vscode-js").setup({
            -- Path of the node executable. Defaults to $NODE_PATH, and then "node"
            -- node_path = "node",
            -- Path to vscode-js-debug installation
            debugger_path = vim.fn.resolve(vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"),

            -- Command to use to launch the debug server. Takes precedence over "node_path" and "debugger_path"
            -- debugger_path = { "js_debug_adapter" },

            -- which adapters to register in nvim-dap
            adapters = {
              "chrome",
              "pwa-node",
              "pwa-chrome",
              "pwa-msedge",
              "pwa-extensionHost",
              "node-terminal",
              "node",
            },

            -- Path for file logging
            -- log_file_path = vim.fn.stdpath("cache") .. "/dap_vscode_js.log",

            -- Logging level for output to file. Set to false to disable logging
            -- log_file_level = false,

            -- Logging level for output to console. Set to false to disable console output
            -- log_console_level = vim.log.levels.DEBUG,
          })
        end,
      },
      {
        "Joakker/lua-json5",
        run = './install.sh',
      }
    },
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
    end
  },
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
    config = function()
      require("custom.configs.fugitive")
    end,
    dependencies = {
      "tpope/vim-rhubarb",
      "tpope/vim-obsession",
      "tpope/vim-unimpaired",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end,
      },
    },
    opts = {
      sources = {
        { name = "copilot",  group_index = 2 },
        { name = "nvim_lsp", group_index = 2 },
        { name = "luasnip",  group_index = 2 },
        { name = "buffer",   group_index = 2 },
        { name = "nvim_lua", group_index = 2 },
        { name = "path",     group_index = 2 },
      },
    },
  },
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    opts = overrides.copilot,
  },
  -- {
  --   'christoomey/vim-tmux-navigator',
  --   lazy = false,
  -- },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  {
    "theprimeagen/harpoon",
  },
  -- {
  --   "jose-elias-alvarez/null-ls.nvim",
  --   event = "VeryLazy",
  --   opts = function()
  --     return require "custom.configs.null-ls"
  --   end,
  -- },
  -- {
  --   "mhartington/formatter.nvim",
  --   event = "VeryLazy",
  --   opts = function()
  --     return require "custom.configs.formatter"
  --   end
  -- },
  -- {
  --   "mfussenegger/nvim-lint",
  --   event = "VeryLazy",
  --   config = function()
  --     require "custom.configs.lint"
  --   end
  -- },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "python-lsp-server",
        "html-lsp",
        "css-lsp",
        "css-variables-language-server",
        "eslint-lsp",
        "prettier",
        "pyright",
        "emmet-language-server",
        "typescript-language-server",
        "tailwindcss-language-server",
        "prisma-language-server",
        "lua-language-server",
        "mypy",
        "ruff",
        "black",
        "debugpy",
      }
    }
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "Pocco81/auto-save.nvim",
    event = { "TextChanged" },
    config = function()
      require("auto-save").setup({})
    end,
  },
  {
    "andweeb/presence.nvim",
    config = function()
      require("presence").setup({
        auto_update = true,
      })
    end,
    lazy = false
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    },
    config = function()
      require('nvim-ts-autotag').setup()
    end,
    event = "VeryLazy"
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup({
        enable = true,            -- Enable this plugin (Can be enabled/disabled later via commands)
        max_lines = 0,            -- How many lines the window should span. Values <= 0 mean no limit.
        min_window_height = 0,    -- Minimum editor window height to enable context. Values <= 0 mean no limit.
        line_numbers = true,
        multiline_threshold = 20, -- Maximum number of lines to show for a single context
        trim_scope = 'outer',     -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        mode = 'cursor',          -- Line used to calculate context. Choices: 'cursor', 'topline'
        -- Separator between context and content. Should be a single character string, like '-'.
        -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
        separator = nil,
        zindex = 20,     -- The Z-index of the context window
        on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
      })
    end
  },
  {
    "Djancyp/better-comments.nvim",
    config = function()
      require("better-comment").Setup({
        tags = {
          {
            name = "TODO",
            fg = "#348ceb",
            bg = "",
            bold = true,
            virtual_text = ""
          },
          {
            name = "?",
            fg = "#905fd4",
            bg = "",
            bold = true,
            virtual_text = ""
          },
          {
            name = "!",
            fg = "#ffcc6c",
            bg = "",
            bold = true,
            virtual_text = ""
          },
        }
      })
    end,
    event = "VeryLazy"
  },
}
return plugins
