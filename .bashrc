alias c="clear"
alias gits="git status"
alias e="emacsclient -t"
alias em="emacs -nw"
alias tmux="TERM=xterm-256color tmux"
alias size="du -csh"
alias sizedirs="du -h --max-depth=1 | sort -hr"
alias findi="find . -iname"
alias grep="grep --color=auto"
alias .1="cd .."
alias .2="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."

export PS1="\[\033[01;32m\]\u\[\033[01;36m\]@\[\033[01;31m\]\h \[\033[01;36m\]( \[\033[01;35m\]\w \[\033[01;36m\])\[\033[01;32m\]: \[$txtcyn\]\$git_branch \[\033[00m\]"
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig/:/usr/local/lib64/pkgconfig/

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

