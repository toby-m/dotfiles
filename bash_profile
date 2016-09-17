export EDITOR=vim

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
  alias ls="ls --color=auto"
else # OS X `ls`
  alias ls="ls -G"
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias g="git"
alias grep='grep --color=auto'
# . /Library/Python/2.7/site-packages/Powerline-beta-py2.7.egg/powerline/bindings/bash/powerline.sh
# alias xsd="/c/Program\ Files\ \(x86\)/Microsoft\ SDKs/Windows/v8.0A/bin/NETFX\ 4.0\ Tools/xsd.exe"
# alias hostsfile="vim /c/Windows/System32/drivers/etc/hosts"

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
