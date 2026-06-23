# 列出环境变量说明。
MODULE_BASE_DIR=$LM_BASE_DIR
function listv() {
    MODULE_BASE_DIR=${SCRIPT_BASE_DIR:-/Users/horizon/script}/help
    cat $MODULE_BASE_DIR/env_list.log
}
