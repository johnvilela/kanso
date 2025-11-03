# Kanso

**Kanso** shapes your Ubuntu into a focused and productive development environment — inspired by the Japanese principle of simplicity and craftsmanship, and by DHH’s *Omakub*.  

It’s a single-run script that builds a clean and minimal setup for both **Desktop** and **WSL**. Kanso customizes your system with hand-picked tools, a simple tiling window manager, and a keyboard-focused workflow. It also guides you through key setup decisions and automatically applies your personal preferences, dotfiles, and projects using only basic configuration files.

## 🚀 Quick Install

Run this command in your terminal:

```bash
eval "$(wget -qO- https://raw.githubusercontent.com/johnvilela/kanso/main/install.sh)"
```

Or, for a lighter setup (ideal for WSL or terminal-only environments):

```bash
eval "$(wget -qO- https://raw.githubusercontent.com/johnvilela/kanso/main/install.sh)" --simple
```

- **Default (Full Install):** Sets up the complete Kanso desktop experience with GNOME customization, Pop Shell, themes, and applications.

- **--simple Mode:** Installs only essential terminal tools, shell configuration, and development utilities — skipping all desktop and GNOME customization steps.

## Features
- **Tiling management** with Pop Shell and simplified GNOME visuals  
- **Keyboard-centric navigation** and control  
- **Pre-installed development essentials**: Fish, Git, Zed, Mise, Node.js, and Docker  
- **Productivity apps**: Alacritty, Firefox, VSCode, Obsidian, and Zen Browser  
- **Terminal-focused tools**: Lazygit, Bat, Fzf, Ripgrep, and Starship  
- **Automated setup** for dotfiles, SSH keys, and Git projects  

## Prerequisites
- Ubuntu 24.04 or later (Desktop or WSL)

## Configuration Options

Kanso can automatically configure your environment based on your personal preferences using **dotfiles** and a **user-setup** folder.

Create a folder named `user-setup` in your **$HOME** directory.  
Inside it, you can define subfolders for specific configurations:

| Folder | Description |
| ------- | ------------ |
| `config.fish` | Your personal Fish shell configuration file. It will be copied to `~/.config/fish/config.fish`. |
| `dotfiles` | Place your dotfiles here. The script will symlink them to their respective locations in your home directory. |
| `ssh` | Place your SSH keys here. They will be copied to `~/.ssh` with correct permissions. |
| `projects` | Create text files listing Git repository URLs (one per line). Each file’s name will define a folder under `~/projects`, and all listed repositories will be cloned into it. |

**Example:**

```personal.txt
github.com/username/repo1.git
github.com/username/repo2.git
```

This will create:
```bash
~/projects/personal/repo1
~/projects/personal/repo2
```

## Roadmap

Kanso is a living project that will continue to evolve while maintaining its simplicity and purpose.  
The following items are planned for future releases:

- **Container Engine Selection** — Allow users to choose between Podman, Docker, or none  
- **Shell Options** — Let users pick their preferred shell: Fish, Zsh, or Bash  
- **Editor Choice** — Select between VSCode, Zed, or Neovim as the main code editor  
- **Miscellaneous Apps** — Offer optional installs for Spotify, Discord, WhatsApp, Signal, and Telegram  
- **ASCII Art Branding** — Add a simple and elegant Kanso ASCII logo displayed during installation  
- **Language Runtimes** — Let users choose to install Node.js, Ruby, Python, Rust, or Go  
- **Theme Selection** — Provide multiple GNOME and system themes beyond the default Ubuntu look  

---

*Have suggestions or ideas to improve Kanso? Feel free to open an issue or discussion on GitHub — simplicity grows through collaboration.*

## Contribution Guidelines
Contributions are welcome! Please fork the repository and submit a pull request with your changes. Make sure to follow the existing code style, include test descriptions to be reproducible, and update the documentation as needed.

## License
This project is licensed under the MIT License. See the LICENSE file for details.