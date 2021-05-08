#
# go
#
export GOROOT=$HOME_DIR/soft/package/go
export PATH=$PATH:$GOROOT/bin
export GOPATH=$HOME_DIR/source/go/
# export GONOPROXY=code.byted.org,gitlab.everphoto.cn,git.byted.org,sysrepo.byted.org,golang.org
# export GONOPROXY=code.byted.org,gitlab.everphoto.cn,git.byted.org,sysrepo.byted.org,golang.org,gopkg.in,github.com
# export GOPROXY="https://goproxy.byted.org,https://goproxy.cn,direct"
go env -w GOPROXY="https://goproxy.byted.org|https://goproxy.cn|direct"
export GO111MODULE=on
export GOPRIVATE="*.byted.org,*.everphoto.cn,git.smartisan.com"
export GOSUMDB=off

function switch_go()
{
    current_dir=`pwd`
    if [[ $1 == "byted" ]]; then
        cd $HOME_DIR/soft/package/ && rm -f go
        cd $HOME_DIR/soft/package/ && ln -s go.byted.1.12.1 go
    elif [[ $1 == "global" ]]; then
        cd $HOME_DIR/soft/package/ && rm -f go
        cd $HOME_DIR/soft/package/ && ln -s go.global.1.12.4 go
    elif [[ $1 == "global.13" ]]; then
        cd $HOME_DIR/soft/package/ && rm -f go
        cd $HOME_DIR/soft/package/ && ln -s go.global.1.13.15 go
    elif [[ $1 == "global.14" ]]; then
        cd $HOME_DIR/soft/package/ && rm -f go
        cd $HOME_DIR/soft/package/ && ln -s go.global.1.14.13 go
    fi
    cd $current_dir
}
