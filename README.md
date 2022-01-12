# vim-man
Replace the beta `:Man` of (Neo)Vim with a [Sigma](https://www.youtube.com/watch?v=wLz9xU6J88k).

## Quick start
- Install this plugin

### [Vim Plug](https://github.com/junegunn/vim-plug)
```vim
Plug 'shoumodip/vim-man'
PlugInstall
```

### [Vundle](https://github.com/VundleVim/Vundle.vim)
```vim
Plugin 'shoumodip/vim-man'
PluginInstall
```

### [Dein](https://github.com/Shougo/dein.vim)
```vim
call dein#add('shoumodip/vim-man')
call dein#install()
```

### [Minpac](https://github.com/k-takata/minpac)
```vim
call minpac#add('shoumodip/vim-man')
```

### Packages
```console
$ git clone https://github.com/shoumodip/vim-man ~/.vim/pack/plugins/start/
$ git clone https://github.com/shoumodip/vim-man ~/.config/nvim/pack/plugins/start/
```

## Usage
| Command | Description |
| ------- | ----------- |
| `:Man` | Query the user in an input prompt based on the word at point |
| `:Man ARGS` | Pass the arguments to the input prompt |

## Tip
Improve your grindset.

```vim
noremap <leader>h :Man<cr><c-left>
```
