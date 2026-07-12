# RHCSA Practice Lab – 15 Tasks

## Task 1: Setting up a Base Server

### Requirements

* Install two RHEL servers as virtual machines using the Minimal installation profile.
* Configure the hostnames as:

  * `server1.example.com`
  * `server2.example.com`
* Ensure both servers obtain their network configuration through DHCP.
* Configure local hostname resolution between both servers.
* Use the default storage layout during installation.
* Do not register the servers with Red Hat.
* Do not configure a root password during installation.
* Create an administrative user named `anna`.
* Set the password for user `anna` to `password`.

---

## Task 2: Getting Administrative Access

### Requirements

* On `server2`, reset the root password.
* Set the new root password to `password`.

---

## Task 3: Configuring Repository Access

### Requirements

* On `server1`, create an ISO image named `/rhel10.iso` from the installation media.
* Configure the contents of this ISO image to be mounted persistently on `/repo`.
* Configure Apache to provide HTTP access to the repository contents.
* Configure both `server1` and `server2` to use this repository for software installation.
* Verify that software packages can be installed successfully from both servers.

---

## Task 4: Managing Partitions

### Requirements

* On `server1`, at least 10 GiB of unallocated disk space is available.
* Create a 1 GiB partition and format it with the ext4 filesystem.
* Mount this filesystem persistently on `/mnt/files` using its UUID.
* Create a 1 GiB swap partition.
* Configure the swap partition to be activated persistently using its UUID.

---

## Task 5: Managing LVM Logical Volumes

### Requirements

* On `server1`, create a volume group named `vgfiles` using 8 MiB physical extents.
* Create a logical volume named `myfiles` consisting of 75 extents.
* Format the logical volume with the XFS filesystem.
* Mount it persistently on `/mnt/data`.
* Extend the root logical volume by 5 GiB.
* Create any required physical volumes and volume groups as needed.

---

## Task 6: Creating Users and Groups

### Requirements

* On `server2`, create a group named `sales`.
* Create a user named `chisha` with:

  * UID `1234`
  * password `password`
  * secondary group membership in `sales`
* Create a user named `caroline` and ensure she is also a member of the `sales` group.
* Create a user named `myapp`.
* Configure `myapp` so that interactive login is not possible.

---

## Task 7: Managing Permissions

### Requirements

* On `server2`, create the directory `/data/sales`.
* Ensure user `chisha` owns the directory.
* Ensure members of group `sales` can create, modify and access files in this directory.
* Ensure users outside the group have no access.
* Ensure newly created files inherit group ownership from group `sales`.
* Ensure files in this directory can only be deleted by:

  * the file owner
  * user `chisha`
  * root

---

## Task 8: Scheduling Jobs

### Requirements

* Configure a user systemd timer for user `chisha`.
* The timer must execute Monday through Friday at 02:00.
* The timer must write the message:

```text
hello folks
```

to syslog.

---

## Task 9: Managing Containers

### Requirements

* As user `chisha` on `server2`, create a container named `mydb`.
* Use image `registry.redhat.io/rhel10/mariadb-1011`.
* Configure the host directory `/home/chisha/mydb` to be mounted on `/var/lib/mysql` inside the container.
* Configure the container to be accessible on TCP port `3306` on the host.
* Set the MariaDB root password to `password`.
* No databases need to be created.

---

## Task 9: Managing Flatpak

### Requirements

* On `server2`, configure the Flathub repository:

```text
https://dl.flathub.org/repo/flathub.flatpakrepo
```

* The repository must be available only to user `chisha`.
* Install the GIMP application as user `chisha`.
* Ensure the application is available only to user `chisha`.

---

## Task 10: Managing Autofs

### Requirements

### On server2

* Create the directories:

  * `/homes/user1`
  * `/homes/user2`
* Share these directories using NFS.
* Ensure firewall settings allow access to the NFS shares.

### On server1

* Configure automatic on-demand mounting so that:

  * `server2:/homes/user1` is mounted on `/homes/user1`
  * `server2:/homes/user2` is mounted on `/homes/user2`

* Mounts must occur automatically when the directories are accessed.

---

## Task 11: Setting Time

### Requirements

* Configure `server1` and `server2` to synchronize time using:

```text
pool.ntp.org
```

---

## Task 12: Managing SELinux

### Requirements

* Ensure the Apache web server is installed on `server2`.
* Configure Apache to listen on TCP port `82`.
* Copy `/etc/hosts` to `/tmp/hosts`.
* Move `/tmp/hosts` to `/var/www/html/hosts`.
* Ensure the file can be accessed through the Apache web server while SELinux remains enforcing.

---

## Task 13: Managing SSH Access

### Requirements

* Configure SSH key-based authentication between `server1` and `server2`.
* Ensure the `root` user on `server1` can log in to `server2` without being prompted for a password.
* The login process must complete automatically after the initial configuration.

---

## Task 14: Finding Files

### Requirements

* On `server2`, locate all regular files under `/usr` that:

  * have either SUID or SGID permissions set
  * are smaller than 100 KiB
* Copy all matching files to `/root/sugidfiles`.

---

## Task 15: Finding Patterns in Files

### Requirements

* On `server2`, search the `/etc` directory and all of its subdirectories for occurrences of:

  * `Administrator`
  * `administrator`
* Save both the matching filenames and matching lines to:

```text
/root/administratorfiles.txt
```
