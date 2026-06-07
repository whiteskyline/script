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
alias gitd="git diff"

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
    git br | grep -v "*" | grep -v master | xargs git br -d
}

function gitpush() {
    current_branch=`git br | grep \* | awk '{print $2}'`
    git push origin $current_branch
}

# 返回最后几条提交信息
function gitlast() {
    git log | head -n 24
}

# 进行gitreview
function gitreview() {
    current_branch=`git br | grep \* | awk '{print $2}'`
    prefix=`git remote -v | grep push | awk '{print $2}' | awk -F'@|:' '{print $2"/"$3}' | awk -F'.git' '{print "https://"$1"/merge_requests/new?merge_request%5Bsource_branch%5D="}'`
    echo $prefix"$current_branch" 
}

# 跳转已经存在的Mr界面
function gitmrs() {
    current_branch=`git br | grep \* | awk '{print $2}'`
    prefix=`git remote -v | grep push | awk '{print $2}' | awk -F'@|:' '{print $2"/"$3}' | awk -F'.git' '{print "https://"$1"/merge_requests"}'`
    echo $prefix
}

export prev_branch="empty"
function gits() {
  echo "prev_branch:"$prev_branch
  tmp_prev_branch=$(git symbolic-ref --short HEAD 2>/dev/null)
  if [[ $tmp_prev_branch == $1 ]]; then
    echo "already on branch $1"
    return
  fi

  regex="^([1-9]|[1-9][0-9])$"

  if [[ $1 == "prev" ]]; then
    if [[ -n $prev_branch ]]; then
      git co $prev_branch
      export prev_branch=$tmp_prev_branch
    else
      echo "No previous branch found"
    fi
  elif [[ $1 =~ $regex ]]; then
    local_branches=$(git branch --format='%(refname:short)')
    n=$1
    target_branch=$(echo "$local_branches" | sed -n "${n}p")
    git co $target_branch
    export prev_branch=$tmp_prev_branch
  else
    git branch --list | grep -q "$1$"
    if [[ $? -eq 0 ]]; then
      git co $1
      export prev_branch=$tmp_prev_branch
    else
      echo "Branch '$1' not found"
    fi
  fi
}

function gitcbr() {
    git symbolic-ref --short HEAD 2>/dev/null | pbcopy
}

function git_list_all_br() {
	folders=(*(/))

	# 遍历每个文件夹
	for folder in $folders; do
  		# 进入文件夹
  		cd $folder
  
		# 检查当前分支
 		branch=$(git symbolic-ref --short HEAD 2>/dev/null)
  
		# 如果当前分支是"A"，则输出文件夹名称
		if [[ $branch == "$1" ]]; then
    			echo $folder
  		fi
  
  		# 返回上一级目录
  		cd ..
	done
}

function gitsearchpoj() {
    TARGET_BRANCH=$1
    for dir in */; do
        if [ -d "$dir/.git" ]; then
            (cd "$dir" && git branch --list $TARGET_BRANCH) | grep -q $TARGET_BRANCH
            if [ $? -eq 0 ]; then
                echo "$dir contains"
            fi
        fi
    done
}
