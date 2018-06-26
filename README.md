# niceControl_infra
niceControl Infra repository

Домашнее задание №3:

bastion_IP = 35.233.3.231
someinternalhost_IP = 10.132.0.3

 
Задание со слайда 35:

1.Для подключения к машине someinternalhost в одну срочку - нужно использовать ключ -t:
ssh ~/.ssh/appuser -A appuser@35.233.3.231 -t ssh 10.132.0.3

2.Для подключения к someinternalhost по команде ssh someinternalhost нужно использовать следующее:
Редактируем/создаем если не существует файл .ssh/config

Добавляем следующие данные:
Host someinternalhost
	HostName 10.132.0.3
	User appuser
	ProxyCommand ssh -W %h:%p -i ~/.ssh/appuser appuser@35.233.3.231

	
Домашнее задание №4:
testapp_IP = 104.199.105.129
testapp_port = 9292