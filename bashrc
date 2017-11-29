# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# keep machine specific stuff and keys in .profile
[ -f ~/.profile ] && source ~/.profile
source ~/.git-prompt.sh

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
  VE=$(echo $VIRTUAL_ENV | sed "s#.*/##g;s#^\(\w\)\w*#\1#;s#\W\(\w\)\w*#\1#g")
  [[ -n "$VE" ]] && echo "[pyenv:$VE]"
}
VENV="${GREY}\$(venv_info)${NORMAL}";

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

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
  __git_complete g __git_main
fi

if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

# aws command line completer
[ ! -e `which aws_completer` ] && complete -C aws_completer aws

# docker drill aliases if available https://github.com/toby-m/docker-drill
if (hash docker &>/dev/null) && [ ! -z "$(docker images -q docker-drill)" ]; then
  function drill-tsv {
    docker run --rm -it -v $PWD:/data/tsv -p 8047:8047 docker-drill
  }

  function drill-json {
    docker run --rm -it -v $PWD:/data/json -p 8047:8047 docker-drill
  }

  function drill-csv {
    docker run --rm -it -v $PWD:/data/csv -p 8047:8047 docker-drill
  }
fi


export PATH="$HOME/.yarn/bin:$PATH"
