
![[Pasted image 20251130021616.png]]


```bash
vim /etc/chrony.conf

#change pool 2.rhel.pool.ntp.org iburst to:
pool.ntp.org
```

```bash
Systemctl restart chronyd
```