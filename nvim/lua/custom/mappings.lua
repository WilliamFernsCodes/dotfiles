local command_with_args = require "custom.custom_functions".command_with_args
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
        command_with_args("Refactor inline_var")
      end,
      "Refactor inline_var"
    },
    ["<leader>rI"] = {
      function()
        command_with_args("Refactor inline_func")
      end,
      "Refactor inline_func"
    },
    ["<leader>rb"] = {
      function()
        command_with_args("Refactor extract_block")
      end,
      "Refactor extract_block"
    },
    ["<leader>rbf"] = {
      function()
        command_with_args("Refactor extract_block_to_file")
      end,
      "Refactor extract_block_to_file"
    },
    ["<leader>rpf"] = {
      function()
        require('refactoring').debug.printf({ below = true })
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
        command_with_args("Refactor extract")
      end,
      "Refactor extract"
    },
    ["<leader>rf"] = {
      function()
        command_with_args("Refactor extract_to_file")
      end,
      "Refactor extract_to_file"
    },
    ["<leader>rv"] = {
      function()
        command_with_args("Refactor extract_var")
      end,
      "Refactor extract_var"
    },
    ["<leader>ri"] = {
      function()
        command_with_args("Refactor inline_var")
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
    ["<leader>dso"] = {
      function()
        vim.cmd("DapStepOver")
      end,
      "DapStepOver"
    },
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
    ["<leader>dut"] = {
      function()
        vim.cmd("DapToggle")
        require("dapui").toggle()
      end,
      "Dap UI Toggle"
    },
    ["<leader>drc"] = {
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

M.smart_splits = {
  n = {
    ['<A-h>'] = {
      function()
        require('smart-splits').resize_left()
      end,
      "Resize Left"
    },
    ['<A-j>'] = {
      function()
        require('smart-splits').resize_down()
      end,
      "Resize Down"
    },
    ['<A-k>'] = {
      function()
        require('smart-splits').resize_up()
      end,
      "Resize Up"
    },
    ['<A-l>'] = {
      function()
        require('smart-splits').resize_right()
      end,
      "Resize Right"
    },
    ['<C-h>'] = {
      function()
        require('smart-splits').move_cursor_left()
      end,
      "Move Cursor Left"
    },
    ['<C-j>'] = {
      function()
        require('smart-splits').move_cursor_down()
      end,
      "Move Cursor Down"
    },
    ['<C-k>'] = {
      function()
        require('smart-splits').move_cursor_up()
      end,
      "Move Cursor_up"
    },
    ['<C-l>'] = {
      function()
        require('smart-splits').move_cursor_right()
      end,
      "Move Cursor_right"
    },
    ['<C-\\>'] = {
      function()
        require('smart-splits').move_cursor_previous()
      end,
      "Move Cursor Previous"
    },
    ['<leader><leader>h'] = {
      function()
        require('smart-splits').swap_buf_left()
      end,
      "Swap Buf Left"
    },
    ['<leader><leader>j'] = {
      function()
        require('smart-splits').swap_buf_down()
      end,
      "Swap Buf Down"

    },
    ['<leader><leader>k'] = {
      function()
        require('smart-splits').swap_buf_up()
      end,
      "Swap Buf Up"
    },
    ['<leader><leader>l'] = {
      function()
        require('smart-splits').swap_buf_right()
      end,
      "Swap Buf Right"
    }
  }
}

M.splits = {
  n = {
    ["<leader>%"] = {
      " <cmd> vsp<CR>", "Split vertically",
    },
    ['<leader>"'] = {
      " <cmd> sp<CR>", "Split horizontally",
    }
  }
}

M.windows = {
  n = {
    ["<leader>w="] = {
      " <cmd> wincmd =<CR>", "Windows Equal",
    },
    ['<leader>wf'] = {
      function()
        vim.cmd("wincmd _")
        vim.cmd("wincmd |")
      end,
      "Split horizontally",
    }
  }
}

M.dap_widgets = {
  n = {
    ["<leader>dh"] = {
      function()
        require('dap.ui.widgets').hover()
        -- make so that when I press "esc", it closes the widget
        vim.api.nvim_buf_set_keymap(0, "n", "<esc>", "<cmd>q!<CR>", { noremap = true, silent = true })
        -- do the same for <C-c>
        vim.api.nvim_buf_set_keymap(0, "n", "<C-c>", "<cmd>q!<CR>", { noremap = true, silent = true })
      end,
      "DapHover"
    }
  }
}

M.glow = {
  n = {
    ["<leader>mp"] = {
      function()
        local filename = string.gsub(vim.fn.expand("%"), " ", "\\ ")
        local command = "Glow " .. filename
        print("Running command: " .. command)
        vim.cmd(command)
      end,
      "Glow Preview Current Markdown File"
    },
  }
}

M.wrap_lines = {
  n = {
    ["<leader>tw"] = {
      function()
        -- ignore lua_ls "undefined field "get""
        -- @diagnostic disable-next-line
        local is_wrap = vim.opt.wrap:get()
        if is_wrap then
          vim.opt.wrap = false
        else
          vim.opt.wrap = true
        end
      end,
      "Toggle Line Wrap",
    },
    ["<leader>wtw"] = {
      function()
        -- ignore linting "undefined field get"
        -- @diagnostic disable-next-line
        local is_wrap = vim.opt.wrap:get()
        if is_wrap then
          -- set wrapping to false for all windows
          vim.cmd("windo set nowrap")
        else
          vim.cmd("windo set wrap")
        end
      end,
      "Toggle Line Wrap All Windows",
    },
  }
}

M.obsidian = {
  n = {
    ["ogf"] = {
      function()
        return require("obsidian").util.gf_passthrough()
      end,
      "Go to File/Link - Obsidian"
    },
    -- Toggle check-boxes.
    ["<leader>oct"] = {
      function()
        return require("obsidian").util.toggle_checkbox()
      end,
      "Toggle Checkbox - Obsidian"
    },
    ["<leader>odn"] = {
      "<cmd> ObsidianToday<CR>",
      "Obsidian Daily Note (Today)"
    },
    ["<leader>oyn"] = {
      "<cmd> ObsidianYesterday<CR>",
      "Open Yesterday's Note"
    },
    ["<leader>ont"] = {
      "<cmd> ObsidianTomorrow<CR>",
      "Obsidian Note Tomorrow"
    },
    ["<leader>ofl"] = {
      "<cmd> ObsidianFollowLink<CR>",
      "Obsidian Follow Link"
    },
    ["<leader>don"] = {
      function()
        command_with_args("ObsidianDailies")
      end,
      "ObsidianDailies (Specify Offset)"
    },
    ["<leader>onn"] = {
      function()
        command_with_args("ObsidianNew")
      end,
      "Obsidian New Note (Specify Note Path)"
    },
    ["<leader>otn"] = {
      function()
        command_with_args("ObsidianNewFromTemplate")
      end,
      "Obsidian New Note From Template (Specify New Note Path)"
    },
    ["<leader>ooa"] = {
      function()
        command_with_args("ObsidianOpen")
      end,
      "Obsidian Open App (Specify Query)"
    },
    ["<leader>opi"] = {
      function()
        command_with_args("ObsidianPasteImg")
      end,
      "Obsidian Paste Image (Specify Image Name)"
    },
    ["<leader>orn"] = {
      function()
        command_with_args("ObsidianRename")
      end,
      "Obsidian Rename (Specify New Name)"
    },
    ["<leader>otc"] = {
      "<cmd> ObsidianTOC<CR>",
      "Obsidian Table of Contents"
    },
    ["<leader>oat"] = {
      function()
        command_with_args("ObsidianTags")
      end,
      "Obsidian Tags (Specify Tag Name)"
    },
    ["<leader>oit"] = {
      function()
        command_with_args("ObsidianTemplate")
      end,
      "Obsidian Insert Template (Specify Template Name)"
    },
    ["<leader>ow"] = {
      function()
       command_with_args("ObsidianWorkspace")
      end,
      "Obsidian Workspace (Specify Workspace Name)"
    }
  },

  x = {
    ["<leader>obl"] = {
      "<cmd> ObsidianLink<CR>",
      "ObsidianBindLink"
    },
    ["<leader>oln"] = {
      function()
        command_with_args("ObsidianLinkNew")
      end,
      "Obsidian New Link (Specify Note Name)"
    },
    ["<leader>oxn"] = {
      function()
        command_with_args("ObsidianExtractNote")
      end,
      "Obsidian Extract Note (Specify Note Name)"
    },
  }

}

return M
