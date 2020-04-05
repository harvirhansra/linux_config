export DISPLAY=192.168.1.113:0.0

. ~/venvs/default_python/bin/activate

alias c="clear"
alias gits="git status"
alias e="emacsclient -t"
alias tmux="TERM=xterm-256color tmux"
alias size="du -csh"
alias sizedirs="du -h --max-depth=1 | sort -hr"
alias gits="git status"
alias python=python3.8

export PS1="\[\033[01;32m\]\u\[\033[01;36m\]@\[\033[01;31m\]\h \[\033[01;36m\]( \[\033[01;35m\]\w \[\033[01;36m\])\[\033[01;32m\]: \[$txtcyn\]\$git_branch \[\033[00m\]"
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig/:/usr/local/lib64/pkgconfig/
export DISPLAY=176.250.202.9:0.0

find_git_branch() {
    local branch
    if branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null); then
	if [[ "$branch" == "HEAD" ]]; then
	    branch='detached*'
	fi
	git_branch="($branch)"
    else
	git_branch=""
    fi
}

PROMPT_COMMAND="find_git_branch; $PROMPT_COMMAND"
