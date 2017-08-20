#
# mysql的环境alias
#
MYSQL_HOME=/Users/horizon/soft/package/mysql
MYSQL_CONF_HOME=/Users/horizon/soft/config/mysql
alias mysqld_safe="cd $MYSQL_HOME && nohup $MYSQL_HOME/bin/mysqld_safe --defaults-file=$MYSQL_CONF_HOME/my.cnf & > /tmp/mysql.start.log"
alias mysqladmin="$MYSQL_HOME/bin/mysqladmin -uroot -p"
alias mysql="$MYSQL_HOME/bin/mysql"
