
![[Pasted image 20251130004030.png]]

![[Pasted image 20251130040516.png]]

Containers

```bash
su - chisha
dnf install -y podman
podman search mariadb-1011
podman login registry.redhat.io
mkdir mydb
podman unshare chown 27:27 mydb
ls -Zd mydb/
ls -ld mydb/
podman unshare ls -ld mydb
podman run -d -p 3306:3306 -e MARIADB_ROOT_PASSWORD=password -v /home/chisha/mydb:/var/lib/mysql:Z registry.redhat.io/rhel10/mariadb-1011

podman ps
podman ps -a
podman logs 12c

podman run -d -p 3306:3306 --name mydb -e MYSQL_ROOT_PASSWORD=password -v /home/chisha/mydb:/var/lib/mysql:Z registry.redhat.io/rhel10/mariadb-1011

podman ps
ls -Z mydb/

```

---
### Install Flatpak

```bash
dnf install flatpak

# add repository only for chisha

su - chisha

flatpak remote-add --user userrepo https://dl.flathub.org/repo/flathub.flatpakrepo

# verify repository

flatpak remotes --user

# install gimp only for chisha

flatpak install --user gimp

# verify installation

flatpak list --user

# optional verification as root

exit

runuser -u chisha -- flatpak list --user
```

