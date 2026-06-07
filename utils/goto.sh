# 和goto相关的一些内容
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

function seat()
{
  psm=$1
  open "https://cloud.bytedance.net/tce/services?keyword=$psm&page=1\&subs_prefer=true\&type=all\&x-resource-account=public"
}

function seaa()
{
  psm=$1
  open "https://cloud.bytedance.net/argos/overview/server_overview?from=now-1h&psm=$psm&region=cn&tab=overview&to=now&var-sidecar_psm=primary&x-resource-account=public"
}

function _leipi_peer_ip() {
  local dev="${1:-bridge0}"

  arp -an 2>/dev/null \
    | awk -v dev="$dev" '
      $0 ~ " on " dev " " && $2 ~ /^\([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+\)$/ {
        gsub(/[()]/, "", $2)
        if ($2 !~ /^224\.|^239\.|^255\.|^0\./) {
          print $2
          exit
        }
      }
    '
}

function ssh_leipi() {
  local dev="${1:-bridge0}"
  local user="ming.horizon"
  local title="OpenClaw宿主机"
  local addr

  addr=$(_leipi_peer_ip "$dev")

  if [[ -z "$addr" ]]; then
    echo "没在 $dev 上发现可登录设备。"
    echo "可先执行: arp -an | grep ' on $dev '"
    return 1
  fi

  printf '\033]0;%s\007' "$title"

  echo "ssh $user@$addr"
  ssh "$user@$addr"
}

function vnc_leipi() {
  local dev="${1:-bridge0}"
  local addr

  addr=$(_leipi_peer_ip "$dev")

  if [[ -z "$addr" ]]; then
    echo "没在 $dev 上发现可屏幕共享的设备。"
    echo "可先执行: arp -an | grep ' on $dev '"
    return 1
  fi

  echo "open vnc://$addr"
  open "vnc://$addr"
}
