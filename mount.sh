#!/bin/bash
# In this EXAMPLE change USERNAME, PASSWORD and IP/Path !

sudo mount -t cifs -o uid=1000,gid=1000,file_mode=0775,dir_mode=0775,username=USERNAME,password=PASSWORD //IP/and/path /home/pi/Music/smbmusic
