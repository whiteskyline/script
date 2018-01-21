#
# 支持开发机上相关的服务的启动
#

function dev_start() {
	BASE_DIR=~/repos/toutiao/aweme
	if [[ $1 == "api" ]]; then
		cd $BASE_DIR && runtime/bin/python app/api/bootstrap.py 9320
	elif [[ $1 == "notice" ]]; then
		cd $BASE_DIR && runtime/bin/python app/service/notice/bootstrap.py
	elif [[ $1 == "notice_async" ]]; then
		cd  $BASE_DIR/app/aweme_scripts/aweme_notice_async_db && ./bootstrap.sh /home/linmingxing/repos/toutiao/aweme/
	elif [[ $1 == "shell" ]]; then
		if [[ $# -gt 2 ]]; then
			echo "maybe these scripts will help you."
			cat ~/py_scripts/$3
		fi
		if [[ $2 == "api" ]]; then
			cd $BASE_DIR && runtime/bin/python app/api/manage.py shell
		elif [[ $2 == "notice" ]]; then
			cd $BASE_DIR/app/service/notice && ../../../runtime/bin/python
		fi
	fi
}

function dev_go() {
	BASE_DIR=~/repos/toutiao/aweme
	if [[ $1 == "logs" ]]; then
		cd $BASE_DIR/log
	fi
}

export TEST_ENV=True
