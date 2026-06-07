# 内置命令使用说明
MODULE_BASE_DIR=$LM_BASE_DIR
function listz() {
    MODULE_BASE_DIR=/Users/horizon/script/help
    FNAME=$MODULE_BASE_DIR/zash_list.log
    line_num=`wc -l < $FNAME`
    cat $FNAME | head -n 1
    declare -A commands
    cat $FNAME | tail -n $(($line_num - 1)) | sort | while read -r line; do
        key=$(echo "$line" | awk '{print substr($0, 1, 2)}')
        if [ -z "${commands[$key]}" ]; then
          commands[$key]="created"
          echo " "
          echo "--- $key内置Z命令组 ---"
        fi
        echo $line
    done
}
