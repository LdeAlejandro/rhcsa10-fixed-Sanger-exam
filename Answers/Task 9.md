
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
sudo -i

dnf install -y flatpak
```

### Switch to user chisha

```bash
su - chisha
```

### Add the Flatpak repository for this user only

```bash
flatpak remote-add --user userrepo https://dl.flathub.org/repo/flathub.flatpakrepo
```

### Verify the repository

```bash
flatpak remotes --user
```

Expected output should include:

```text
userrepo
```

### Install GIMP for this user only

```bash
flatpak install --user userrepo org.gimp.GIMP -y

#Verify the installation
flatpak list --user
```

Expected output should include:

```bash
org.gimp.GIMP

#Optional verification from root
runuser -u chisha -- flatpak list --user
runuser -u chisha -- flatpak remotes --user
```

Expected output:

```bash
userrepo
### Verify that no system-wide Flatpak repository exists
flatpak remotes
```

