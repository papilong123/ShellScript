# 每周日半夜23点半，对数据库服务器上的webdb库做完整备份

# 每备份文件保存到系统的/mysqlbak目录里
# 用系统日期做备份文件名 webdb-YYYY-mm-dd.sql
# 每次完整备份后都生成新的binlog日志
# 把当前所有的binlog日志备份到/mysqlbinlog目录下

#mkdir /mysqlbak 
#mkdir /mysqlbinlog
#service mysqld start
cd /shell
#vi webdb.sh
#!/bin/bash
day=`date +%F`
mysqldump -hlocalhost -uroot -p123 webdb > /mysqlbak/webdb-${day}.sql
mysql -hlocalhost -uroot -p -e "flush logs"
tar zcf /mysqlbinlog.tar.gz /var/lib/mysql/mysqld-bin.0*
#chmod +x webdb.sh 
#crontab -e
30 23 * * 7 /shell/webdb.sh