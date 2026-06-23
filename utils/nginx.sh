# Nginx 本地命令。

alias dev_nginx=$USER_HOME/soft/package/nginx/sbin/nginx

# 切换 PAC Nginx 配置。
function pac_nginx() {

	dev_nginx -s stop

	env=$1
	if [[ $env == "proxy" ]]; then
	    dev_nginx -c $USER_HOME/soft/config/nginx/nginx-dev.conf
	elif [[ $env == "direct" ]]; then
	    dev_nginx -c $USER_HOME/soft/config/nginx/nginx-direct.conf
	fi
}
