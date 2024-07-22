require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
vim.g.skip_ts_context_commentstring_module = true

vim.o.guicursor = "n-v-c-sm:block,ci-ve:ver25,r-cr-o:hor20,i:block-blinkwait700-blinkoff400-blinkon250-Cursor/lCursor"

require "plugins"

if vim.g.neovide then
  vim.g.neovide_cursor_animation_length = 0.05
  vim.g.neovide_cursor_animate_in_insert_mode = true
  vim.g.neovide_cursor_vfx_mode = "railgun"
  vim.g.neovide_cursor_vfx_opacity = 500.0
  vim.g.neovide_cursor_vfx_particle_density = 10
  vim.o.guifont = "Source Code Pro:h12" -- text below applies for VimScript
end

-- Function to incrementally resize windows while keys are held down
local function resize_window(direction)
  local timer = vim.loop.new_timer()
  local initial_timeout = 100
  local interval = 50
  local timeout = initial_timeout
  local resize_cmd = "resize"

  if direction == "increase" then
    resize_cmd = "resize +1"
  elseif direction == "decrease" then
    resize_cmd = "resize -1"
  elseif direction == "width_increase" then
    resize_cmd = "vertical resize +1"
  elseif direction == "width_decrease" then
    resize_cmd = "vertical resize -1"
  end

  -- Function to resize window
  local function resize()
    vim.cmd(resize_cmd)
    timeout = interval
  end

  -- Set initial timeout
  timer:start(initial_timeout, 0, vim.schedule_wrap(resize))

  -- Incrementally resize while keys are held down
  vim.api.nvim_set_keymap('n', '<C-+>', '<cmd>lua resize_window("increase")<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<C-->', '<cmd>lua resize_window("decrease")<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<C-.>', '<cmd>lua resize_window("width_increase")<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<C-,>', '<cmd>lua resize_window("width_decrease")<CR>', { noremap = true, silent = true })

  -- Clear timer when keys are released
  vim.api.nvim_set_keymap('n', '<C-+><C-+>', '<cmd>lua clear_timer()<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<C--><C-->', '<cmd>lua clear_timer()<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<C-.><C-.>', '<cmd>lua clear_timer()<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<C-,><C-,>', '<cmd>lua clear_timer()<CR>', { noremap = true, silent = true })

  -- Clear timer function
  function clear_timer()
    timer:stop()
    timer:close()
  end
end

-- Remap keys for resizing windows
vim.api.nvim_set_keymap('n', '<C-+>', '<cmd>lua resize_window("increase")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-->', '<cmd>lua resize_window("decrease")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-.>', '<cmd>lua resize_window("width_increase")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-,>', '<cmd>lua resize_window("width_decrease")<CR>', { noremap = true, silent = true })
vim.opt.relativenumber = true

-- Define the nnoremap function
local function nnoremap(lhs, rhs)
  vim.api.nvim_set_keymap('n', lhs, rhs, { noremap = true, silent = true })
end

nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")
-- Configure diagnostic settings
vim.diagnostic.config({
  virtual_text = {
    prefix = '●', -- Could be '●', '▎', 'x'
    spacing = 4,
    wrap = true, -- Enable wrapping of diagnostic messages
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt.shiftwidth = 2
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2
  end,
})
