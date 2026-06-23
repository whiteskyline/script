# 列出本次新增命令。
# 兼容 bash 和 zsh。
if (( $+commands[compgen] )); then
    NOW_ALL_FUNC=(`compgen -c`)
else
    NOW_ALL_FUNC=(${(k)commands} ${(k)functions} ${(k)aliases})
fi
DIFF_ALL_FUNC=(`echo $BASE_ALL_FUNC $NOW_ALL_FUNC | tr ' ' '\n' | sort | uniq -c | awk '$1==1{print $2}'`)
function listf() {
    declare -A commands
    echo $DIFF_ALL_FUNC
    echo $DIFF_ALL_FUNC | tr ' ' '\n' | while read -r line; do
        key=$(echo "$line" | awk '{print substr($0, 1, 2)}')
        if [ -z "${commands[$key]}" ]; then
          commands[$key]="created"
          echo " "
          echo "--- $key内置命令组 ---"
        fi
        echo $line
    done
}
