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
```
## ip gcp virtualhost

```bash
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



## HOme work №5


# Установка  packer

packer поставляется бинарником
```bash
    $ cd ~
    $ wget https://releases.hashicorp.com/packer/1.3.3/packer_1.3.3_linux_amd64.zip
    $ unzip packer_1.3.3_linux_amd64.zip
    $ sudo mv packer /usr/lib
    $  rm packer_1.3.3_linux_amd64.zip
проверяем

```bash
    $ packer version
    Packer v1.3.3
```

# Создание образа

Конфигурационный шаблон для packer написан на json

Шаблон содержит три основных блока:

#variables -** задаем переменные ****

#builders -** определяем провайдера и опции для создания образа

#provisioners** - определяем действия после раскатки ОС - производим настройки системы и конфигурации приложений на созданной VM.

**variables** принимает map, **builders** и **provisioners** - массив map. В одном шаблоне можно задать несколько провайдеров ( builders) и провиженов.
**packer** поддерживает следующие провижины:

- Ansible
- Chef
- Salt
- Shell
- Powershell
- win cmd
- file - for copying file from local dir to VM image

# GCP image

Для примера шаблон для создания образа в GCP

ubuntu16.json

    {
       "variables": {
            	"project_id": null,
           	"source_image_family": null,
           	"machine_type": null
            },

      "builders": [
            {
            	"type": "googlecompute",
            	"project_id": "{{user `project_id`}}",
           	"image_name": "reddit-base-{{timestamp}}",
            	"image_family": "reddit-base",
            	"source_image_family": "{{user `source_image_family`}}",
            	"zone": "europe-west1-b",
            	"ssh_username": "muxun",
            	"machine_type": "{{user `machine_type`}}"
            }
     ],

     "provisioners": [
            {
     	        "type": "shell",
       	    	"script": "script/install_ruby.sh",
       	    	"execute_command": "sudo {{.Path}}"
       	    },

            {
    	        "type": "shell",
       	     "script": "script/install_mongodb.sh",
       	     "execute_command": "sudo {{.Path}}"
            }

     ]
    }




project_id и source_image_family имеют значение null, что означает необходимость обязательного определения и не имеет значения по умолчанию. Эти переменный могут быть определены из командной стройки или из файла **variables.json**
