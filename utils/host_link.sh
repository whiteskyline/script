# 主机间直连入口。

PEER_HOST_USER="ming.horizon"
PEER_HOST_ADDR="192.168.0.226"
PEER_HOST_TITLE="OpenClaw宿主机"

# SSH 到对端主机。
function ssh_slave() {
  printf '\033]0;%s\007' "$PEER_HOST_TITLE"

  echo "ssh $PEER_HOST_USER@$PEER_HOST_ADDR"
  ssh "$PEER_HOST_USER@$PEER_HOST_ADDR"
}

# 打开对端主机 VNC。
function vnc_slave() {
  echo "open vnc://$PEER_HOST_ADDR"
  open "vnc://$PEER_HOST_ADDR"
}
