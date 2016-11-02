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
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_40.jdk/Contents/Home
export PATH=$JAVA_HOME/bin:$PATH
export CLASSPATH=.:$JAVA_HOME/lib:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar

#
# Maven Env Init
#
export MAVEN_HOME=/Users/horizon/soft/package/maven
export PATH=$MAVEN_HOME/bin:$PATH

#
# MySQL Env Init
#
export MYSQL_HOME=/Users/horizon/soft/package/mysql
export PATH=$MYSQL_HOME/bin:$PATH

#
# Python Env Init
#
export PYTHON_HOME=/System/Library/Frameworks/Python.framework/Versions/Current
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
export PROTOBUF_HOME=/Users/horizon/soft/package/protobuf
export PATH=$PROTOBUF_HOME/bin:$PATH
