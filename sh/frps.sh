#!/bin/sh
user="frp"
group="frp"
home="/var/lib/frp"

# create group if not exists
egrep "^$group" /etc/group >& /dev/null
if [ $? -ne 0 ]
then
    groupadd $group
fi

# create user if not exists
egrep "^$user" /etc/passwd >& /dev/null
if [ $? -ne 0 ]
then
    useradd -s /sbin/nologin -d /var/lib/frp -g $group $user
fi

# create frp home dir if not exists
if [ ! -d "$home" ]; then
    mkdir "$home"
fi

# download
wget -P /var/lib/frp/ https://raw.githubusercontent.com/gavinning/frp/master/core/frp_0.21.0_linux_amd64/frps
wget -P /var/lib/frp/ https://raw.githubusercontent.com/gavinning/frp/master/core/frp_0.21.0_linux_amd64/frps.ini
wget -P /usr/lib/systemd/system/ https://raw.githubusercontent.com/gavinning/frp/master/core/frp_0.21.0_linux_amd64/frps.service

# owners
chown frp:frp /var/lib/frp/frps
chown frp:frp /var/lib/frp/frps.ini
touch /var/lib/frp/frps.log
chown frp:frp /var/lib/frp/frps.log
chmod +x /var/lib/frp/frps

# status
systemctl status frps
