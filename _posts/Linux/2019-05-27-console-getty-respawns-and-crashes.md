---
layout: post
title:  " Console getty respawns and crashes. "
author: tony
categories: [ Linux ]
image: assets/images/Linux-has-you.png
tags: [ linux, issue]
---
An error was reported in log files (var/log/).   

In particulare in "messages":
```bash
May 30 11:54:41 xxx00962 systemd: Starting Serial Getty on ttyS0...
May 30 11:54:41 xxx00962 systemd: Started Serial Getty on ttyS0.  
May 30 11:54:51 xxx00962 systemd: serial-getty@ttyS0.service holdoff time over, scheduling restart.
May 30 11:54:51 xxx00962 systemd: Stopping Serial Getty on ttyS0...

```

in "secure":
```bash
May 30 15:51:30 xxx00962 agetty[24693]: /dev/ttyS0: not a character device
```
where xxx00962 is the hostname.

## Solution
Currently the proposed changes to the templates from images.linuxcontainers.org don't seem to be implemented. It took me an embarrassingly long time to find the correct commands to disable getty.  

```bash
systemctl stop console-getty
systemctl disable console-getty
systemctl mask console-getty
```

If you don't mask, console-getty will be automatically enabled on the next boot.

