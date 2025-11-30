
![[Pasted image 20251130025313.png]]

On server2

```bash
vim /etc/ssh/sshd_config
#change PermitRootLogin 
PermitRootLogin yes
```

```bash
systemctl restart sshd
```

On server1
```bash
ssh-keygen
ssh-copy-id server2
```