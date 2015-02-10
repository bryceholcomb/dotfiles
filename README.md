#My dotfile configurations

##To-dos
- add vim multiple cursors

## How to create symlinks for your dotfiles
mkdir .dotfiles
then move current dotfiles that exist in root directory to new dotfiles folder, and create symlinks
Ex: mv .zshrc .dotfiles/zshrc
create symlink: ln -s .dotfiles/zshrc .zshrc (do this in your root directory where the dot files are expected to exist)
