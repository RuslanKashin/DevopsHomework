#!/usr/bin/env python3

import os

path = os.getcwd() # по-умолчанию будем использовать текущую локальную директорию для поиска локальных репозиториев

bash_command = ["cd " + path, "git status"]
result_os = os.popen(' && '.join(bash_command)).read()

for result in result_os.split('\n'):
    if result.find('modified') != -1:
        prepare_result = result.replace('\tmodified:   ', '')
        print(path + "\\" + prepare_result)