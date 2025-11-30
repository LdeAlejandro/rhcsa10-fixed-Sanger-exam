
![[Pasted image 20251129052147.png]]


```bash
groupadd sales
useradd -G sales -u 1234 chisha
passwd chisha
useradd -G sales caroline
cat /etc/passwd
useradd -s /usr/sbin/nologin myapp
grep myapp /etc/passwd
```


