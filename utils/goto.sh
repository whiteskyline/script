# 目录跳转和内部页面入口。
# TODO: 拆成 nav/web。
# 跳转到预设目录。
function goto()
{
  export UHOME="/Users/bytedance/"
  declare -A location_map
  location_map[source]="$HOME_DIR/source"
  location_map[home]="$HOME_DIR/"
  location_map[soft]="$HOME_DIR/soft"
  location_map[script]="$HOME_DIR/script"
  location_map[aweme_im]="$HOME_DIR/source/go/src/code.byted.org/aweme_im"
  location_map[maya]="$HOME_DIR/source/go/sc/code.byted.org/maya"
  location_map[worklog]="$HOME_DIR/source/personal/bitbar_plugin/log"
  location_map[gomodcache]="$HOME_DIR/source/go/pkg/mod"

  location_map[tianya]="$UHOME/学习文档/天涯神帖"
  location_map[ldoc]="$UHOME/学习文档"

  location_map[ai_island]="$HOME_DIR/source/go/src/github.com/whiteskyline/ai_island"
  location_map[ai_sec]="$HOME_DIR/source/go/src/github.com/whiteskyline/ai_secretary"

  if [[ $1 == "help" ]]; then
    for key val in ${(kv)location_map}; do
      echo "$key:   $value"
    done
  fi

  for key val in ${(kv)location_map}; do
    if [[ $1 == $key ]]; then
      cdd $val
      return
    fi
  done
  for key val in ${(kv)location_map}; do
    if [[ "$1" == $key* || "$key" == $1* ]]; then
      echo "maybe you mean $key?"
    fi
  done
}

# 打开 TCE 服务页。
function seat()
{
  psm=$1
  open "https://cloud.bytedance.net/tce/services?keyword=$psm&page=1\&subs_prefer=true\&type=all\&x-resource-account=public"
}

# 打开 Argos 服务页。
function seaa()
{
  psm=$1
  open "https://cloud.bytedance.net/argos/overview/server_overview?from=now-1h&psm=$psm&region=cn&tab=overview&to=now&var-sidecar_psm=primary&x-resource-account=public"
}
