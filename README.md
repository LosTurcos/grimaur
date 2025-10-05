# aurgit

`aurgit` is a Python 3 command-line helper for working with Arch Linux User Repository (AUR) packages through the official git mirror or the AUR RPC API. It aims to cover the everyday workflow of searching, cloning, inspecting, building, and keeping AUR packages up to date while staying close to the tooling Arch users already rely on.

## Features
- Clone AUR package branches directly from the `aur.git` mirror with transparent refresh support.
- Resolve dependencies, build with `makepkg`, and install packages while reusing `pacman` for official repo dependencies.
- Rebuild installed “foreign” packages in bulk with `aur update`, making it easy to stay current.
- Search packages via git or the RPC API with interactive selection of results when running in a TTY.
- Inspect package metadata (`PKGBUILD`, `.SRCINFO`, dependency sets) without leaving the terminal.
- Provide programmable completions via the built-in `complete` subcommand and the bundled Bash script.

## Requirements
- Arch Linux system with `pacman`, `makepkg`, and the `base-devel` group installed.
- `git` for interacting with the official mirror at `https://github.com/archlinux/aur.git`.
- Python 3.10 or newer (the helper is a single executable Python script).
- Optional: `sudo` access for installing packages pulled from the official repositories during builds.

## Installation
1. Clone this repository (or download the `aur` script):
   ```bash
   git clone https://github.com/<your-user>/aurgit.git
   cd aurgit
   ```
2. Make the helper available on your `$PATH`. For example:
   ```bash
   chmod +x aur
   sudo install -m755 aur /usr/local/bin/aur
   ```
3. Optionally install Bash completion:
   ```bash
   sudo install -m644 aur-completion.bash /usr/share/bash-completion/completions/aur
   # or: source aur-completion.bash from your shell profile
   ```
4. Run `aur --help` to confirm everything is wired up.

## Usage
Global flags apply to every subcommand:
- `--dest-root DIR` – cache clones under `DIR` (default `~/.cache/aurgit`).
- `--refresh` – refresh existing clones before using them.
- `--source {git,api}` – pick the preferred upstream for metadata lookups.
- `--no-color` – disable ANSI colours.

Typical workflows:
```bash
# Search the git mirror and interactively choose packages to install
aur search neovim --limit 15

# Search via the RPC API (faster metadata, no regex support)
aur search --source api sway

# Clone a package without building yet
aur fetch hyprland

# Inspect dependencies, including build-time requirements
aur inspect hyprland --show-build-deps

# Install a package and automatically build missing AUR dependencies
aur install hyprland --refresh

# Rebuild every installed foreign package (or pass names to limit the scope)
aur update --refresh
```

When `aur search` runs in a TTY it lets you interactively pick results to install; use `--no-interactive` when you only want a listing. Install and update operations may invoke `sudo pacman` as needed for missing repo dependencies—watch for prompts.

## Shell Completion
The helper exposes a machine-friendly completion backend:
```bash
aur complete install <prefix>
```
The bundled `aur-completion.bash` script wires this into Bash. Source the file or place it under your system’s Bash completion directory to enable tab completion for subcommands and package names. Other shells can integrate by calling the same `aur complete` subcommand.

## Notes
- The tool respects the standard Arch packaging workflow and leaves the build artifacts under `--dest-root`; clean them up when you no longer need them.
- Network access to both `https://github.com/archlinux/aur.git` and `https://aur.archlinux.org` is required for cloning and RPC metadata.
- Errors from external commands are surfaced with actionable messages via `aurgit`’s exception wrapper (`AurGitError`).

Happy packaging!
