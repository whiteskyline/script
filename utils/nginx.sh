#
# Nginx`s commands
#

alias dev_nginx=$USER_HOME/soft/package/nginx/sbin/nginx

function pac_nginx() {

	dev_nginx -s stop

	env=$1
	if [[ $env == "proxy" ]]; then
	    dev_nginx -c $USER_HOME/soft/config/nginx/nginx-dev.conf
	elif [[ $env == "direct" ]]; then
	    dev_nginx -c $USER_HOME/soft/config/nginx/nginx-direct.conf
	fi
}
