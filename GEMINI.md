# GEMINI.md: Dotfiles Repository

## Directory Overview

This repository stores and manages the configuration files (dotfiles) for a personalized development environment. It is designed for a Linux system, likely using a tiling window manager like Hyprland or i3. The repository includes configurations for the Zsh shell, various command-line tools, and graphical applications.

The main purpose of this repository is to provide a consistent and reproducible development environment across different machines.

## Key Files and Directories

*   **`.zshrc`**: The main configuration file for the Zsh shell. It sets up environment variables, aliases, and sources other configuration files. It also uses `oh-my-zsh` and `direnv`.
*   **`dev-env`**: A shell script that symlinks the configuration files from this repository to the appropriate locations in the user's home directory. This script is the primary way to "install" the dotfiles.
*   **`run`**: A shell script that executes other scripts located in the `runs` directory. This can be used to run setup or installation scripts for different tools.
*   **`.config/`**: This directory contains configuration files for various applications, including:
    *   `dunst`: A notification daemon.
    *   `ghostty`: A terminal emulator.
    *   `hypr`: A tiling window manager.
    *   `i3`: Another tiling window manager.
    *   `nvim`: The Neovim text editor.
    *   `picom`: A compositor for X11.
    *   `tmux`: A terminal multiplexer.
    *   `waybar`: A status bar for Wayland compositors.
*   **`.local/`**: This directory contains local user files, including:
    *   `scripts/`: A directory for custom shell scripts.

## Usage

To use this dotfiles repository, you would typically clone it to your local machine and then run the `dev-env` script. This will create symbolic links from the files in the repository to the correct locations in your home directory.

The `run` script can be used to execute any additional setup scripts that may be required for specific tools.

**TODO:** Add more detailed instructions on how to use the `dev-env` and `run` scripts, including any prerequisites or dependencies.
