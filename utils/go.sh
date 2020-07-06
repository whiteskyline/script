#
# go
#
export GOROOT=$DEV_HOME/soft/package/go
export PATH=$PATH:$GOROOT/bin
export GOPATH=$DEV_HOME/source/go/
export GONOPROXY=code.byted.org,gitlab.everphoto.cn,git.byted.org,sysrepo.byted.org,golang.org
# export GONOPROXY=code.byted.org,gitlab.everphoto.cn,git.byted.org,sysrepo.byted.org,golang.org,gopkg.in,github.com
export GOPROXY="https://go-mod-proxy.byted.org"
export GO111MODULE=on
export GOPRIVATE='*byted.org'

function switch_go()
{
    current_dir=`pwd`
    if [[ $1 == "byted" ]]; then
        cd $DEV_HOME/soft/package/ && rm -f go
        cd $DEV_HOME/soft/package/ && ln -s go.byted.1.12.1 go
    elif [[ $1 == "global" ]]; then
        cd $DEV_HOME/soft/package/ && rm -f go
        cd $DEV_HOME/soft/package/ && ln -s go.global.1.12.4 go
    elif [[ $1 == "global.13" ]]; then
        cd $DEV_HOME/soft/package/ && rm -f go
        cd $DEV_HOME/soft/package/ && ln -s go.global.1.13.12 go
    fi
    cd $current_dir
}
