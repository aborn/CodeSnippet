rsync 
=========

## INTRO
Rsync is a very common and useful backup tool, this subrepo aims to
configure rsync server and client. *SHELL-SCRIPT*

## FILE-SERVER
* rsync   in server path /etc/default/rsync.
* rsyncd.conf in server path /etc/rsyncd.conf.
* rsyncd.scrt secret file in server /etc/rsyncd.scrt, chmod 600
  rsyncd.scrt (other usrs cannot read, write and excute).
  
## FILE-CLIENT
* rsyncd.scrt as rsyncd.scrt in FILE-SERVER.
* rsyncclient.sh client backup script.
* client.conf clinet configure files.

## HOW-TO-INSTALL
1. in server: configure /etc/default/rsync with ./rsync
2. in server: configure /etc/rsyncd.conf and choose backup directory
3. in server: running rsync as daemon process: sudo /etc/init.d/rsync
   start
4. in client: configure ./client.conf
5. in client: configure ./rsyncclient.sh

## REFS
* link
  [office website](http://rsync.samba.org/ftp/rsync/rsyncd.conf.html
  "rsync manual.")

## CRONTAL
* crontab setting: */30  *  * * * /home/aborn/backup/rsyncclient.sh >> /home/aborn/backup/client.log 2>&1

## AUTHOR
Aborn Jiang (aborn.jiang@gmail.com)

## VERSION
2014-01-21 v0.1 
