## HW Ansible-4
Научились локальной разработке при помощи Vagrant, доработке ролей для провижининга в Vagrant

## HW Ansible-1
Научились устанавливать anslible.
Разобрались с настройкой файла inventory и inventory.yml
Изучили модули command,shell,service,systemd,git.
создали плейбук который выполняет клонирование репозитория.
После выполенения комманды с удалением репозитория , и повторным запуском плейбука добавилось уведомление changed=1, так как дирретори небыло плейбкук ее создал.

```bash
ssh -i ~/.ssh/appuser -J 35.214.142.159 10.164.15.206
```
2. Подключение одной командой ssh someinternalhost
Необходимо добавить в файл .ssh/config

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

## HW Ansible-2
Научились использовать :
Плейбуки, хендлеры и шаблоны для конфигурации окружения и деплоя тестового приложения. Подход один плейбук, один сценарий (play)
Один плейбук, но много сценариев
Много плейбуков.
Настройка провижн образов Packer на Ansible-плейбуки
```
3.
bastion_IP = 35.214.142.159
someinternalhost_IP = 10.164.15.206


## HW Ansible-3

Разделили плейбуки в раздельные роли
Создали два окружения
Использовали коммьюнити роль nginx
Использовали Ansible Vault для наших окружений

