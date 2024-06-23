# ThePrimeagen's Dotfiles:
I am going through ThePrimeagen's dotfiles, and implementing what is valuable. 

## Changes:
Here is what I have changed in my own config:

### i3wm:
Haven't found anything that was really awesome. I configured my i3Status bar a bit.

### Neovim 
1. Added command **<leader>cz**, which opens a floating terminal, automatically running the `cz commit` terminal command. This is helpful, as Vim Fugitive doesn't have Commitizen support.
2. Added **<leader>ga** command in Vim Fugitive config, to run the git command `git add .`. This is helpful, I don't have to type in the command `G add .`. This works better.
3. Cloak.lua plugin installed, working as expected. What does this plugin do? Well, I have configured it to hide my `.env` environment variables by replacing the values with "*" characters. I can run `:CloakToggle` to toggle the variables. This is helpful if you maybe record videos, and you don't want to accidentally leak your environment variables. For more information on how to configure it, and the other command, check out <a href="https://github.com/laytan/cloak.nvim" target="_blank">cloak.nvim</a>.

Current Place: Just finished going through `lsp.lua` in his <a href="https://github.com/ThePrimeagen/init.lua" target="_blank">Neovim config</a>.
