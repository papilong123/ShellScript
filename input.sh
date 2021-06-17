# 一个简单的网站论坛测试脚本
# 用交互式的输入方法实现自动登录论坛数据库，修改用户密码


#!/bin/bash

End=ucenter_members
MYsql=/home/lnmp/mysql/bin/mysql

read -p "Enter a website directory : " webdir
WebPath=/home/WebSer/$webdir/config
echo $WebPath

read -p "Enter dbuser name : " dbuser
echo $dbuser

read -sp "Enter dbuser password : " dbpass

read -p "Enter db name : " dbname
echo $dbname

read -p "Enter db tablepre : " dbtablepre
echo $dbtablepre

Globalphp=`grep "tablepre*" $WebPath/config_global.php |cut -d "'" -f8`
Ucenterphp=`grep "UC_DBTABLEPRE*" $WebPath/config_ucenter.php |cut -d '.' -f2 | awk -F "'" '{print $1}'`

if [ $dbtablepre == $Globalphp ] && [ $dbtablepre == $Ucenterphp ];then

     Start=$dbtablepre
     Pre=`echo $Start$End`

     read -p "Enter you name : " userset
     echo $userset

     Result=`$MYsql -u$dbuser -p$dbpass $dbname -e "select username from $Pre where username='$userset'\G"|cut -d ' ' -f2|tail -1`
     echo $Result
     if [ $userset == $Result ];then
           read -p "Enter your password : " userpass
           passnew=`echo -n $userpass|openssl md5|cut -d ' ' -f2`

           $MYsql -u$dbuser -p$dbpass $dbname -e "update $Pre set password='$passnew' where username='$userset';"
           $MYsql -u$dbuser -p$dbpass $dbname -e "flush privileges;"
     else
           echo "$userset is not right user!"
           exit 1
     fi
else
     exit 2
fi