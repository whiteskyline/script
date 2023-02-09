#
# go
#
export GOROOT=$HOME_DIR/soft/package/go
export PATH=$PATH:$GOROOT/bin
export GOPATH=$HOME_DIR/source/go/
export PATH=$PATH:$GOPATH/bin
# export GONOPROXY=code.byted.org,gitlab.everphoto.cn,git.byted.org,sysrepo.byted.org,golang.org
# export GONOPROXY=code.byted.org,gitlab.everphoto.cn,git.byted.org,sysrepo.byted.org,golang.org,gopkg.in,github.com
# export GOPROXY="https://goproxy.byted.org,https://goproxy.cn,direct"
go env -w GOPROXY="https://goproxy.byted.org,https://goproxy.cn,direct"
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
    elif [[ $1 == "global.15" ]]; then
        cd $HOME_DIR/soft/package/ && rm -f go
        cd $HOME_DIR/soft/package/ && ln -s go.global.1.15.14 go
    elif [[ $1 == "global.16" ]]; then
        cd $HOME_DIR/soft/package/ && rm -f go
        cd $HOME_DIR/soft/package/ && ln -s go.global.1.16.15 go
    elif [[ $1 == "global.17" ]]; then
        cd $HOME_DIR/soft/package/ && rm -f go
        cd $HOME_DIR/soft/package/ && ln -s go.global.1.17.8 go
    elif [[ $1 == "global.18" ]]; then
        cd $HOME_DIR/soft/package/ && rm -f go
        cd $HOME_DIR/soft/package/ && ln -s go.global.1.18 go
    fi
    cd $current_dir
}

function go_update_dep_to()
{
    current_dir=`pwd`
    log_id=`gitlog | head -n 1 | awk '{print $2}'`
    current_prj_path=`git remote -v | grep push | awk '{print $2}' | awk -F'@|:' '{print $2"/"$3}' | awk -F'.git' '{print $1}'`
    echo "will update current prj to:$1, log id:$log_id"
    cd $GOPATH"/src/"$1 && go get $current_prj_path@$log_id
    cd $current_dir
}

function go_update_dep()
{
    current_dir=`pwd`
    dep_log_id=`cd $GOPATH"/src/"$1 && gitlog | head -n 1 | awk '{print $2}'`
    cd $current_dir
    echo "will update $1 -> $dep_log_id"
    go get $1@$dep_log_id
}

function sw_test()
{
    export TESTING_PREFIX="offline"
}

function sw_normal()
{
    
    export TESTING_PREFIX=""
}
