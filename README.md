# grimaur

`grimaur` is a lightweight AUR helper that searches, builds, and updates AUR packages using the official git mirror.

## Install
1. Clone the repository:
   ```bash
   git clone https://github.com/ryk4rd/grimaur.git
2. Put the script somewhere on your `PATH`:
   ```bash
   chmod +x grimaur
   sudo install -m755 grimaur /usr/local/bin/grimaur
   ```
3. (Optional) Enable Bash completions:
   ```bash
   sudo install -m644 aur-completion.bash /usr/share/bash-completion/completions/grimaur
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
