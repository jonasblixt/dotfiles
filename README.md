# dotfiles

zsh (oh-my-zsh), vim, tmux, git, kitty, alacritty and openbox config.

```sh
git clone --recursive git@github.com:jonasblixt/dotfiles.git ~/dotfiles
~/dotfiles/install.sh
```

The repo must live at `~/dotfiles`; zshrc and the openbox config refer to it
by that path.

`install.sh` options:

- `--link-only` skip installing packages, only create the symlinks
- `--desktop` also install openbox and hsetroot

Existing files that would be replaced by a symlink are moved to `<name>.bak`.

On Windows, copy `alacritty_win.toml` to `%APPDATA%\alacritty\alacritty.toml`.
