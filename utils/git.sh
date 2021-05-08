#!/bin/bash - 
#===============================================================================
#
#          FILE: git_glias.sh
# 
#         USAGE: ./git_glias.sh 
# 
#   DESCRIPTION: 设置各种类型的git的别名
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 01/13/15 15:35
#      REVISION:  ---
#===============================================================================

alias gitv="open /Applications/Sourcetree.app"
alias gitg="git log --graph --decorate --oneline"
alias gitall="git log --graph --decorate --oneline --simplify-by-decoration --all"
alias gitlog='git log | more'

function gitsource () {
    echo "[info] current branch list:"
    git br
    if [ $? -ne 0 ]
    then
        echo "[warning] current directory is not git repo."
    fi
    current_branch=`git br | grep \* | awk '{print $2}'`
    git branch --set-upstream-to=origin/$current_branch $current_branch
}

function gitclean() {
    echo "[info] current branch list:"
    git br
    git br | grep -v * | grep -v master | xargs git br -d
}

# 返回最后几条提交信息
function gitlast() {
    git log | head -n 24
}
