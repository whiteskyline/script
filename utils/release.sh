#!/bin/bash - 
#===============================================================================
#
#          FILE: release_config.sh
# 
#         USAGE: ./release_config.sh 
# 
#   DESCRIPTION: 提供release脚本的一些快捷方式
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 02/10/15 20:30
#      REVISION:  ---
#===============================================================================

function r() {
	if [[ $# -lt 1 ]]; then
		echo "no project name provided"
		return -1
	fi
	GEMINI_DIR="/Users/horizon/src_st/open-sources/gemini/"
	CUR_DIR=`pwd`
	
	cd $GEMINI_DIR && sh release.sh $1
	cd $CUR_DIR
	
}

function rp() {
    if [[ $# -lt 2 ]]; then
        echo "no enough information to init project"
        echo "rp [SERVICE_NAME] [ROOT_DIR]"
        return -1
    fi

	GEMINI_DIR="/Users/horizon/src_st/open-sources/gemini/"
    CUR_DIR=`pwd`

    SERVICE_NAME=$1
    DIR=$2
    CONFIG_FILE=${GEMINI_DIR}config/$SERVICE_NAME/conf

    cd $GEMINI_DIR && sh init.sh $SERVICE_NAME $DIR
    echo "will go to gemini and add config/$SERVICE_NAME/conf, please check config"
    mkdir -p `dirname $CONFIG_FILE`
    touch $CONFIG_FILE
    echo "SERVICE_NAME = $SERVICE_NAME" >> $CONFIG_FILE
    echo "SERVICE_TYPE = fe" >> $CONFIG_FILE
    echo "RELEASE_PROJECT = $SERVICE_NAME" >> $CONFIG_FILE
    echo "COMPILE_ARG = $SERVICE_NAME=true" >> $CONFIG_FILE
    echo "RELEASE_DIR = target/appassembler" >> $CONFIG_FILE

    vim $CONFIG_FILE
    cd $CUR_DIR

}
