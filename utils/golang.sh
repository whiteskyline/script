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
go env -w GOPROXY="https://go-mod-proxy.byted.org,https://goproxy.cn,https://proxy.golang.org,direct"
export GO111MODULE=on
export GOPRIVATE="*.byted.org,*.everphoto.cn,git.smartisan.com"

function switch_go()
{
    current_dir=`pwd`
    if [[ $1 == "byted" ]]; then
        cd $HOME_DIR/soft/package/ && rm -f go
        cd $HOME_DIR/soft/package/ && ln -s go.byted.1.12.1 go
    elif [[ $1 == "global" ]]; then
        cd $HOME_DIR/soft/package/ && rm -f go
        cd $HOME_DIR/soft/package/ && ln -s go.global.1.12.4 go
    elif [[ $1 == "global.16" ]]; then
        cd $HOME_DIR/soft/package/ && rm -f go
        cd $HOME_DIR/soft/package/ && ln -s go.global.1.16.15 go
    elif [[ $1 == "global.17" ]]; then
        cd $HOME_DIR/soft/package/ && rm -f go
        cd $HOME_DIR/soft/package/ && ln -s go.global.1.17.9 go
    elif [[ $1 == "global.18" ]]; then
        cd $HOME_DIR/soft/package/ && rm -f go
        cd $HOME_DIR/soft/package/ && ln -s go.global.1.18.9 go
    elif [[ $1 == "global.19" ]]; then
        cd $HOME_DIR/soft/package/ && rm -f go
        cd $HOME_DIR/soft/package/ && ln -s go.global.1.19.13 go
    elif [[ $1 == "global.20" ]]; then
        cd $HOME_DIR/soft/package/ && rm -f go
        cd $HOME_DIR/soft/package/ && ln -s go.global.1.20.14 go
    elif [[ $1 == "global.21" ]]; then
        cd $HOME_DIR/soft/package/ && rm -f go
        cd $HOME_DIR/soft/package/ && ln -s go.global.1.21.13 go
    elif [[ $1 == "global.22" ]]; then
        cd $HOME_DIR/soft/package/ && rm -f go
        cd $HOME_DIR/soft/package/ && ln -s go.global.1.22.10 go
    elif [[ $1 == "global.23" ]]; then
        cd $HOME_DIR/soft/package/ && rm -f go
        cd $HOME_DIR/soft/package/ && ln -s go.global.1.23.7 go
    elif [[ $1 == "global.26" ]]; then
        cd $HOME_DIR/soft/package/ && rm -f go
        cd $HOME_DIR/soft/package/ && ln -s go.global.1.26.4 go
    fi
    cd $current_dir
    go version
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

function go_mr_master_um()
{
    br=`git branch | grep "*"`  
    current_branch=`echo ${br/* /}`
    git co master
    cp go.mod go.sum /tmp/
    git co $current_branch
    git merge master
    cp /tmp/go.mod /tmp/go.sum ./
}

function go_mr_master_uc()
{
    br=`git branch | grep "*"`  
    cp go.mod go.sum /tmp/
    git merge master
    cp /tmp/go.mod /tmp/go.sum ./
}

function sw_test()
{
    export TESTING_PREFIX="offline"
}

function sw_normal()
{
    
    export TESTING_PREFIX=""
}

function find_all_dep()
{
    TARGET_PATH=$1
    find "$1" -maxdepth 1 -name "*.go" | grep -v test
}

function go_test_unit()
{
    TEST_FILE=$1
    TEST_DEP=$2
    TEST_FUNC=$3
    go test -gcflags="all=-l -N" -v -run $TEST_FUNC $TEST_FILE `find_all_dep $TEST_DEP`
}

function go_test_all()
{
    TEST_FILE=$1
    TEST_DEP=$2
    go test -gcflags="all=-l -N" -v $TEST_FILE `find_all_dep $TEST_DEP`
}
