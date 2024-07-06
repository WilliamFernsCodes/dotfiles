local M = {}

local function refactor_with_args(command)
  -- Prompt for user input
  local args = vim.fn.input("Arguments: ")
  -- Execute the command with the provided arguments
  vim.cmd(command .. " " .. args)
end

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
    ["<leader>ri"] = { function() refactor_with_args("Refactor inline_var") end, "Refactor inline_var" },
    ["<leader>rI"] = { function() refactor_with_args("Refactor inline_func") end, "Refactor inline_func" },
    ["<leader>rb"] = { function() refactor_with_args("Refactor extract_block") end, "Refactor extract_block" },
    ["<leader>rbf"] = { function() refactor_with_args("Refactor extract_block_to_file") end, "Refactor extract_block_to_file" },
  },
  x = {
    ["<leader>re"] = { function() refactor_with_args("Refactor extract") end, "Refactor extract" },
    ["<leader>rf"] = { function() refactor_with_args("Refactor extract_to_file") end, "Refactor extract_to_file" },
    ["<leader>rv"] = { function() refactor_with_args("Refactor extract_var") end, "Refactor extract_var" },
    ["<leader>ri"] = { function() refactor_with_args("Refactor inline_var") end, "Refactor inline_var" },
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


local function toggle_breakpoint()
  local width = 30
  local height = 1
  local buf = vim.api.nvim_create_buf(false, true)
  local win = require("plenary.popup").create(buf, {
    title = 'Enter breakpoint condition',
    highlight = 'Normal',
    line = math.floor((vim.o.lines - height) / 2),
    col = math.floor((vim.o.columns - width) / 2),
    minwidth = width,
    minheight = height,
    border = {},
  })

  local function close_popup()
    vim.api.nvim_win_close(win, true)
    vim.api.nvim_buf_delete(buf, { force = true })
  end

  vim.api.nvim_buf_set_option(buf, 'modifiable', true)
  vim.api.nvim_buf_set_option(buf, 'buftype', 'prompt')
  vim.fn.prompt_setprompt(buf, 'Condition: ')

  vim.api.nvim_buf_set_keymap(buf, 'i', '<CR>', '', {
    noremap = true,
    callback = function()
      local input = vim.api.nvim_buf_get_lines(buf, 0, 1, false)[1]
      close_popup()
      require("dap").toggle_breakpoint("'" .. input .. "'")
    end,
  })

  vim.api.nvim_buf_set_keymap(buf, 'n', '<ESC>', '', {
    noremap = true,
    callback = close_popup,
  })

  vim.cmd('startinsert')
end


M.dap = {
  plugin = true,
  n = {
    ["<leader>cbd"] = {
      function()
        toggle_breakpoint()
      end,
      "Toggle conditional breakpoint"
    },
    ["<leader>db"] = {
      function()
        vim.cmd("DapToggleBreakpoint")
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
    ["<leader>ds"] = {
      function()
        vim.cmd("DapStart")
      end,
      "DapStart"
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
