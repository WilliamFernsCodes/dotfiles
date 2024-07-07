local refactor_with_args = require "custom.custom_functions".refactor_with_args
local M = {}

M.navigation = {
  n = {
    ['C-h'] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ['C-l'] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ['C-j'] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ['C-k'] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
  }
}

M.formatting = {
  n = {
    ["<leader>fpf"] = {
      function()
        local current_file = vim.api.nvim_buf_get_name(0)
        if string.match(current_file, "%.py$") then
          vim.cmd("!black -l 79 " .. current_file)
        else
          print("Not a Python file!")
        end
      end,
      "Format current Python file",
    },
    ["<leader>fpd"] = {
      function()
        local current_dirend = vim.fn.expand("%:p:h")
        -- Call black on the directory
        vim.cmd("!black -l 79 " .. current_dirend)
      end,
      "Format current Python directory",
    },
  },
}

M.refactoring = {
  n = {
    ["<leader>ri"] = {
      function()
        refactor_with_args("Refactor inline_var")
      end,
      "Refactor inline_var"
    },
    ["<leader>rI"] = {
      function()
        refactor_with_args("Refactor inline_func")
      end,
      "Refactor inline_func"
    },
    ["<leader>rb"] = {
      function()
        refactor_with_args("Refactor extract_block")
      end,
      "Refactor extract_block"
    },
    ["<leader>rbf"] = {
      function()
        refactor_with_args("Refactor extract_block_to_file")
      end,
      "Refactor extract_block_to_file"
    },
    ["<leader>rpf"] = {
      function()
        require('refactoring').debug.printf({below = true})
      end,
      "Printf: Automated insertion of print statement to mark the calling of a function"
    },
    ["<leader>pv"] = {
      function()
        require('refactoring').debug.print_var()
      end,
      "Print Variable"
    },
    ["<leader>rc"] = {
      function()
        require('refactoring').debug.cleanup({})
      end,
      "Clean up print statements"
    },
  },
  x = {
    ["<leader>re"] = {
      function()
        refactor_with_args("Refactor extract")
      end,
      "Refactor extract"
    },
    ["<leader>rf"] = {
      function()
        refactor_with_args("Refactor extract_to_file")
      end,
      "Refactor extract_to_file"
    },
    ["<leader>rv"] = {
      function()
        refactor_with_args("Refactor extract_var")
      end,
      "Refactor extract_var"
    },
    ["<leader>ri"] = {
      function()
        refactor_with_args("Refactor inline_var")
      end,
      "Refactor inline_var"
    },
    ["<leader>pv"] = {
      function()
        require('refactoring').debug.print_var()
      end,
      "Print Variable"
    },
  }
}

M.harpoon = {
  n = {
    ["<leader>a"] = {
      function()
        require("harpoon.mark").add_file()
      end,
      "Mark file"
    },
    ["<C-e>"] = {
      function()
        require('harpoon.ui').toggle_quick_menu()
      end,
      "Toggle UI"
    },
    ["<leader>1"] = {
      function()
        require('harpoon.ui').nav_file(1)
      end,
      "Go to file 1"
    },
    ["<leader>2"] = {
      function()
        require('harpoon.ui').nav_file(2)
      end,
      "Go to file 2"
    },
    ["<leader>3"] = {
      function()
        require('harpoon.ui').nav_file(3)
      end,
      "Go to file 3"
    },
    ["<leader>4"] = {
      function()
        require('harpoon.ui').nav_file(4)
      end,
      "Go to file 4"
    },
  }
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>dbc"] = {
      function()
        require('persistent-breakpoints.api').clear_all_breakpoints()
      end,
      "Clear All Breakpoints"
    },
    ["<leader>dcb"] = {
      function()
        require('persistent-breakpoints.api').set_conditional_breakpoint()
      end,
      "Toggle conditional breakpoint"
    },
    ["<leader>dbb"] = {
      function()
        require('persistent-breakpoints.api').toggle_breakpoint()
      end,
      "DapToggleBreakpoint"
    },
    ["<leader>dcc"] = {
      function()
        vim.cmd("DapContinue")
      end,
      "DapContinue"
    },
    ["<leader>dh"] = {
      function()
        vim.cmd("DapToggleHover")
      end,
      "DapToggleHover"
    },
    ["<leader>di"] = {
      function()
        vim.cmd("DapStepInto")
      end,
      "DapStepInto"
    },
    ["<leader>do"] = {
      function()
        vim.cmd("DapStepOut")
      end,
      "DapStepOut"
    },
    ["<leader>dr"] = {
      function()
        vim.cmd("DapRestart")
      end,
      "DapRestart"
    },
    ["<leader>dt"] = {
      function()
        vim.cmd("DapToggle")
      end,
      "DapToggle"
    },
    ["<leader>du"] = {
      function()
        vim.cmd("DapRunToCursor")
      end,
      "DapRunToCursor"
    },
    ["<leader>dx"] = {
      function()
        vim.cmd("DapTerminate")
      end,
      "DapTerminate"
    }
  }
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require("dap-python").test_method()
      end,
      "DapPythonRun"
    },
  }
}

M.telescope = {
  n = {
    ["<leader>rr"] = {
      function()
        require('telescope').extensions.refactoring.refactors()
      end,
      "TelescopeRefactoringTool"
    }
  },
  s = {
    ["<leader>rr"] = {
      function()
        require('telescope').extensions.refactoring.refactors()
      end,
      "TelescopeRefactoringTool"
    }
  }
}

return M
