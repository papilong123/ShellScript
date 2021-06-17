# 检查任意一个服务的运行状态

# 只检查服务vsftpd httpd sshd crond、mysql中任意一个服务的状态

# 如果不是这5个中的服务，就提示用户能够检查的服务名并退出脚本

# 如果服务是运行着的就输出 "服务名 is running"

# 如果服务没有运行就启动服务


# 方法1：使用read写脚本
#!/bin/bash
read -p "请输入你的服务名:" service
if [ $service != 'crond' -a $service != 'httpd' -a $service != 'sshd' -a $service != 'mysqld' -a $service != 'vsftpd' ];then
echo "只能够检查'vsftpd,httpd,crond,mysqld,sshd"
exit 5
fi
service $service status &> /dev/null

if [ $? -eq 0 ];thhen
echo "服务在线"
else
service $service start
fi

# 方法2：使用位置变量来写脚本
# if [ -z $1 ];then
# echo "You mast specify a servername!"
# echo "Usage: `basename$0` servername"
# exit 2
# fi
# if [ $1 == "crond" ] || [ $1 == "mysql" ] || [ $1 == "sshd" ] || [ $1 == "httpd" ] || [ $1 == "vsftpd" ];then
# service $1 status &> /dev/null
# if [ $? -eq 0 ];then
# echo "$1 is running"
# else
# service $1 start
# fi
# else
# echo "Usage:`basename $0` server name"
# echo "But only check for vsftpd httpd sshd crond mysqld" && exit2
# fi