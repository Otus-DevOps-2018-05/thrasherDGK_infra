# thrasherDGK_infra
thrasherDGK Infra repository

## Организация SSH подключения
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
