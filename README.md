# RHCSA Practice Lab – 15 Tasks

## Task 1: Setting up a Base Server

### Requirements

- Install two RHEL servers as virtual machines, using the minimal installation pattern.
- Use the names server1.example.com and server2.example.com and use DHCP to get an IP address from the local DHCP server. Configure host name resolution for both.
- Use default partitioning.
- Do NOT register the servers with Red Hat.
- Do NOT set a root password.
- Create an administrative user anna with the password "password".

---

## Task 2: Getting Administrative Access

### Requirements

- Use the appropriate solution to reset the root password on server2, assuming that you have lost the root password and you have no administrator access to the server anymore.

---

## Task 3: Configuring Repository Access

### Requirements

- On server1, create an ISO file with the name /rhel10.iso based on the installation DVD.
- Mount this ISO file persistently on the directory /repo and provide access to this directory contents using the Apache webserver, such that it can be used as a repository.
- Configure both servers as a repository client to this server.
- After successfully completing this task, you should be able to install software on both servers.

---

## Task 4: Managing Partitions

### Requirements

- On server1, use your virtualization software to increase the size of your primary disk in such a way that at least 10GiB of unallocated disk space is available.
- In the free disk space, create a 1GiB partition and format it with the ext4 filesystem. Make sure it is mounted persistently using its UUID on the /mnt/files directory.
- Also create a 1GiB swap partition and ensure it is mounted persistently using its UUID.

---

## Task 5: Managing LVM Logical Volumes

### Requirements

- On server1, create a logical volume with the name myfiles. Ensure it uses 8MiB extents.
- Configure the volume to use 75 extents.
- Format it with the xfs filesystem and ensure it mounts persistently on /mnt/data.
- Increase the size of the logical volume by 5GiB.
- If volume groups need to be created, create them as needed.

---

## Task 6: Creating Users and Groups

### Requirements

- On server2, create a user chisha. Ensure she has the password set to "password" and is using UID 1234. She must be a member of the secondary group sales.
- Create user caroline who also is a member of the group sales.
- On server2, create a user myapp. Ensure this user cannot open an interactive shell.

---

## Task 7: Managing Permissions

### Requirements

- On server2, create a shared group directory /data/sales and ensure that chisha is the owner of that directory.
- The owner and the group sales should have permissions to access this directory and read and write files in it. Other users should have no permissions at all.
- Ensure that any new file that is created in this directory is group-owned by the group sales automatically, and can only be deleted by chisha, as well as the user that created the file.

---

## Task 8: Scheduling Jobs

### Requirements

- Schedule a systemd timer job that writes "hello folks" to syslog every Monday through Friday at 2 AM.
- Make sure this job is executed as the user chisha.

---

## Task 9: Managing Containers

### Requirements

- On server2, create a container with the name mydb that runs the mariadb-1011 database as user chisha, using the mariadb-1011 image.
- The host directory /home/chisha/mydb is mounted on the container directory /var/lib/mysql.
- The container is accessible on host port 3306.
- You do not have to create any databases in it.
- Set the database root user password to "password".

---

## Task 9: Managing Flatpak

### Requirements

- On server2, add the Flatpak repository https://dl.flathub.org/repo/flathub.flatpakrepo in such a way that it is accessible for user chisha only.
- As user chisha, install the gimp application from this repository, in such a way that it is accessible for this user only.

---

## Task 10: Managing Autofs

### Requirements

- On server2, create the directories /homes/user1 and /homes/user2. Use NFS to share these directories and ensure the firewall does not block access to these directories.
- On server1, create a solution that automatically, on-demand mounts server2:/homes/user1 on /homes/user1, and also that automatically, on-demand mounts server2:/homes/user2 on /homes/user2 when these directories are accessed.

---

## Task 11: Setting Time

### Requirements

- Configure server1 and server2 as an NTP client for pool.ntp.org.

---

## Task 12: Managing SELinux

### Requirements

- Ensure that the Apache web server is installed on server2 and configure it to offer access on port 82.
- Copy the file /etc/hosts to /tmp/hosts.
- Next, move /tmp/hosts to the directory /var/www/html/hosts and ensure this file can be accessed by the Apache web server.

---

## Task 14: Finding Files

### Requirements

- On server2, find all files in the /usr directory that have either the SUID or the SGID permission set and a size smaller than 100KiB.
- Copy these files to /root/sugidfiles.

---

## Task 15: Finding Patterns in Files

### Requirements

- On server2, find all files in the /etc directory and its subdirectories that contain the text "Administrator" or "administrator".
- Write the names of these files, as well as the lines with the matching text, to the file /root/administratorfiles.txt.

---
