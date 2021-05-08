# 对于项目直接跳转进行支持
function goprj()
{
  if [[ $1 == "ebtools" ]]; then
    cdd $SOURCE_BASE_DIR/personal/ebtools
  elif [[ $1 == "ascript" ]]; then
    cdd /Library/Services
  elif [[ $1 == "bitbar" ]]; then
    cdd $SOURCE_BASE_DIR/personal/bitbar_plugin
  fi
}
