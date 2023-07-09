# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

alias l="ls -al"
alias ..="cd .."
alias poetry_shell='. "$(dirname $(poetry run which python))/activate"'
alias ipy="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"
alias python=python3
alias pip=pip3
alias j='nocolor | jq .'
alias vim=nvim

# to make this work, you need to add a proxyjump to ~/.ssh/config:
# Host platform_data_prod
#   HostName 172.28.19.162
#   ProxyJump ec2-user@54.93.110.83
#   User ec2-user
alias psql_tunnel="ssh -L 1111:172.24.3.61:5432 ec2-user@platform_data_prod -N &"
export editor=nvim
export PATH=$PATH:$HOME/.poetry/bin:
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

fixssh() {
    eval $(tmux show-env    \
        |sed -n 's/^\(SSH_[^=]*\)=\(.*\)/export \1="\2"/p')
}
nocolor() {
    sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g"
}
my_ftp() {
  ftp -i -n <<EOF
    open ftp-legacy.homegate.ch
    user "ftp" "B37cc3fea1"
    $@
EOF
}

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
curl_add_ip(){
    if (($2)); then
        PORT=$2
    else
        PORT=22999
    fi
    ENDPOINT="http://127.0.0.1:$PORT/api/add_whitelist_ip"
    DATA="ip="$1
    curl $ENDPOINT -X POST -d $DATA --post301 -L -k
}
alias lpm_whitelist_ip='curl_add_ip'

# append history immediately to bashrc
shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
