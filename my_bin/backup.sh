#!/bin/sh
rsync -avz -e ssh --exclude-from 'exclude-list.txt' ~ af21:~/backup
