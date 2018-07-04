
# niceControl_infra
niceControl Infra repository

# Домашнее задание №3:

bastion_IP = 35.233.3.231

someinternalhost_IP = 10.132.0.3

 
## Задание со слайда 35:

* Для подключения к машине someinternalhost в одну срочку - нужно использовать ключ -t:
    
    ```ssh ~/.ssh/appuser -A      appuser@35.233.3.231 -t ssh 10.132.0.3```
    
* Для подключения к someinternalhost по команде ssh someinternalhost нужно использовать следующее:
1. Редактируем/создаем если не существует файл .ssh/config

2. Добавляем следующие данные:

    ```Host someinternalhost
    HostName 10.132.0.3
    User appuser
    ProxyCommand ssh -W %h:%p -i ~/.ssh/appuser appuser@35.233.3.231

# Домашнее задание №4:
testapp_IP = 104.199.105.129

testapp_port = 9292

* Команда для создания инстанса с использованием startup script:

    ```
    gcloud compute instances create reddit-app-test\
      --boot-disk-size=10GB \
      --image-family ubuntu-1604-lts \
      --image-project=ubuntu-os-cloud \
      --machine-type=g1-small \
      --tags puma-server \
      --zone=europe-west1-b \
      --restart-on-failure \
      --metadata-from-file startup-script=./startup_script.sh

* Для создания правила брандмауэра через консоль, нужно запусть команду:
```
gcloud compute firewall-rules create puma-default-server --target-tags="puma-server" --source-ranges="0.0.0.0/0" --allow tcp:9292




