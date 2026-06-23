# MySQL 本地命令。
MYSQL_HOME=$HOME_DIR/soft/package/mysql
MYSQL_CONF_HOME=$HOME_DIR/soft/config/mysql
alias mysqld_safe="cd $MYSQL_HOME && nohup $MYSQL_HOME/bin/mysqld_safe --defaults-file=$MYSQL_CONF_HOME/my.cnf & > /tmp/mysql.start.log"
alias mysqladmin="$MYSQL_HOME/bin/mysqladmin -uroot -p"
alias mysql="$MYSQL_HOME/bin/mysql"
