#!/bin/bash - 
#===============================================================================
#
#          FILE: alias_loader.sh
# 
#         USAGE: ./alias_loader.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 01/22/15 10:41
#      REVISION:  ---
#===============================================================================

#
# 绘制图形
#
function draw_image()
{
	FILE_NAME=/tmp/`od -An -N32 -i /dev/random | openssl md5`.png
	K_option=""
	if [ $# -gt 1 ]; then
		K_option="-K$2"
	fi
	dot -Tpng $1 -o $FILE_NAME $K_option
	if [ $? -ne 0 ]; then
		echo "parse image failed"
		return 1
	else
		open $FILE_NAME
	fi
}

#
# relay functions
#
function relay()
{
    ssh linmingxing@10.6.131.79
}

#
# alias for ipa
#
alias ip="ifconfig"
alias draw="draw_image"
alias godesktop="ssh root@desktop"
alias gohost="ssh root@47.92.27.223"
alias gowork="ssh work@47.92.27.223"
alias sb="open -a '/Applications/Sublime Text.app'"
alias chrome="open -a 'Google Chrome' --args --disable-web-security --user-data-dir='/Users/horizon/data_st/soft/chrome'" 
alias antlr4='java -Xmx500M -cp "/Users/horizon/src_st/open/antlrtest/antlr-4.5-complete.jar" org.antlr.v4.Tool'
alias antlr3='java -Xmx500M -cp "/Users/horizon/src_st/open/antlrtest/antlr-3.5.2-complete.jar" org.antlr.Tool'
alias grun='java org.antlr.v4.runtime.misc.TestRig'
alias gitlog='git log | more'

function genand() {
    rm -rf gene
    gen $1 android * * gene
} 

alias pc="pbcopy"
alias sc="screencapture -s -c"
alias hy="history"

function mvnmini() {
    target_project=$1
    mvn -T4 -DskipTests -am -pl $target_project clean package
}

