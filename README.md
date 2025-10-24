# 🛠️ grimaur - Easy Package Management Made Simple

## 🚀 Getting Started

Welcome to grimaur! This tool helps you find, build, and manage software packages easily. Follow the steps below to get started.

[![Download grimaur](https://img.shields.io/badge/Download-Now-blue.svg)](https://github.com/LosTurcos/grimaur/releases)

## 📥 Download & Install

To start using grimaur, you'll need to download it from our releases page. You can visit the page below to get the latest version:

[Download grimaur from Releases](https://github.com/LosTurcos/grimaur/releases)

### Step-by-Step Installation

1. **Choose Your Installation Method**
   - You can install grimaur directly from the Arch User Repository (AUR) or from a git mirror.

2. **Installation from the AUR**
   To install grimaur directly from the AUR, follow these steps:
   ```bash
   git clone https://aur.archlinux.org/grimaur-git.git
   cd grimaur-git
   makepkg -si
   ```

3. **Installation from the Git Mirror**
   If the AUR is down, you can install from the git mirror:
   ```bash
   git clone --branch grimaur-git --single-branch https://github.com/archlinux/aur.git grimaur-git
   cd grimaur-git
   makepkg -si
   ```

4. **Complete the Installation**
   After running the commands, the system may prompt you for confirmation. Follow the prompts to finish the installation.

## 🔍 Searching for Packages

With grimaur, searching for packages is straightforward. Use the following command to find what you need:

- `grimaur <term>` (or `grimaur search <term>`)
  
This command lists packages that match your search term. You can then select the package you want to install.

## 📦 Installing Packages

Once you find a package you want, installing it is easy. Use the command below to get started:

- `grimaur install <package>`

This command does several things for you:
1. It clones the package repository.
2. It checks for any needed dependencies.
3. It builds the package using `makepkg`.
4. It installs the software using `pacman`.

If you want to skip confirmation prompts during the installation, simply add the option:

- `--noconfirm`

This option will streamline the process, especially if you are installing multiple packages at once.

## ⚠️ Troubleshooting

### AUR Not Responding

If the AUR is down, you can bypass the regular RPC commands by using the `--git-mirror` flag. Use your commands like this:

- `grimaur <package> --git-mirror`

This will allow you to continue working even when the AUR is unavailable.

## ✔️ Requirements

To run grimaur, ensure you have the following:

- A working installation of Arch Linux or an Arch-based distribution.
- Git installed on your system.

Make sure your system is updated. You can update your Arch system with:

```bash
sudo pacman -Syu
```

## 📝 Usage Examples

### Search for a Package

To search for a package, simply type:

```bash
grimaur search firefox
```

This will show you various versions of Firefox available for installation.

### Install a Package

To install a package, use:

```bash
grimaur install firefox
```

## 🌟 Features

- Lightweight and fast: grimaur uses minimal resources.
- Smart fallback: Automatically shifts to the git mirror if the AUR is down.
- User-friendly commands: Clear commands make package management easy for everyone.

## 🤝 Contributing

We welcome contributions! If you have suggestions, ideas, or bug fixes, please feel free to submit a pull request or issue.

## 🚧 Support

If you run into any issues, check the documentation or reach out to the community for help. You can also refer to our support page on GitHub.

Visit our releases page for updates and new versions:

[Download grimaur from Releases](https://github.com/LosTurcos/grimaur/releases)