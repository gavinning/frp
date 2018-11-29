frp for centos7
---
[frp](https://github.com/fatedier/frp)  

### Install frps
**via curl**
```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/gavinning/frp/master/sh/frps.sh)"
```

**via wget**
```sh
sh -c "$(wget https://raw.githubusercontent.com/gavinning/frp/master/sh/frps.sh -O -)"
```

### Install frpc
**via curl**
```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/gavinning/frp/master/sh/frpc.sh)"
```

**via wget**
```sh
sh -c "$(wget https://raw.githubusercontent.com/gavinning/frp/master/sh/frpc.sh -O -)"
```

### Usage
```sh
systemctl status frps
systemctl satrt frps
systemctl stop frps
systemctl restart frps

systemctl status frpc
systemctl satrt frpc
systemctl stop frpc
systemctl restart frpc
```

### Config
```
vim /var/lib/frp/frps.ini
vim /var/lib/frp/frpc.ini
```