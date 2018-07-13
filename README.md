# thrasherDGK_infra
thrasherDGK Infra repository

## ДЗ №3. Знакомство с облачной инфраструктурой и облачными сервисами.

### Организация SSH подключения
```sh
bastion_IP = 35.204.20.59
someinternalhost_IP = 10.164.0.3
```

На рабочей станции добавить конфигурацию для ssh клиента
```
# .ssh/config
Host bastion
  HostName {bastion_IP}
  IdentityFile ~/.ssh/id_rsa
  ForwardAgent yes

Host someinternalhost
  HostName {someinternalhost_IP}
  ProxyJump bastion
```

Для соединиения с bastion хостом: `ssh bastion`

Для соединения с someinternalhost хостом: `ssh someinternalhost`

### Огранизация VPN подключения
Скоприровать конфигурацию OpenVPN клиента. После удачного запуска, для
доступа к someinternalhost можно обращаться по локальному ip: `ssh 10.164.0.3`

## ДЗ №4. Основные сервисы Google Cloud Platform (GCP).

### Создание новых инстансов сервера приложения с помощью startup скрипта
Адрес развернутого инстанса приложения
```
testapp_IP = 35.204.180.241
testapp_port = 9292
```

Из терминала создаем новые инстансы приложения с помощью следующей команды:
```bash
gcloud compute instances create reddit-app \
--boot-disk-size=10GB \
--image-family ubuntu-1604-lts \
--image-project=ubuntu-os-cloud \
--machine-type=g1-small \
--tags puma-server \
--restart-on-failure \
--metadata-from-file startup-script=startup.sh
```

### Создание правила firewall для порта 9292 из gcloud утилиты
```bash
gcloud compute firewall-rules create default-puma-server \
--target-tags puma-server \
--allow tcp:9292
```
