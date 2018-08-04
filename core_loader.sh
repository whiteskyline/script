#!/bin/bash - 
#===============================================================================
#
#          FILE: core_loader.sh
# 
#         USAGE: ./core_loader.sh 
# 
#   DESCRIPTION: try to load all folders`s loader.sh file
#					1) set BASE_DIR
#					2) load base scripts
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: linmingxing
#  ORGANIZATION: 
#       CREATED: 01/13/15 14:24
#      REVISION:  ---
#===============================================================================

#
# set env base value
#
export HOME_DIR="/home/linmingxing"
export CORE_BASE_DIR="$HOME_DIR/script"

#
# 载入每个模块
#
function load_module()
{
	MODULE=$1
	LM_BASE_DIR=`dirname $MODULE`
	CUR_DIR=`pwd`
	cd $LM_BASE_DIR

	source $MODULE

	cd $CUR_DIR
}

#
# 初始化每个模块用到的
#
# echo "find $CORE_BASE_DIR -maxdepth 2 -name "loader.support" -exec echo {} \;"
MODULES=(`find $CORE_BASE_DIR -maxdepth 2 -name "loader.support" -exec echo {} \;`)
for module in ${MODULES[@]};
do
	load_module $module
done
