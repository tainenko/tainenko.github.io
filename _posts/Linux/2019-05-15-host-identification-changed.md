---
layout: post
title:  "WARNING REMOTE HOST IDENTIFICATION HAS CHANGED"
author: tony
categories: [ Linux ]
image: assets/images/Linux-has-you.png
tags: [ linux, host, remote, warning]
---
Whenever you encounter this warning during using ssh to remote server. You can try following solution to solve this problem.

## Warning message
```bash
[root@localhost ~]# ssh 192.168.2.151
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!
Someone could be eavesdropping on you right now (man-in-the-middle attack)!
It is also possible that the RSA host key has just been changed.
The fingerprint for the RSA key sent by the remote host is
7e:68:8c:e5:09:9f:0d:5f:a4:47:07:a5:69:24:9a:bf.
Please contact your system administrator.
Add correct host key in /root/.ssh/known_hosts to get rid of this message.
Offending key in /root/.ssh/known_hosts:33
RSA host key for 192.168.2.151 has changed and you have requested strict checking.
Host key verification failed.
```

## Solution

### 1st method
Remove the ip 192.168.2.151 in known_hosts
```bash
[root@localhost ~]# vim /root/.ssh/known_hosts
```


### 2nd method
Remove the entire file of known_hosts
```bash
[root@localhost ~]# rm -rf  /root/.ssh/known_hosts
```

### 3rd method
Delete the issue ip
```bash
[root@localhost ~]# ssh-keygen -R 192.168.2.151
```
