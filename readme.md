frp for centos7
---
[frp](https://github.com/fatedier/frp) 是一款配置简单功能强大的内网穿透工具，支持多种协议，支持点对点穿透  
使用以下方式可以在``centos7.x``上快速部署frp，并且支持使用``systemctl``进行管理  
可根据自身需求选择安装``frps``或``frpc``，更多文档参见 [frp](https://github.com/fatedier/frp)

### Install frps
**curl**
```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/gavinning/frp/master/sh/frps.sh)"
```

**wget**
```sh
sh -c "$(wget https://raw.githubusercontent.com/gavinning/frp/master/sh/frps.sh -O -)"
```

### Install frpc
**curl**
```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/gavinning/frp/master/sh/frpc.sh)"
```

**wget**
```sh
sh -c "$(wget https://raw.githubusercontent.com/gavinning/frp/master/sh/frpc.sh -O -)"
```

### Usage
```sh
systemctl status frps
systemctl start frps
systemctl stop frps
systemctl restart frps
systemctl enable frps
systemctl disable frps

systemctl status frpc
systemctl start frpc
systemctl stop frpc
systemctl restart frpc
systemctl enable frpc
systemctl disable frpc
```

### Config
```
vim /var/lib/frp/frps.ini
vim /var/lib/frp/frpc.ini
```