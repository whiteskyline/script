# 跳转常用项目。
function goprj()
{
  AWEME_IM_GOPATH=$GOPATH/src/code.byted.org/aweme_im/
  if [[ $1 == "ebtools" ]]; then
    cdd $SOURCE_BASE_DIR/personal/ebtools
  elif [[ $1 == "ascript" ]]; then
    cdd /Library/Services
  elif [[ $1 == "bitbar" ]]; then
    cdd $SOURCE_BASE_DIR/personal/bitbar_plugin
  elif [[ $1 == "im_go_api" ]]; then
    cdd $AWEME_IM_GOPATH/im_go_api
  fi
}
