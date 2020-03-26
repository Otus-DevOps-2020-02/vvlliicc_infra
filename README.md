## Подключение к someinternalhost в одну команду
```bash
ssh -i ~/.ssh/appuser -J 34.90.137.138 10.164.0.7
```
## Подключение одной командой ssh someinternalhost Необходимо добавить в файл .ssh/config
```bash
Host bastion
StrictHostKeyChecking no
UserKnownHostsFile /dev/null
Hostname 34.90.137.138
User appuser
AddKeysToAgent yes
IdentityFile ~/.ssh/appuser

Host someinternalhost
StrictHostKeyChecking no
UserKnownHostsFile /dev/null
HostName 10.164.0.7
ProxyJump appuser@bastion
User appuser
AddKeysToAgent yes
IdentityFile ~/.ssh/appuser
## ip gcp virtualhost

bastion_IP = 34.90.137.138
someinternalhost_IP = 10.164.0.7
```


## Home work № 4
```bash
testapp_IP = 34.91.217.122
testapp_port = 9292
```

# Команда gcloud для создания инстанса:
```bash
gcloud compute instances create reddit-app --boot-disk-size=10GB --image-family ubuntu-1604-lts --image-project=ubuntu-os-cloud --machine-type=g1-small --tags puma-server --restart-on-failure

```
# Команда для создания правила firewall из консоли gcp

```bash
gcloud compute firewall-rules create default-puma-server --allow=tcp:9292 --source-ranges=0.0.0.0/0 --target-tags=puma-server
```
