#
# cd相关的功能
#
alias ..="cd .."
alias ..2="cd ../../"
alias ..3="cd ../../../"
alias ..4="cd ../../../../"
alias ..5="cd ../../../../../"

path_history=()

function newcd() {

  current_path=$1
  cd $current_path
  real_path=`pwd`
  path_history=($real_path ${path_history[@]})

}

function print_path_history() {
  length=${#path_history[@]}
  for ((i=1; i<=$length; i++))
  do
    echo "idx:"$i":"${path_history[$i]}
  done
}

function go_path_history() {
  number=$1
  cd ${path_history[$number]}
}

alias cdp="print_path_history"
alias cdn="go_path_history"
alias cdd="newcd"

function cdr() {
    cdd $HOME_DIR/"$1"
}
