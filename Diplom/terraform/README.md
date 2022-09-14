### 1. Подготовительные этапы перед запуском:

1. Устанавливаем свежую версию `terraform`.
2. Настраиваем провайдер YC для `terraform` (`~/.terraformrc`)
3. Создаем в YC сервисный аккаунт с ролью `editor`.
4. Генерируем в файл `key.json` ключ доступа и кладем его рядом с фалами `.tf`
     ```
     yc iam key create --service-account-name kashindiplom --output /home/ruslan/myData/DevOps/DevopsHomework/Diplom/terraform/key.json
     ```
5. Создать в YC статический ключ доступа. Данные `access_key` и `secret_key` записываем в файл `keyS3.conf` и кладем его рядом с фалами `.tf`.
   ```
   access_key = "..."
   secret_key = "..."
   ```
6. В файле `variable.tf` указываем 
   - актуальные id из YC (`yc_cloud_id`, `yc_folder_id`) - команда в CLI `yc config list`
   - имя домена для которого создается инфраструктура (`domain_name`, необходимо делегировать домен под управление `ns1.yandexcloud.net` и `ns2.yandexcloud.net`).
   - образ ОС устанавливаемый на создаваемые сервера (`image_id`) - команда в CLI `yc compute image list --folder-id standard-images`.
7. Создаем два воркспейса `stage`(20% ресурса создаваемых серверов) и `prod`(100% ресурса создаваемыз серверов) и работаем в одном из них, для `default` сценарий не работает.
8. В YC создать bucket. В файле `provider.tf` указать его имя `bucket = "..."`.

###  2. Запуск:
1. ```
   terraform init -backend-config=keyS3.conf
   ```
2. ```
   terraform plan
   ```
3. ```
   terraform apply
   ```
###  3. Результат:
1. Создается сеть и две подсети.
2. Создается публичный DNS.
3. Создается статический внешний IP адрес и ресурсные записи в DNS связывающие этот IP с указанным в настройках доменом.
4. Создается 7 машин.
5. В S3 bucket пишется состояние конфигурации terraform.