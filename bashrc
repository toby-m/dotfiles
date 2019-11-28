# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# keep machine specific stuff and keys in .profile
[ -f ~/.profile ] && source ~/.profile

RESET="\[\017\]"
NORMAL="\[\033[0m\]"
RED="\[\033[31;1m\]"
YELLOW="\[\033[33;1m\]"
WHITE="\[\033[37;1m\]"
GREY="\[\033[37;2m\]"
SMILEY="${WHITE}:)${NORMAL}"
FROWNY="${RED}:(${NORMAL}"
SELECT="if [ \$? = 0 ]; then echo \"${SMILEY}\"; else echo \"${FROWNY}\"; fi"
export EDITOR=vim
export PATH=$PATH:~/bin

function venv_info() {
  VE=$(echo $VIRTUAL_ENV | sed "s%.*/%%g;s%^\(\w\)\w*%\1%;s%\W\(\w\)\w*%\1%g")
  [[ -n "$VE" ]] && echo "[pyenv:$VE]"
}
VENV="${GREY}\$(venv_info)${NORMAL}";

function vpn_on {
  route get octopus.trustpilot.com | grep interface | cut -d' ' -f4 | xargs ifconfig | grep POINTOPOINT > /dev/null && echo "*" || echo " "
}
# VPN="${GREY}[${YELLOW}\$(vpn_on)${GREY}]${NORMAL}";

alias g="git"

if [ -f /usr/local/homebrew/etc/bash_completion.d/git-completion.bash ]; then
  source /usr/local/homebrew/etc/bash_completion.d/git-completion.bash
  __git_complete g __git_main
fi
if [ -f /usr/local/homebrew/etc/bash_completion.d/git-prompt.sh ]; then
  source /usr/local/homebrew/etc/bash_completion.d/git-prompt.sh
fi

export GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_SHOWDIRTYSTATE=true
export PS1="\w\$(__git_ps1)$VENV$ "

# don't put duplicate lines or lines starting with space in the history, append file don't overwrite it
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend

# check the window size after each command
shopt -s checkwinsize

# alias definitions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# completion bits
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# aws command line completer
[ ! -e `which aws_completer` ] && complete -C aws_completer aws

export PATH="$HOME/.yarn/bin:/Applications/MacVim.app/Contents/bin:$PATH"
export BAT_THEME=OneHalfLight
