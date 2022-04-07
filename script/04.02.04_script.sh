#!/usr/bin/env python3

import socket

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
