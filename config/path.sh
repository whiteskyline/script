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
export THRIFT_HOME=/Users/horizon/soft/package/thrift
export PATH=$THRIFT_HOME/bin:$PATH

#
# ARC Env Init
#
export ARC_HOME=/Users/horizon/soft/package/arcanist
export PATH=$ARC_HOME/bin:$PATH

#
# Scala Env Init
#
export SCALA_HOME=/Users/horizon/soft/package/scala
export PATH=$SCALA_HOME/bin:$PATH

#
# JAVA Env Init
#
export J_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/Current
export PATH=$J_HOME/Commands:$PATH
# export CLASSPATH=.:$JAVA_HOME/lib:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar

#
# Maven Env Init
#
export MAVEN_HOME=/Users/horizon/soft/package/apache-maven
export PATH=$MAVEN_HOME/bin:$PATH

#
# MySQL Env Init
#
export MYSQL_HOME=/Users/horizon/soft/package/mysql
export PATH=$MYSQL_HOME/bin:$PATH

#
# Python Env Init
#
export PYTHON_HOME=/Library/Frameworks/Python.framework/Versions/2.7
export PATH=$PYTHON_HOME/bin:$PATH

#
# Gradle Env Init
#
export GRADLE_HOME=/Users/horizon/soft/package/gradle
export PATH=$GRADLE_HOME/bin:$PATH

#
# Node.js Env Init
#
export NODEJS_HOME=/Users/horizon/soft/package/nodejs
export PATH=$NODEJS_HOME/bin:$PATH

#
# SBT Env Init
#
export SBT_HOME=/Users/horizon/soft/package/sbt
export PATH=$SBT_HOME/bin:$PATH

#
# Ant Env Ini
#
export ANT_HOME=/Users/horizon/soft/package/ant
export PATH=$ANT_HOME/bin:$PATH

#
# Protobuf Env Init
#
export PROTOBUF_HOME=/Users/horizon/soft/package/protoc
export PATH=$PROTOBUF_HOME/bin:$PATH

#
# Nginx Env Unit
#
export NGINX_HOME=/Users/horizon/soft/package/openresty/nginx
export PATH=$NGINX_HOME/sbin:$PATH

#
# REPO Env Init
#
export REPO_HOME=/Users/horizon/soft/package/repo
export PATH=$REPO_HOME/bin:$PATH

#
#
#
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

export GRADLE_HOME=/Users/horizon/soft/package/gradle
export PATH=$GRADLE_HOME/bin:$PATH

export ANDROID_HOME=/Users/horizon/soft/package/android-sdk
export PATH=$ANDROID_HOME/platform-tools:$PATH
