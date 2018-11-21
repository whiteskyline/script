#
# 支持开发机上相关的服务的启动
#

function script_test() {
	CURRENT_DIR=`pwd`
	BASE_DIR=~/repos/toutiao/aweme
	SCRIPT_DIR=$1
	cd $BASE_DIR && runtime/bin/python app/aweme_scripts/$SCRIPT_DIR/handler.py
	cd $CURRENT_DIR
}

function unit_test() {
	CURRENT_DIR=`pwd`
	BASE_DIR=~/repos/toutiao/aweme
	SCRIPT_DIR=$1
	cd $BASE_DIR && runtime/bin/python app/aweme_scripts/$SCRIPT_DIR/total_test.py
	cd $CURRENT_DIR
}

function dev_debug() {
	if [[ $1 == "api_feed" ]]; then
		export IS_TEST_ENV="True"
		cd $BASE_DIR && runtime/bin/python app/api_feed/manage.py shell
	elif [[ $1 == "bs_search" ]]; then
		cd $BASE_DIR/app/bs_search && ../../runtime/bin/python bs_search_api/manage.py shell
	elif [[ $1 == "admin" ]]; then
		cd $BASE_DIR/app/admin && ../../runtime/bin/python manage.py shell
	fi
}

function dev_start() {
	CURRENT_DIR=`pwd`
	BASE_DIR=~/repos/toutiao/aweme
	if [[ $1 == "api" ]]; then
		cd $BASE_DIR && runtime/bin/python app/api/bootstrap.py 9320
	elif [[ $1 == "admin" ]]; then
		cd $BASE_DIR && runtime/bin/python app/admin/bootstrap.py 10020
	elif [[ $1 == "model_update" ]]; then
		cd $BASE_DIR && runtime/bin/python app/douyin_cip/model_update/send_data_tpl.py
	elif [[ $1 == "message" ]]; then
		cd $BASE_DIR && runtime/bin/python app/douyin_cip/util/send_data_tpl.py
	elif [[ $1 == "bs_user" ]]; then
		cd $BASE_DIR/app/bs_user && ../../runtime/bin/python bs_user_api/bootstrap.py 9520
	elif [[ $1 == "bs_aweme" ]]; then
		cd $BASE_DIR/app/bs_aweme && ../../runtime/bin/python bs_aweme_api/bootstrap.py 9720
	elif [[ $1 == "bs_main" ]]; then
		cd $BASE_DIR/app/bs_main && ../../runtime/bin/python bs_main_api/bootstrap.py 9920
	elif [[ $1 == "bs_search" ]]; then
		export IS_TEST_ENV="True"
		cd $BASE_DIR/app/bs_search && ../../runtime/bin/python bs_search_api/bootstrap.py 9930
	elif [[ $1 == "api_feed" ]]; then
		export IS_TEST_ENV="True"
		cd $BASE_DIR && runtime/bin/python app/api_feed/bootstrap.py 9620
	elif [[ $1 == "notice" ]]; then
		cd $BASE_DIR && runtime/bin/python app/service/notice/bootstrap.py 10220
	elif [[ $1 == "user" ]]; then
		cd $BASE_DIR && runtime/bin/python app/service/user/bootstrap.py 10205
	elif [[ $1 == "golink" ]]; then
		cd /home/linmingxing/source/company/go/src/code.byted.org/aweme/golink && output/bin/ies.link.golink  -conf=output/conf/ies_link_golink.yml -svc=ies.link.golink -port=9090
	elif [[ $1 == "notice_async" ]]; then
		cd  $BASE_DIR/app/aweme_scripts/aweme_notice_async_db && ./bootstrap.sh /home/linmingxing/repos/toutiao/aweme/
	elif [[ $1 == "gouser_async" ]]; then
		cd  $BASE_DIR/app/aweme_scripts/aweme_user_async_db && ./bootstrap.sh /home/linmingxing/repos/toutiao/aweme/
	elif [[ $1 == "inter_async" ]]; then
		cd  $BASE_DIR/app/aweme_scripts/interactive_notice && ./bootstrap.sh /home/linmingxing/repos/toutiao/aweme/
	elif [[ $1 == "notice_db_sync" ]]; then
		cd  $BASE_DIR/app/aweme_scripts/notice_db_sync && ./bootstrap.sh /home/linmingxing/repos/toutiao/aweme/
	elif [[ $1 == "interactive_notice" ]]; then
		export IS_SYSTEM_TEST_ENV="1"
		cd  $BASE_DIR/app/aweme_scripts/interactive_notice && ./bootstrap.sh /home/linmingxing/repos/toutiao/aweme/
	elif [[ $1 == "comment_pipeline" ]]; then
		cd  $BASE_DIR/app/aweme_scripts/comment_message_pipeline_script && ./bootstrap.sh /home/linmingxing/repos/toutiao/aweme/
	elif [[ $1 == "comment_pipeline_test" ]]; then
		cd $BASE_DIR && runtime/bin/python app/aweme_scripts/comment_message_pipeline_script/handler.py
	elif [[ $1 == "push_test" ]]; then
		cd $BASE_DIR && runtime/bin/python app/aweme_scripts/interactive_notice/test_push_merge.py
	elif [[ $1 == "sync_item_change_to_aweme" ]]; then
		cd  $BASE_DIR/app/aweme_scripts/sync_item_change_to_aweme && ./bootstrap.sh /home/linmingxing/repos/toutiao/aweme/
	elif [[ $1 == "notice_manual_sync" ]]; then
		cd  $BASE_DIR/app/aweme_scripts/notice_manual_db_sync && ./bootstrap.sh /home/linmingxing/repos/toutiao/aweme/
	elif [[ $1 == "notice_offline_delete" ]]; then
		cd  $BASE_DIR/app/aweme_scripts/notice_offline_delete && ./bootstrap.sh /home/linmingxing/repos/toutiao/aweme/
	elif [[  $1 == "gouser" ]]; then
		cd /data01/users/linmingxing/source/company/go/src/code.byted.org/aweme/gouser && output/bin/aweme.user.gouser  -conf=output/conf/aweme_user_gouser.yml -rpc=/data01/users/linmingxing/repos/toutiao/aweme/conf -svc=aweme.user.gouser -port=9090
	elif [[ $1 == "gouser_debug" ]]; then
		cd /data01/users/linmingxing/source/company/go/src/code.byted.org/aweme/gouser && output/bootstrap.sh
	elif [[  $1 == "review" ]]; then
		unset CONF_ENV
		cd /data01/users/linmingxing/source/company/go/src/code.byted.org/aweme/review && output/bin/aweme.review.review  -conf=output/conf/aweme_review_review.yml -rpc=/data01/users/linmingxing/repos/toutiao/aweme/conf -svc=aweme.review.review -port=10400
	elif [[  $1 == "goapi" ]]; then
		cd /data01/users/linmingxing/source/company/go/src/code.byted.org/aweme/goapi/output && ./bootstrap.sh
	elif [[  $1 == "golink" ]]; then
		cd /data01/users/linmingxing/source/company/go/src/code.byted.org/aweme/golink && output/bin/aweme.link.golink -conf=output/conf/aweme_link_golink.yml -rpc=/data01/users/linmingxing/repos/toutiao/aweme/conf -log=/tmp/log/ -svc=aweme.link.golink -port=
	elif [[  $1 == "user_cert" ]]; then
		cd /data01/users/linmingxing/source/company/go/src/code.byted.org/aweme/user_cert && output/bin/aweme.user.cert -conf=output/conf/aweme_user_cert.yml -rpc=/data01/users/linmingxing/repos/toutiao/aweme/conf -svc=aweme.user.cert -port=
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
	cd $CURRENT_DIR
}

export BASE_DIR=~/repos/toutiao/aweme
alias dev_py="$BASE_DIR/runtime/bin/python"

function dev_go() {
	BASE_DIR=~/repos/toutiao/aweme
	if [[ $1 == "logs" ]]; then
		cd $BASE_DIR/log
	elif [[ $1 == "api" ]]; then
		cd /data01/users/linmingxing/repos/toutiao/aweme/app/api
	elif [[ $1 == "gouser" ]]; then
		cd /data01/users/linmingxing/source/company/go/src/code.byted.org/aweme/gouser 
	elif [[ $1 == "golink" ]]; then
		cd /data01/users/linmingxing/source/company/go/src/code.byted.org/aweme/golink
	elif [[ $1 == "notice" ]]; then
		cd /data01/users/linmingxing/repos/toutiao/aweme/app/service/notice
	elif [[ $1 == "aweme_scripts" ]]; then
		cd /data01/users/linmingxing/repos/toutiao/aweme/app/aweme_scripts
	elif [[ $1 == "common" ]]; then
		cd /data01/users/linmingxing/repos/toutiao/aweme/app/common
	elif [[ $1 == "api_common" ]]; then
		cd /data01/users/linmingxing/repos/toutiao/aweme/app/api_common
	elif [[ $1 == "api_feed" ]]; then
		cd /data01/users/linmingxing/repos/toutiao/aweme/app/api_feed
	elif [[ $1 == "bs_main" ]]; then
		cd /data01/users/linmingxing/repos/toutiao/aweme/app/bs_main
	elif [[ $1 == "bs_user" ]]; then
		cd /data01/users/linmingxing/repos/toutiao/aweme/app/bs_user
	fi
}

export TEST_ENV=True
