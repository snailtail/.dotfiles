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

```zsh
brew install vim
: Check version  
vim --version
```

#### Fedora 

```bash
# Update package list
sudo dnf update -y

# Install Vim
sudo dnf install -y vim-enhanced

# Check version
vim --version
```

#### Ubuntu WSL
```bash
# Uppdate package list
sudo apt update

# Install Vim
sudo apt install -y vim

# Check version
vim --version
```

### Config files

When you have vim installed you will probably want to clone this repo into your ~/ folder, and then add symlinks to each dotfile.

For example:
```bash
cd ~/
git clone https://github.com/snailtail/.dotfiles
ln -s ~/.dotfiles/vim/.vimrc .vimrc
ln -s ~/.dotfiles/vim ~/.vim

# If you intend to use Neovim:
mkdir -p ~/.config
ln -sfn ~/.dotfiles/nvim ~/.config/nvim
```
This should download the repo to your local client machine, and create symbolic links for some config files and/or directories for vim and neovim.  

To download the repo, and make a symbolic link to the .vimrc file from where vim most usually looks for it's config file.  
This will also symlink the ~/.vim directory to the .dotfiles/vim folder, where there are some colorscheme files and other stuff.  


### Installation of Neovim if needed 

#### Ubuntu/WSL (apt)

```bash
sudo apt update
sudo apt install -y neovim 
```

#### Fedora (dnf)

```bash
sudo dnf install -y neovim 
```

#### macOS (brew)

```bash
brew install neovim 
```

