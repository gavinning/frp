#!/bin/sh
user="frp"
group="frp"
home="/var/lib/frp"
service="frps"

# 创建组
egrep "^$group" /etc/group >& /dev/null
if [ $? -ne 0 ]
then
    groupadd $group
fi

# 创建用户
egrep "^$user" /etc/passwd >& /dev/null
if [ $? -ne 0 ]
then
    useradd -s /sbin/nologin -d /var/lib/frp -g $group $user
fi

# create frp home dir if not exists
if [ ! -d "$home" ]; then
    mkdir -p "$home"
fi

# 下载服务及配置
wget -P /var/lib/frp/ "https://raw.githubusercontent.com/gavinning/frp/master/core/frp_0.21.0_linux_amd64/${service}"
wget -P /var/lib/frp/ "https://raw.githubusercontent.com/gavinning/frp/master/core/frp_0.21.0_linux_amd64/${service}.ini"
wget -P /usr/lib/systemd/system/ "https://raw.githubusercontent.com/gavinning/frp/master/core/frp_0.21.0_linux_amd64/${service}.service"

# 文件及权限配置
touch "/var/lib/frp/${service}.log"
chown frp:frp "/var/lib/frp/${service}"
chown frp:frp "/var/lib/frp/${service}.ini"
chown frp:frp "/var/lib/frp/${service}.log"
chmod +x "/var/lib/frp/${service}"

# 测试服务状态
systemctl status ${service}
