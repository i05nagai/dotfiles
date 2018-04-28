dotfiles
========

### 1. Description

* `shell`      -> `~/.shell`
* `.zshrc`     -> `~/.zshrc`
* `.vimrc`     -> `~/.vimrc`
* `.vimrc`     -> `~/.vimrc`
* `.tmux.conf` -> `.tmux.conf`
* `_vimrc`     ->  `_vimrc`
* `_gvimrc`    -> `_gvimrc`
* `.gitconfig` -> `.gitconfig`
* `.ctags`     -> `.ctags`

### 2. how to use
just execute following command.
    ./install.sh

```
./install.sh <option>
# Install neobundle
git submodule init
git submodule update
```

* `-c`
    * linux CUI
* `-g`
    * linux GUI
* `-o`
    * OSX
* `-w`
    * Windows

After installation, you need to set up vim.

```vim
:NeoBundleInstall
```
