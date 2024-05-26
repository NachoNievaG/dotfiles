# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install nvim tmux git zsh zsh-completions zsh-syntax-highlighting zsh-autosuggestions fzf ripgrep bat fd exa pyenv cargo rustc

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cp .zshrc ~/.zshrc
# cp .gitconfig ~/.gitconfig
# cp .gitignore_global ~/.gitignore_global
cp .wezterm.lua ~/.wezterm.lua

# copy all config files
cp -r config ~/.config
