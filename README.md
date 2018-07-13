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
