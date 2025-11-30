
![[Pasted image 20251130022717.png]]

```bash
dnf install httpd
```

```bash
vim /etc/httpd/conf/httpd.conf

mudar

#Listen para 82
Listen 82
```

```bash
man semanage-port
```

```bash
semanage port -a -t http_port_t -p tcp 82
```

```bash
systemctl enable --now httpd
```

```bash
cp /etc/hosts /tmp/
mv /tmp/hosts /var/www/html
ls -Z /var/www/html/
restorecon -Rv /var/www/html
ls -Z /var/www/html/

ss -tulnp
```
