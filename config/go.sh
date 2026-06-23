# Go 环境。
export GOROOT=$HOME_DIR/soft/package/go
if [[ -d "$GOROOT/bin" && ":$PATH:" != *":$GOROOT/bin:"* ]]; then
    export PATH="$PATH:$GOROOT/bin"
fi

export GOPATH=$HOME_DIR/source/go
if [[ -d "$GOPATH/bin" && ":$PATH:" != *":$GOPATH/bin:"* ]]; then
    export PATH="$PATH:$GOPATH/bin"
fi

# 只影响当前 shell，不写入 go env。
export GOPROXY="https://go-mod-proxy.byted.org,https://goproxy.cn,https://proxy.golang.org,direct"
export GO111MODULE=on
export GOPRIVATE="*.byted.org,*.everphoto.cn,git.smartisan.com"
