# Neovim
For my Neovim config, you must have <a href="https://nvchad.com/docs/quickstart/install/" target="_blank">NvChad</a> installed, along with all of its requirements. 

## Installation & Setup:
To use my Neovim config, follow the following steps:
1. Install NvChad - <a href="https://nvchad.com/docs/quickstart/install/" target="_blank">NvChad Installation</a>
2. Clone my dotfiles repository:
```bash
cd ~/.config ; git clone https://github.com/WilliamFernsCodes/dotfiles
```
3. Run the [setup script](./scripts/setup_dotfiles.sh) (it automatically backup your previous dotfiles in `dotfiles.backup`):
```bash
cd dotfiles; ./setup_dotfiles.sh
```

If you don't want to use my other dotfiles, just clone the repository, backup your Neovim config, and use my Neovim config:
```bash
mv nvim nvim.backup ; mv dotfiles/nvim nvim
```

## Introduction:
To have a better understanding of how NvChad works, and how to customize it, I recommend checking out <a href="https://youtu.be/Mtgo-nP_r8Y?si=jaDKOv8ZooGuRYsm" target="_blank">this video</a>. It will allow you to better understand the nvim config structure, and allow you to modify and understand the config.

- <a href="./neovim/all_mappings.md" target="_blank">All Mappings (Keyboard Shortcuts)</a>
- <a href="./neovim/lsp_config.md" target="_blank">LSP Config</a>
- <a href="./neovim/github_copilot.md" target="_blank">Github Copilot Integration</a>
- <a href="./neovim/custom_configs" target="_blank">Custom Configs</a>
- <a href="./neovim/nvchad_core_overrides" target="_blank">NvChad Core Overrides</a>
