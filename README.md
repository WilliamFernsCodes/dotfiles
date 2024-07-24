# My dotfiles

Welcome to my dotfiles! Every Sunday, I spend a few hours optimizing, and improving my dotfiles, to be more efficient, and productive as a developer, and on my computer in general.

These dotfiles are meant for developers specifically, or anyone who type alot for a living.

## Primary goals:

By using my dotfiles, here are the benefits that you will get:

1. At least a 200% - 300% increase in productivity/efficiency
2. More money - as a side effect from using these dotfiles

## Requirements:

To use all of my dotfiles, you need the following:

- [NvChad](https://nvchad.com/docs/quickstart/install/) - neovim distribution
- [i3wm](https://archlinux.org/packages/extra/x86_64/i3-wm/) - tiling window manager
- [i3Status](https://archlinux.org/packages/extra/x86_64/i3status/) - status bar fir i3wm
- [espanso](https://aur.archlinux.org/packages/espanso-bin) - shorthand utility software
- [Tmux](https://archlinux.org/packages/extra/x86_64/tmux/) - terminal multiplexer
- [Fish Shell](https://archlinux.org/packages/extra/x86_64/fish/) - shell with auto-completion built-in
- [OMF](https://github.com/oh-my-fish/oh-my-fish) - used to customize fish shell appearance

## Setup Guide:

I am sure that my dotfiles can be used on other Linux distributions with some manual setup, but it is specifically made for Arch Linux.

1. Clone my dotfiles repository:

```bash
cd ~/.config ; git clone https://github.com/WilliamFernsCodes/dotfiles
```

2. Run the [setup script](./scripts/setup_dotfiles.sh) (it automatically backup your previous dotfiles in `dotfiles.backup`):

```bash
cd dotfiles; ./setup_dotfiles.sh
```

3. Enjoy. Feel free to go through the dotfiles, and modify things as you wish. There are great documentation for each of the dotfiles on this repository, feel free to read through that if you wish.

For a more in-depth guide on how to install each of the software, along with more details, check the links below. I document the extra changes, and things I learnt, which you might find valuable:

- [Introduction](./documentation/introduction.md)
- [Neovim](./documentation/neovim.md)
- [i3wm](./documentation/i3wm.md)
- [Espanso](./documentation/espanso.md)
- [Tmux](./documentation/tmux.md)
- [Tmux](./documentation/tmux.md)
- [Scripts](./documentation/scripts.md)
- [Fish & OMF](./documentation/fish_and_omf.md)
- [Emacs](./documentation/emacs.md) (plan on learning in the future)

## Contributions:

If you see some changes you can make, feel free to **fork** this repository, make changes as you see fit, and make a **pull request** if you wish.

## Conclusion:

This is just the start of my dotfiles. I plan on making changes and improvements for years to come. Stay up to date with this repository, as it will become more and more valuable as time pass by.

---
