-- ~/.config/nvim/lua/plugins/fugitive.lua

-- Function to execute Git commands using vim.cmd.Git
local function git_command(cmd)
    return function()
        vim.cmd('Git ' .. cmd)
    end
end

-- Set leader key mappings
vim.keymap.set("n", "<leader>gs", git_command('status'))

local ThePrimeagen_Fugitive = vim.api.nvim_create_augroup("ThePrimeagen_Fugitive", {})

vim.api.nvim_create_autocmd("BufWinEnter", {
    group = ThePrimeagen_Fugitive,
    pattern = "*",
    callback = function()
        if vim.bo.ft ~= "fugitive" then
            return
        end

        local bufnr = vim.api.nvim_get_current_buf()
        local opts = { buffer = bufnr, remap = false }

        vim.keymap.set("n", "<leader>p", git_command('push'), opts)
        vim.keymap.set("n", "<leader>ga", git_command("add ."), opts)
        vim.keymap.set("n", "<leader>P", git_command('pull --rebase'), opts)
        vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts)
    end,
})
