# .dotfiles

This is my .dotfiles repo where I save "dotfiles", usually meaning "hidden" configuration files for *nix based operating systems and tools therein.
Assumptions:  
- zsh is the shell  
- you have git installed  
- you are running macOS, Fedora, or Ubuntu WSL  
If not, your mileage may vary - follow these instructions with care.  

> [!WARNING]
> You should back up your config files before performing any of this, if not you might destroy existing files.

## Usage

### Vim  

You probably already have vim if you're running macOS, Ubuntu or Fedora.  
But in case you don't, just follow these instructions.  

#### Installation on macOS  

```sh
# Install Vim
brew install vim

# Check version  
vim --version
```

#### Fedora 

```sh
# Update package list
sudo dnf update -y

# Install Vim
sudo dnf install -y vim-enhanced

# Check version
vim --version
```

#### Ubuntu WSL

```sh
# Uppdate package list
sudo apt update

# Install Vim
sudo apt install -y vim

# Check version
vim --version
```

### Config files

When you have vim installed you will probably want to clone this repo into your ~/ folder, and then add symlinks to each dotfile.

```sh
cd ~/
git clone https://github.com/snailtail/.dotfiles
```

#### Vim config  

Then symlink the config-files for vim:  

```sh
cd ~/
git clone https://github.com/snailtail/.dotfiles
ln -s ~/.dotfiles/vim/.vimrc .vimrc
ln -s ~/.dotfiles/vim ~/.vim

```
This should download the repo to your local client machine, and create symbolic links for some config files and/or directories for vim.

#### Tmux config  

And if you use tmux (you probably should) you might want to create a symlink to the .tmux.conf file in the dotfiles, for some good base settings:  

```sh
ln -s ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
```
