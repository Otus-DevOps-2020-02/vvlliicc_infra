1. Подключение к someinternalhost в одну команду
```bash
ssh -i ~/.ssh/appuser -J 35.214.142.159 10.164.15.206
```
```bash
Host bastion
StrictHostKeyChecking no
UserKnownHostsFile /dev/null
Hostname 35.214.142.159
User appuser
AddKeysToAgent yes
IdentityFile ~/.ssh/appuser

Host someinternalhost
StrictHostKeyChecking no
UserKnownHostsFile /dev/null
HostName 10.164.15.206
ProxyJump appuser@bastion
User appuser
AddKeysToAgent yes
IdentityFile ~/.ssh/appuser

3.

bastion_IP = 35.214.142.159

someinternalhost_IP = 10.164.15.206