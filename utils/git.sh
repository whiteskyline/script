#!/bin/bash - 
# Git 常用命令。

alias gitv="open /Applications/Sourcetree.app"
alias gitg="git log --graph --decorate --oneline"
alias gitall="git log --graph --decorate --oneline --simplify-by-decoration --all"
alias gitlog='git log | more'
alias gitd="git diff"

# 设置当前分支 upstream。
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

# 删除已合并本地分支。
function gitclean() {
    echo "[info] current branch list:"
    git br
    git br | grep -v "*" | grep -v master | xargs git br -d
}

# 推送当前分支。
function gitpush() {
    current_branch=`git br | grep \* | awk '{print $2}'`
    git push origin $current_branch
}

# 查看最近提交。
function gitlast() {
    git log | head -n 24
}

# 生成新建 MR 链接。
function gitreview() {
    current_branch=`git br | grep \* | awk '{print $2}'`
    prefix=`git remote -v | grep push | awk '{print $2}' | awk -F'@|:' '{print $2"/"$3}' | awk -F'.git' '{print "https://"$1"/merge_requests/new?merge_request%5Bsource_branch%5D="}'`
    echo $prefix"$current_branch" 
}

# 生成 MR 列表链接。
function gitmrs() {
    current_branch=`git br | grep \* | awk '{print $2}'`
    prefix=`git remote -v | grep push | awk '{print $2}' | awk -F'@|:' '{print $2"/"$3}' | awk -F'.git' '{print "https://"$1"/merge_requests"}'`
    echo $prefix
}

export prev_branch="empty"
# 切换分支。
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

# 复制当前分支名。
function gitcbr() {
    git symbolic-ref --short HEAD 2>/dev/null | pbcopy
}

# 查找使用指定分支的子目录。
function git_list_all_br() {
	folders=(*(/))

	# 遍历子目录。
	for folder in $folders; do
  		# 进入子目录。
  		cd $folder
  
		# 读取当前分支。
 		branch=$(git symbolic-ref --short HEAD 2>/dev/null)
  
		# 命中则输出目录。
		if [[ $branch == "$1" ]]; then
    			echo $folder
  		fi
  
  		# 返回上级目录。
  		cd ..
	done
}

# 查找包含指定分支的项目。
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
