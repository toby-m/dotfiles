# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
  alias ls="ls --color=auto"
else # OS X `ls`
  alias ls="ls -G"
fi

alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'

alias g="git"
alias grep='grep --color=auto'

alias npm="time npm"
alias ag="ag --silent"


# docker OS X stuff
function docker_init {
  if [ `docker-machine status` == "Stopped" ]
  then
    docker-machine start;
  fi
  eval $(docker-machine env) && echo "Ready"
}

# alias xsd="/c/Program\ Files\ \(x86\)/Microsoft\ SDKs/Windows/v8.0A/bin/NETFX\ 4.0\ Tools/xsd.exe"
if [ -e /c/Windows/System32/drivers/etc/hosts ] do
    alias hostsfile="vim /c/Windows/System32/drivers/etc/hosts"
fi

[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh
