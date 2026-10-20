export ZSH=$HOME/dotfiles/oh-my-zsh
ZSH_THEME="agnoster"
DISABLE_UPDATE_PROMPT=true
DISABLE_AUTO_UPDATE=true
plugins=(git)

# Muted agnoster colors (256-color palette) instead of the bright blue/yellow
AGNOSTER_CONTEXT_BG=236 AGNOSTER_CONTEXT_FG=245
AGNOSTER_DIR_BG=66 AGNOSTER_DIR_FG=235
AGNOSTER_GIT_CLEAN_BG=65 AGNOSTER_GIT_CLEAN_FG=235
AGNOSTER_GIT_DIRTY_BG=137 AGNOSTER_GIT_DIRTY_FG=235
AGNOSTER_VENV_BG=60 AGNOSTER_VENV_FG=252
AGNOSTER_STATUS_BG=236

source $ZSH/oh-my-zsh.sh

export PATH=$PATH:~/.local/bin
export PYTHONPATH=~/dotfiles/python
export EDITOR=vim
export TERM=xterm-256color
export MENUCONFIG_COLOR=classic

# Alt+Left/Right moves by word
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

# fzf: bat is called batcat on Debian
if command -v batcat > /dev/null; then
  BAT=batcat
else
  BAT=bat
fi
export FZF_CTRL_T_OPTS="--preview='$BAT -n --style=numbers --line-range=:500 --color=always {}'"
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'

# fzf key bindings and completion live in different places per distro
for f in \
  /usr/share/doc/fzf/examples/key-bindings.zsh \
  /usr/share/doc/fzf/examples/completion.zsh \
  /usr/share/fzf/key-bindings.zsh \
  /usr/share/fzf/completion.zsh \
  /usr/share/fzf/shell/key-bindings.zsh \
  ~/.fzf.zsh; do
  [ -f "$f" ] && source "$f"
done
unset f
