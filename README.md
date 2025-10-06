# grimaur

`grimaur` is a lightweight AUR helper that searches, builds, and updates AUR packages. It talks to the AUR RPC API by default and automatically falls back to the official git mirror when the endpoint is unavailable. Pass `--git-mirror` if you prefer to force the mirror.

## Install
### Directly from the AUR
   ```bash
   git clone https://aur.archlinux.org/grimaur-git.git
   cd grimaur-git
   makepkg -si
   ```

### From the git mirror
   ```bash
   git clone --branch grimaur-git --single-branch https://github.com/archlinux/aur.git grimaur-git
   cd grimaur-git
   makepkg -si
   ```
   

## Search Packages
- `grimaur <term>` (or `grimaur search <term>`) lists matching packages and lets you pick one to install.

## Install Packages
- `grimaur install <package>` clones the repo, resolves dependencies, builds with `makepkg`, and installs via `pacman` when needed.
- Pass `--noconfirm` to skip confirmation prompts during the build/install steps.

## Stay Updated
- `grimaur update` rebuilds every installed “foreign” package that has a newer release.
- `grimaur update <pkg1> <pkg2>` limits the update run to specific packages.
- Combine with `--refresh` to force a fresh pull of every tracked package.
