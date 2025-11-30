
![[Pasted image 20251125015452.png]]


Answer

Create user on installation or after

Nos  2 server adicionar usuario

```bash
useradd anna                  
passwd anna
usermod -aG wheel anna
sudo whoami
```

Em os 2 server adicionar o dns,

vim /etc/hosts
```bash
192.168.15.12 server1.example.com server1                            
192.168.15.14 server2.example.com server2
```



