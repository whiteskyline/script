#!/bin/bash - 
# 通用别名和小工具。

# 渲染 Graphviz 图片。
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

# 通用别名。
alias ip="ifconfig"
alias draw="draw_image"

alias pc="pbcopy"
alias sc="screencapture -s -c"
alias hy="history"
alias cgrep="grep --color"
