# .dotfiles

This is my .dotfiles repo where I save "dotfiles", usually meaning "hidden" configuration files for *nix based operating systems and tools therein.

## Usage

You will probably want to clone this repo into your ~/ folder, and then add symlinks to each dotfile.

For example:
```bash
cd ~/
git clone https://github.com/snailtail/.dotfiles
ln -s ~/.dotfiles/vim/.vimrc .vimrc
```
To download the repo, and make a symbolic link to the .vimrc file from where vim most usually looks for it's config file.


## Neovim specifics  

```bash
# Backup existing nvim config 
mv ~/.config/nvim ~/.config/nvim.bak.$(date +%Y%m%d_%H%M%S) 2>/dev/null || true

# länka neovim config-folder till dotfiles motsvarighet
mkdir -p ~/.config
ln -s ~/.dotfiles/nvim ~/.config/nvim
```

### Installation 

#### Ubuntu/WSL (apt)

```bash
sudo apt update
sudo apt install -y neovim git curl ripgrep fd-find unzip
```
- ripgrep is needed for Telescope live grep
- fd-find is needed for fast file search (on Ubuntu the binary is often called `fdfind`)

Create alias for telescope to find fd:

```bash
mkdir -p ~/.local/bin
ln -sf "$(command -v fdfind)" ~/.local/bin/fd
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
```

#### Fedora (dnf)

```bash
sudo dnf install -y neovim git curl ripgrep fd-find unzip
```

#### macOS (brew)

```bash
brew install neovim git ripgrep fd
```

