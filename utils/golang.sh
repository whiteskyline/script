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

# 切换本地 Go 版本。
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

# 把当前仓库提交更新到指定模块。
function go_update_dep_to()
{
    current_dir=`pwd`
    log_id=`gitlog | head -n 1 | awk '{print $2}'`
    current_prj_path=`git remote -v | grep push | awk '{print $2}' | awk -F'@|:' '{print $2"/"$3}' | awk -F'.git' '{print $1}'`
    echo "will update current prj to:$1, log id:$log_id"
    cd $GOPATH"/src/"$1 && go get $current_prj_path@$log_id
    cd $current_dir
}

# 把当前模块依赖更新到本地最新提交。
function go_update_dep()
{
    current_dir=`pwd`
    dep_log_id=`cd $GOPATH"/src/"$1 && gitlog | head -n 1 | awk '{print $2}'`
    cd $current_dir
    echo "will update $1 -> $dep_log_id"
    go get $1@$dep_log_id
}

# 合并 master，但保留当前 go.mod/go.sum。
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

# 合并 master 后恢复 go.mod/go.sum。
function go_mr_master_uc()
{
    br=`git branch | grep "*"`  
    cp go.mod go.sum /tmp/
    git merge master
    cp /tmp/go.mod /tmp/go.sum ./
}

# 切换到测试前缀。
function sw_test()
{
    export TESTING_PREFIX="offline"
}

# 恢复普通前缀。
function sw_normal()
{
    
    export TESTING_PREFIX=""
}

# 查找非测试 Go 文件。
function find_all_dep()
{
    TARGET_PATH=$1
    find "$1" -maxdepth 1 -name "*.go" | grep -v test
}

# 跑单个 Go 测试函数。
function go_test_unit()
{
    TEST_FILE=$1
    TEST_DEP=$2
    TEST_FUNC=$3
    go test -gcflags="all=-l -N" -v -run $TEST_FUNC $TEST_FILE `find_all_dep $TEST_DEP`
}

# 跑全部 Go 测试。
function go_test_all()
{
    TEST_FILE=$1
    TEST_DEP=$2
    go test -gcflags="all=-l -N" -v $TEST_FILE `find_all_dep $TEST_DEP`
}
