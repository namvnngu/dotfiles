os=$(uname -s)

###############################################################################
#                                 Paths                                       #
###############################################################################

export XDG_CONFIG_HOME="$HOME/.config"

# my custom bins
export PATH=$PATH:$HOME/dotfiles/bin

alias tmuxs=tmux-sessionizer
alias tmuxc=tmux-cht

# go
case $os in
    Linux*)
      export GOROOT=/usr/local/go
      ;;
    Darwin*)
      ;;
esac

export GOPATH=$HOME/.go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

###############################################################################
#                               Settings                                      #
###############################################################################

# zsh history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# vim mode
# set -o vi

# reduce latency when pressing <Esc>
export KEYTIMEOUT=1

###############################################################################
#                                Plugins                                      #
###############################################################################

# auto suggestions
ZSH_AUTO_SUGGESTIONS_FOLDER=~/.zsh/zsh-autosuggestions
ZSH_AUTO_SUGGESTIONS_FILE=$ZSH_AUTO_SUGGESTIONS_FOLDER/zsh-autosuggestions.zsh
if [ ! -f $ZSH_AUTO_SUGGESTIONS_FILE ]; then
  git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions $ZSH_AUTO_SUGGESTIONS_FOLDER
fi
source $ZSH_AUTO_SUGGESTIONS_FILE

# syntax highlighting
# ZSH_SYNTAX_HIGHLIGHTING_FOLDER=~/.zsh/zsh-syntax-highlighting
# ZSH_SYNTAX_HIGHLIGHTING_FILE=$ZSH_SYNTAX_HIGHLIGHTING_FOLDER/zsh-syntax-highlighting.zsh
# if [ ! -f $ZSH_SYNTAX_HIGHLIGHTING_FILE ]; then
#   git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting $ZSH_SYNTAX_HIGHLIGHTING_FOLDER
# fi
# source $ZSH_SYNTAX_HIGHLIGHTING_FILE

# z
Z_FOLDER=~/.zsh/z
Z_FILE=$Z_FOLDER/z.sh
Z_DATAFILE=$Z_FOLDER/.z

if [ ! -f $Z_FILE ]; then
  git clone --depth 1 https://github.com/rupa/z.git $Z_FOLDER
  chmod +x $Z_FILE
fi
export _Z_DATA=$Z_DATAFILE
source $Z_FILE

# prompt
PROMPT='%n %~'$'\n$ '

###############################################################################
#                               Tools                                         #
###############################################################################

# fzf
FZF_FOLDER=~/.fzf
if [ ! -d $FZF_FOLDER ]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git $FZF_FOLDER
  ~/.fzf/install
fi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# n: node version manager
export N_PREFIX="$HOME/.n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

# Docker variables
export DOCKER_FORMAT="ID\t{{.ID}}\nNAME\t{{.Names}}\nIMAGE\t{{.Image}}\nPORTS\t{{.Ports}}\nCOMMAND\t{{.Command}}\nCREATED\t{{.CreatedAt}}\nSTATUS\t{{.Status}}\n"

###############################################################################
#                              Utilities                                      #
###############################################################################

# zsh time
function timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

function colors() {
  STYLE="38;5"
  for COLOR in {0..255}
  do
    TAG="\033[${STYLE};${COLOR}m"
    STR="${STYLE};${COLOR}"
    echo -ne "${TAG}${STR}"
    echo
  done
}
