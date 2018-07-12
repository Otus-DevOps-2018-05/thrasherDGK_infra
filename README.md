# thrasherDGK_infra
thrasherDGK Infra repository

## Организация SSH подключения
```sh
bastion_IP = 35.204.20.59
someinternal_IP = 10.164.0.3
```

На рабочей станции добавить конфигурацию для ssh клиента
```
# .ssh/config
Host bastion
  HostName {bastion_external_ip}
  IdentityFile ~/.ssh/id_rsa
  ForwardAgent yes

Host someinternalhost
  HostName {someinternalhost_local_ip}
  ProxyJump bastion
```

Для соединиения с bastion хостом: `ssh bastion`

Для соединения с someinternalhost хостом: `ssh someinternalhost`

## Огранизация VPN подключения
Скоприровать конфигурацию OpenVPN клиента. После удачного запуска, для
доступа к someinternalhost можно обращаться по локальному ip: `ssh 10.164.0.3`
