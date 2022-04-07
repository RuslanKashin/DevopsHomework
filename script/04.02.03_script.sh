#!/usr/bin/env python3

import os
import sys

path = os.getcwd() # по-умолчанию будем использовать текущую локальную директорию для поиска локальных репозиториев

if len(sys.argv) >= 2:
    path = sys.argv[1]

if not os.path.exists(path + "/.git"):
    print(path + " - path is not a local repository!")
    sys.exit()


bash_command = ["cd " + path, "git status"]
result_os = os.popen(' && '.join(bash_command)).read()

for result in result_os.split('\n'):
    if result.find('modified') != -1:
        prepare_result = result.replace('\tmodified:   ', '')
        print(path + "\\" + prepare_result)
