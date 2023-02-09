# 和goto相关的一些内容
function goto()
{
  if [[ $1 == "source" ]]; then
    cdd $HOME_DIR/source
  elif [[ $1 == "home" ]]; then
    cdd $HOME_DIR/
  elif [[ $1 == "soft" ]]; then
    cdd $HOME_DIR/soft/
  elif [[ $1 == "script" ]]; then
    cdd $HOME_DIR/script
  elif [[ $1 == "aweme_im" ]]; then
    cdd $HOME_DIR/source/go/src/code.byted.org/aweme_im
  elif [[ $1 == "maya" ]]; then
    cdd $HOME_DIR/source/go/src/code.byted.org/maya
  elif [[ $1 == "worklog" ]]; then
    cdd $HOME_DIR/source/personal/bitbar_plugin/log
  fi
}
