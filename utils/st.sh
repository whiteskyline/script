#
# 生成Set Title的函数，方便修改Title
#

export DISABLE_AUTO_TITLE="true"

function st() {
  TITLE=$1
  echo -n "\ek${TITLE:-$CMD}\e\\"
}
