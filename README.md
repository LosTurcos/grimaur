# aur

`aur` is a lightweight AUR helper that searches, builds, and updates AUR packages using the official git mirror.

## Install
1. Clone the repository:
   ```bash
   git clone https://github.com/ryk4rd/aur.git
   cd aur
   ```
2. Put the script somewhere on your `PATH`:
   ```bash
   chmod +x aur
   sudo install -m755 aur /usr/local/bin/aur
   ```
3. (Optional) Enable Bash completions:
   ```bash
   sudo install -m644 aur-completion.bash /usr/share/bash-completion/completions/aur
   ```

## Search Packages
- `aur <term>` (or `aur search <term>`) lists matching packages and lets you pick one to install.

## Install Packages
- `aur install <package>` clones the repo, resolves dependencies, builds with `makepkg`, and installs via `pacman` when needed.
- Pass `--noconfirm` to skip confirmation prompts during the build/install steps.

## Stay Updated
- `aur update` rebuilds every installed “foreign” package that has a newer release.
- `aur update <pkg1> <pkg2>` limits the update run to specific packages.
- Combine with `--refresh` to force a fresh pull of every tracked package.
