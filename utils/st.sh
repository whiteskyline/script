# 设置终端标题。

export DISABLE_AUTO_TITLE="true"

function st() {
  TITLE=$1
  echo -n "\ek${TITLE:-$CMD}\e\\"
}
