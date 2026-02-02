# .dotfiles

This is my .dotfiles repo where I save "dotfiles", usually meaning "hidden" configuration files for *nix based operating systems and tools therein.

## Usage

You will probably want to clone this repo into your ~/ folder, and then add symlinks to each dotfile.

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


## Neovim specifics  

In ~/.config/nvim/init.vim add this:  

```bash
if filereadable(expand("~/.vimrc"))
  source ~/.vimrc
endif
```

### Installation 

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

