# 和goto相关的一些内容
function goto()
{
  if [[ $1 == "source" ]]; then
    cdd /Users/horizon/source
  elif [[ $1 == "video" ]]; then
    cdd /Users/horizon/src_st/video-stream
  elif [[ $1 == "home" ]]; then
    cdd /Users/horizon/
  elif [[ $1 == "doc" ]]; then
    cdd /Users/horizon/src_st/documents/
  elif [[ $1 == "soft" ]]; then
    cdd /Users/horizon/soft/
  elif [[ $1 == "script" ]]; then
    cdd /Users/horizon/script
  elif [[ $1 == "nginx" ]]; then
    cdd /Users/horizon/soft/package/nginx
  elif [[ $1 == "worklog" ]]; then
    cdd /Users/horizon/source/personal/bitbar_plugin/log
  fi
}
