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

function go()
{
  if [[ $1 == "source" ]]; then
    cdd /Users/horizon/source
  elif [[ $1 == "video" ]]; then
    cdd /Users/horizon/src_st/video-stream
  elif [[ $1 == "keycenter" ]]; then
    cdd /Users/horizon/src_st/keycenter
  elif [[ $1 == "gemini" ]]; then
    cdd /Users/horizon/src_st/open-sources/gemini
  elif [[ $1 == "info" ]]; then
    cdd /Users/horizon/script_st/info_st/
  elif [[ $1 == "doc" ]]; then
    cdd /Users/horizon/src_st/documents/
  elif [[ $1 == "soft" ]]; then
    cdd /Users/horizon/soft_st/
  elif [[ $1 == "script" ]]; then
    cdd /Users/horizon/script
  elif [[ $1 == "nginx" ]]; then
    cdd /Users/horizon/soft/package/openresty/nginx
  fi
}
