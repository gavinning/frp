#!/bin/sh
user="frp"
group="frp"
home="/var/lib/frp"
service="frps"
latest="frp_0.37.1_linux_amd64"

# 创建组
egrep "^$group" /etc/group >& /dev/null
if [ $? -ne 0 ]
then
    groupadd $group
    echo "create group: ${group}"
fi

# 创建用户
egrep "^$user" /etc/passwd >& /dev/null
if [ $? -ne 0 ]
then
    useradd -s /sbin/nologin -d /var/lib/frp -g $group $user
    echo "create user: ${user} -s /sbin/nologin -d /var/lib/frp"
fi

# create frp home dir if not exists
if [ ! -d "$home" ]; then
    mkdir -p "$home"
fi

# 下载服务及配置
echo "download ${service}"
wget -P /var/lib/frp/ "https://raw.githubusercontent.com/gavinning/frp/master/core/$latest/${service}"
wget -P /var/lib/frp/ "https://raw.githubusercontent.com/gavinning/frp/master/core/$latest/${service}.ini"
wget -P /usr/lib/systemd/system/ "https://raw.githubusercontent.com/gavinning/frp/master/core/$latest/${service}.service"

# 文件及权限配置
touch "/var/lib/frp/${service}.log"
chown frp:frp "/var/lib/frp/${service}"
chown frp:frp "/var/lib/frp/${service}.ini"
chown frp:frp "/var/lib/frp/${service}.log"
chmod +x "/var/lib/frp/${service}"

# 测试服务状态
systemctl status ${service}
