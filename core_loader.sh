#!/bin/bash - 
# 加载所有脚本模块。

# 设置基础目录。
if [ `uname` = 'Darwin' ]
then
	export HOME_DIR="${HOME_DIR:-$HOME}"
else
	export HOME_DIR="/home/linmingxing"
fi
export SCRIPT_BASE_DIR="$HOME_DIR/script"
export SOURCE_BASE_DIR="$HOME_DIR/source"

# 加载单个模块。
function load_module()
{
	MODULE=$1
	LM_BASE_DIR=`dirname $MODULE`
	CUR_DIR=`pwd`
	cd $LM_BASE_DIR

    export LM_BASE_DIR
	source $MODULE

	cd $CUR_DIR
}

# 加载各目录的 loader.support。
MODULES=(`find $SCRIPT_BASE_DIR -maxdepth 2 -name "loader.support" -exec echo {} \;`)
for module in ${MODULES[@]};
do
	load_module $module
done
