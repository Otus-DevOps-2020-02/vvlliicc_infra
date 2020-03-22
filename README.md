
1. Подключение к someinternalhost в одну команду
```bash
ssh -i ~/.ssh/appuser -J 34.90.137.138 10.164.0.7
```
2. Подключение одной командой ssh someinternalhost
Необходимо добавить в файл .ssh/config
```bash
Host bastion
Hostname 34.90.137.138
User appuser
Host someinternalhost
HostName 10.164.0.7
ProxyJump appuser@bastion
User appuser
```
3.
bastion_IP = 34.90.137.138
someinternalhost_IP = 10.164.0.7
