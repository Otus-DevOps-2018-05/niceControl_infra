
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
```

# Домашнее задание №5:

## В процессе сделано:
 - С помощью packer создан шаблон создания образа ВМ для возможности поднятия на основе этого образа ВМ на GCP
- С помощью packer создан шаблон создания образа ВМ с возможностью автоматически поднимать приложение при создании ВМ на основе этого образа.



# Домашнее задание №6:

## В процессе сделано:
- С помощью Terraform описано создание ВМ, правил фаерволла.
- __Первое задание со *__: 
     1. С помощью мануалов GCP ([Мануал](https://cloud.google.com/compute/docs/instances/adding-removing-ssh-keys)) и мануала Terraform ([Мануал Terraform](https://www.terraform.io/docs/providers/google/r/compute_project_metadata.html)) - был добавлен ресурс, в котором прописаны дефолтные ssh-keys.
     2. При попытке внести какие-либо ключи, не описанные в Terraform - они удаляются после команды *Terraform apply* - т.к. Terraform приводит проект к описанному состоянию.
     3. До начала выполнения задания в проекте были другие ssh ключи, которые не были описаны в Terraform. При попытке сделать *Terraform apply*  - метаданные не приводились к нужному состоянию. Решение - удалил ключи, которые не были описаны. 
- __Второе задание со **__:
    - С помощью Terraform и мануалов GCP и Terraform описан код создания балансировщика.
    - Введена дополнительная переменная *count* для указания кол-ва поднимаемых инстансов.
    - Проверена доступность приложения в случае падения одного из инстансов по адресу балансировщика 
    - При такой конфигурации вижу проблему - что не происходит редиректа на адрес балансировщика, в случае, если один из инстансов упал, и к нему пытаются достучаться. 




