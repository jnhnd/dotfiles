# dotfiles
## clone repository:
```sh
git clone https://github.com/jnhnd/dotfiles.git ~/repos/dotfiles
```

## Neovim Configuration
Install vim-plug from command line.

### Unix
```sh
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### Windows (PowerShell)
```sh
md ~\AppData\Local\nvim\autoload
$uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
(New-Object Net.WebClient).DownloadFile(
  $uri,
  $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(
    "~\AppData\Local\nvim\autoload\plug.vim"
  )
)
```

### Install Plugins
Run `nvim` and execute  command `:PlugInstall` .

## Vim Configuration
Install vim-plug from command line.

### Unix
```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### Windows (PoserShell)
```sh
md ~\vimfiles\autoload
$uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
(New-Object Net.WebClient).DownloadFile(
  $uri,
  $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(
    "~\vimfiles\autoload\plug.vim"
  )
)
```

### Install Plugins
Run `vim` and execute  command `:PlugInstall` .

## Recommended Tools
* [Cica](https://github.com/miiton/Cica)
* [tmux](https://github.com/tmux/tmux)
* [alacritty](https://github.com/jwilm/alacritty)
* [ripgrep](https://github.com/BurntSushi/ripgrep)
* [fzf](https://github.com/junegunn/fzf)
* [fd](https://github.com/sharkdp/fd)
