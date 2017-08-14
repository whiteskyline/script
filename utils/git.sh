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

alias gitv="open /Applications/GitHub\ Desktop.app"
alias gitg="git log --graph --decorate --oneline"
alias stc="sh /Users/horizon/core/status-check.sh"
alias gitall="git log --graph --decorate --oneline --simplify-by-decoration --all"
function gitreview() {
    if [ $# -lt 1  ]; then
        echo "no target branch is given"
        return
    fi
    branch_name=$1
    echo target_branch:$branch_name
    git push origin HEAD:refs/for/$branch_name
}
