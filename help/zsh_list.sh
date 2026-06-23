# 列出 zsh 内置说明。
MODULE_BASE_DIR=$LM_BASE_DIR
function listz() {
    MODULE_BASE_DIR=${SCRIPT_BASE_DIR:-/Users/horizon/script}/help
    cat $MODULE_BASE_DIR/zsh_list.log
}
