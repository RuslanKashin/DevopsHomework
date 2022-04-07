#!/usr/bin/env python3

import socket
import yaml
import json

from time import sleep

urls = {"drive.google.com": socket.gethostbyname("drive.google.com"),
        "mail.google.com": socket.gethostbyname("mail.google.com"), 
        "google.com": socket.gethostbyname("google.com")}

for key,value in urls.items():
    print(key + " - " + value)

while True:
    sleep(5)
    print("*************************")
    for key,value in urls.items():
        newvalue = socket.gethostbyname(key)
        if value != newvalue:
            print("[ERROR] " + key + " IP mismatch: " + value + " " + newvalue)
        urls[key] = newvalue
        print(key + " - " + newvalue)
    listOfHosts = []
    for key,value in urls.items():
        host = {key : value}
        listOfHosts.insert(len(listOfHosts),host)    
    with open('data.json', 'w') as outfile_json:
        json.dump(listOfHosts, outfile_json, indent=2)
    with open('data.yml', 'w') as outfile_yml:
        yaml.dump(listOfHosts, outfile_yml)