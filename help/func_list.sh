# 支持所有的command的内容
NOW_ALL_FUNC=(`compgen -c`)
DIFF_ALL_FUNC=(`echo $BASE_ALL_FUNC $NOW_ALL_FUNC | tr ' ' '\n' | sort | uniq -c | awk '$1==1{print $2}'`)
function flist() {
    echo $DIFF_ALL_FUNC | tr ' ' '\n'
}
