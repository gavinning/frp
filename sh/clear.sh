#!/bin/sh
# 慎重使用
# 该脚本将会删除 frp服务，frp用户/用户组，frp相关文件及配置

systemctl stop frps
systemctl stop frpc

userdel -r frp
echo "clear user frp"
echo "clear group frp"

rm -f /usr/lib/systemd/system/frps.service
echo "clear frps service"

rm -f /usr/lib/systemd/system/frpc.service
echo "clear frpc service"

echo "all clear done"
