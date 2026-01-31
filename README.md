# .dotfiles

This is my .dotfiles repo where I save "dotfiles", usually meaning "hidden" configuration files for *nix based operating systems and tools therein.

## Usage

You will probably want to clone this repo into your ~/ folder, and then add symlinks to each dotfile.

For example:
```bash
cd ~/
git clone https://github.com/snailtail/.dotfiles
ln -s .dotfiles/vim/.vimrc .vimrc
```
To download the repo, and make a symbolic link to the .vimrc file from where vim most usually looks for it's config file.

