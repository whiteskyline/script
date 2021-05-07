# 和goto相关的一些内容
function goto()
{
  if [[ $1 == "source" ]]; then
    cdd $HOME_DIR/source
  elif [[ $1 == "video" ]]; then
    cdd $HOME_DIR/src_st/video-stream
  elif [[ $1 == "home" ]]; then
    cdd $HOME_DIR/
  elif [[ $1 == "doc" ]]; then
    cdd $HOME_DIR/src_st/documents/
  elif [[ $1 == "soft" ]]; then
    cdd $HOME_DIR/soft/
  elif [[ $1 == "script" ]]; then
    cdd $HOME_DIR/script
  elif [[ $1 == "nginx" ]]; then
    cdd $HOME_DIR/soft/package/nginx
  elif [[ $1 == "worklog" ]]; then
    cdd $HOME_DIR/source/personal/bitbar_plugin/log
  fi
}
