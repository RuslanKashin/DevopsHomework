# Общее описание
Данный плейбук разворачивает на хостах `kibana` и `elascticsearch` (поднятых с помощью `docker-compose`) соответствующие сервисы и `Oracle jdk`.  
Дистрибутивы `jdk`, `kibana` и `elasticsearch` заранее скачаны (скачивание напрямую с сайтов разработчиков на данный момент вызывает трудности из-за блокировок).

# Структура проекта
- `./files` - дистрибутивы jdk, elasticsearch и kibana  
- `./group_vars` - переменные  
    - `./group_vars/all/vars.yml` - общие переменные для всех инстансов  
    - `./group_vars/elasticsearch/vars.yml` - переменные для elasticsearch  
    - `./group_vars/kibana/vars.yml` - переменные для kibana  
- `./inventory/prod.yml` - описание инстансов  
- `./templates` - шаблоны конфигураций приложений  
- **`./site.yml` - непосредственно playbook**

# Подробное описание Playbook
## 1. Install Java
Установка JDK, для данной task установлен тэг `java`, task состоит из следующих plays:
* **Set facts for Java 11 vars** - установка переменных с указанием домашнего пути к JDK
* **Upload .tar.gz file containing binaries from local storage** - загрузка на инстанс дистрибутива JDK из директории 
`files`
* **Ensure installation dir exists** - проверка наличия директории установки, и создание ее при отсутствии
* **Extract java in the installation directory** - распаковка JDK в вышеуказанную директорию
* **Export environment variables** - запуск скрипта конфигурации из директории templates

## 2. Install Elasticsearch
Установка Elasticsearch, для данной task установлен тэг `elastic`, task состоит из следующих plays:
* **Upload .tar.gz Elasticsearch from local storage** - загрузка на инстанс дистрибутива Elasticsearch из директории 
files
* **Create directrory for Elasticsearch** - проверка наличия директории установки, и создание ее при отсутствии
* **Extract Elasticsearch in the installation directory** - распаковка дистрибутива в директорию указанную в групповой 
переменной
* **Set environment Elastic** - запуск скрипта конфигурации из директории templates

## 3. Install Kibana
Установка Kibana, task состоит из следующих plays:
* **Upload tar.gz Kibana from local storage** - загрузка на инстанс дистрибутива Kibana из директории files
* **Create directory for Kibana** - проверка наличия директории установки, и создание ее при отсутствии
* **Extract Kibana in selected directory** - распаковка дистрибутива в директорию указанную в групповой 
переменной
* **Set environment Kibana** - экспорт переменных среды из шаблона template
