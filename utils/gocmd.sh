# 对于gocmd命令进行支持
function gocmd() {
    target_command=$1
    real_cmd_path=`which $1`
    if [[ $? -ne 0 ]]; then
        echo "command $1 not found."
        return
    fi
    cmd_dir=`dirname $real_cmd_path`
    cd $cmd_dir
}
