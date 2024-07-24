local M = {};

M.command_with_args = function(command)
  -- Prompt for user input
  local args = vim.fn.input("Arguments: ")
  -- Execute the command with the provided arguments
  vim.cmd(command .. " " .. args)
end

return M
