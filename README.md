## Home work № 4
testapp_IP = 34.91.217.122 testapp_port = 9292

# Команда gcloud для создания инстанса:
```bash
gcloud compute instances create reddit-app --boot-disk-size=10GB --image-family ubuntu-1604-lts --image-project=ubuntu-os-cloud --machine-type=g1-small --tags puma-server --restart-on-failure

```
# Команда для создания правила firewall из консоли gcp

```bash
gcloud compute firewall-rules create default-puma-server --allow=tcp:9292 --source-ranges=0.0.0.0/0 --target-tags=puma-server
```
