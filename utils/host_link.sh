# 主机间直连入口。

# 获取桥接设备 IP。
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

# 发现桥接设备并 SSH。
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

# 发现桥接设备并打开 VNC。
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

# 解析主机别名。
function _di_host_name() {
  case "$1" in
    m1) echo "MacBookProM1.local" ;;
    m2) echo "MacBookProM2.local" ;;
    intel) echo "MacBookProIntel.local" ;;
    *)
      echo "用法: $2 m1|m2|intel" >&2
      return 1
      ;;
  esac
}

# 解析登录用户。
function _di_host_user() {
  case "$1" in
    m1|intel) echo "ming.horizon" ;;
    m2) echo "bytedance" ;;
    *)
      echo "用法: $2 m1|m2|intel" >&2
      return 1
      ;;
  esac
}

# SSH 到指定主机。
function dissh() {
  local host
  local user

  host=$(_di_host_name "$1" "dissh") || return 1
  user=$(_di_host_user "$1" "dissh") || return 1
  printf '\033]0;%s\007' "$host"

  echo "ssh $user@$host"
  ssh "$user@$host"
}

# 打开指定主机 VNC。
function divnc() {
  local host

  host=$(_di_host_name "$1" "divnc") || return 1
  echo "open vnc://$host"
  open "vnc://$host"
}

# 复制文件到指定主机。
function discp() {
  local target="$1"
  local host_key="$2"
  local remote_dir="${3:-~/Downloads/}"
  local host
  local user

  if [[ -z "$target" || -z "$host_key" ]]; then
    echo "用法: discp target m1|m2|intel [remote_dir]" >&2
    return 1
  fi

  host=$(_di_host_name "$host_key" "discp") || return 1
  user=$(_di_host_user "$host_key" "discp") || return 1

  echo "scp $target $user@$host:$remote_dir"
  scp "$target" "$user@$host:$remote_dir"
}
