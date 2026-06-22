
![[Pasted image 20251130013654.png]]

ON SERVER2
```bash
mkdir -p /homes/user{1,2}
ls -l /homes
dnf install nfs-utils

vim /etc/exports

	/homes*(rw,no_root_squash)

systemctl enable --now nfs-server

```

RHCSA

Firewall

```bash
for i in rpc-bind mountd nfs; do firewall-cmd --add-service $i --permanent; donne
firewall-cmd --reload

showmount -e localhost
```

ON SERVER 1

```bash
#cehck server2 mounts form server1
showmount -e server2
dnf install -y nfs-utils
dnf install -y autofs
```

```bash
vim /etc/auto.master
#add
/homes /etc/auto.homes

```

```bash
vim /etc/auto.homes

* -rw server2:/homes/&
```

```bash
systemctl enable --now autofs
```

```bash
cd /homes
cd user1
cd ../user2
```

