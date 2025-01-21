#######################
#        ZINIT        #
#######################
# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"
# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

#######################
#       History       #
#######################
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups


###########################
# custom fzf key bindings #
###########################
# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
bindkey -s ^f "tmux-sessionizer\n"
#############################
# FZF & Zoxide key bindings #
#############################
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"
##########################

# Example aliases
alias iv='nvim $(fzf -m --preview "bat --color=always --style=header,grid --line-range :500 {}")'
alias zshconfig="nvim ~/.zshrc"
alias ls='ls --color'
alias grep="rg"
alias v=nvim
alias z=__zoxide_z
alias zi=__zoxide_zi
#######################

#GO
export PATH=$(go env GOPATH)/bin:$PATH 
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PATH=$PATH:$(go env GOPATH)/bin
export PATH="$PATH":"$HOME/.local/scripts/"
#PYENV
export PATH=$(pyenv root)/shims:$PATH
export PATH="/opt/homebrew/bin/nvim:$PATH"
export ATAC_KEY_BINDINGS='/Users/nachonieva/.config/atac/config.toml'

echo "ZSH Config Loaded"
# rust
source $HOME/.cargo/env
# Tex
export PATH="$PATH:/Library/TeX/texbin"
# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
# atac key bindings
export ATAC_KEY_BINDINGS='/Users/mate.dev/.config/atac/config.toml'
export ATAC_THEME='/Users/mate.dev/.config/atac/gruvbox_light.toml'

eval "$(starship init zsh)"

alias ow='cd $HOME/work/notes && nvim'
alias op='cd $HOME/personal/notes && nvim'
