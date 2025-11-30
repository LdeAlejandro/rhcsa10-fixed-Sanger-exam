
![[Pasted image 20251129033602.png]]

Sudo -i 


```bash
fdisk /dev/sdb
```



![[Pasted image 20251129035943.png]]

Criar volume groups

```bash
vgcreate -s 8M vgfiles /dev/sdb3
```

```bash
lvcreate -n myfiles -l 75 vgfiles
```

```bash
mkdir /mnt/data
```

```bash
mkfs.xfs /dev/vgfiles/myfiles
```

```bash
vim /etc/fstab
```

adicionar o volume logico para montagem persistente

```bash
/dev/vgfiles/myfiles /mnt/data xfs defaults 0 0
```

![[Pasted image 20251129050902.png]]agora aumentar o tamanho do volumen logico em 5GB com a partição de 6G criada anteriormente

validar primeiro os volumes vgs ou lsblk

```bash
vgs 
```

```bash
lsblk
```

![[Pasted image 20251129051117.png]]

```bash
vgextend rhel /dev/sdb4
```

![[Pasted image 20251129051649.png]]

```bash
lvextend -r -L +5G /dev/rhel/root
```

![[Pasted image 20251129052040.png]]
