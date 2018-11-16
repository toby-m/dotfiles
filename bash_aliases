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

alias github=GitHub

function GitHub()
{
    if ! git rev-parse; then
        return 1;
    fi

    git_url=$(git config --get remote.origin.url)
    if [[ $git_url == https://github* ]]; then
        open ${git_url%.git}
        return 0
    fi

    if [[ $git_url == git@github.com* ]]; then
        open $(echo $git_url | sed "s#.*:\(.*\).git\$#https://github.com/\1#")
        return 0
    fi

    echo "Can't understand url $git_url" && return 1;
}

# alias xsd="/c/Program\ Files\ \(x86\)/Microsoft\ SDKs/Windows/v8.0A/bin/NETFX\ 4.0\ Tools/xsd.exe"
[ -e /c/Windows/System32/drivers/etc/hosts ] && alias hostsfile="vim /c/Windows/System32/drivers/etc/hosts"

[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh

alias aws2fas='PYENV_VERSION=aws_lease /Users/tmo/.pyenv/shims/aws2fa'
alias crowdin="java -jar ~/bin/crowdin-cli.jar"

alias tmux="TERM=screen-256color-bce tmux"

