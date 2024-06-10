# NextVimJS

NextVimJS is a powerful Neovim configuration framework tailored for Next.js and Node.js web development, built upon the foundation of NVChad. It's designed to enhance your coding experience with a comprehensive set of features and pre-configured plugins.

## Features

- **Context Commentstring**: Easily comment out code in TSX, JSX, or any file with the appropriate comment syntax.
- **Harpoon**: Mark files effortlessly and navigate between them seamlessly.
- **GitHub Copilot Configuration**: Enable GitHub Copilot auto suggestions to enhance your coding experience.
- **Null-ls Integration**: Ensure Prettier and ESLint work seamlessly within your Neovim setup.
- **Language Servers for Next.js Development**: Pre-configured language servers for optimal support in Next.js projects.
- **nvim-ts-autotag**: Automatically close tags as you code, saving you time and effort.

## Pre-configured Plugins

NextVimJS comes with all the pre-configured plugins provided by NVChad, ensuring a robust foundation for your Neovim setup. These plugins are carefully selected and optimized to enhance your productivity and streamline your development workflow.

## Installation

1. Make sure you have neovim Nvim 0.9+ installed. Follow the instructions on Neovim's [github page](https://github.com/neovim/neovim/tree/master) to install it.

2. If you have an existing Neovim configuration, back it up:

   ```bash
   mv ~/.config/nvim ~/.config/backup_nvim
   ```

3. Clone the NextVimJS repository to your local machine:

   ```bash
   git clone https://github.com/WilliamFerns1/NextVimJS.git ~/.config/nvim
   ```
4. Launch neovim with the `nvim` command in your terminal. It will automatically start installing all the plugins.

## Usage

NextVimJS serves as a startup template for your Neovim setup, providing a powerful foundation tailored for Next.js and Node.js development. However, feel free to customize and configure it according to your preferences and requirements.

Launch Neovim and start coding! NextVimJS is ready to boost your Next.js and Node.js development experience out of the box. Take advantage of the various features and plugins to streamline your workflow and maximize your productivity.

To access a cheatsheet of all the shortcuts, simply type the following command:

```
<leader>ch
```

By default, the leader key is mapped to the space button on your keyboard. Pressing `<leader>ch` will display a comprehensive cheatsheet of all the shortcuts available in NextVimJS, allowing you to quickly reference and master your Neovim setup.

## Contributing

Contributions are welcome! If you have any suggestions, improvements, or new features to add, feel free to open an issue or submit a pull request. Let's make NextVimJS even better together.

## License

This project is licensed under the [MIT License](LICENSE). Feel free to modify and distribute it as you see fit.

