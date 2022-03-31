#!/bin/bash - 
#===============================================================================
#
#          FILE: path_config.sh
# 
#         USAGE: ./path_config.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 02/10/15 21:17
#      REVISION:  ---
#===============================================================================

#
# Thrift Env Init
#
export THRIFT_HOME=$HOME_DIR/soft/package/thrift
export PATH=$THRIFT_HOME/bin:$PATH

#
# JAVA Env Init
#
export J_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/Current
export PATH=$J_HOME/Commands:$PATH

#
# MySQL Env Init
#
export MYSQL_HOME=$HOME_DIR/soft/package/mysql
export PATH=$MYSQL_HOME/bin:$PATH

#
# Python Env Init
#
export PYTHON_HOME=/Library/Frameworks/Python.framework/Versions/2.7
export PATH=$PYTHON_HOME/bin:$PATH

#
# Node.js Env Init
#
export NODEJS_HOME=$HOME_DIR/soft/package/node
export PATH=$NODEJS_HOME/bin:$PATH

#
# Protobuf Env Init
#
export PROTOBUF_HOME=$HOME_DIR/soft/package/protoc
export PATH=$PROTOBUF_HOME/bin:$PATH

#
# Nginx Env Unit
#
export NGINX_HOME=$HOME_DIR/soft/package/openresty/nginx
if [ ! -d $NGINX_HOME ]; then
    export NGINX_HOME=$HOME_DIR/soft/package/nginx
fi
export PATH=$NGINX_HOME/sbin:$PATH


#
export PATH=$PATH:/opt/local/bin:/opt/local/sbin

#
# add ffmpeg path
#
export FFMPEG_HOME=$HOME_DIR/soft/package/ffmpeg
export PATH=$FFMPEG_HOME:$PATH

#
# ffprobe
#
export FFPROBE_HOME="/usr/local/Cellar/ffmpeg"
export PATH=$FFPROBE_HOME/bin:$PATH



#
# add bison version
#
export BISON_HOME="/usr/local/opt/bison@2.7/bin"
export PATH=$BISON_HOME:$PATH

#
# add doas version
#
export DOAS_HOME="/Users/horizon/soft/package/doas"
export PATH=$PATH:$DOAS_HOME/bin

#
# add doas version
#
export WRK_HOME="/Users/horizon/soft/package/wrk"
export PATH=$PATH:$WRK_HOME/bin
